From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 30 Sep 2011 23:12:52 +0200
Subject: [Buildroot] Status of valgrind on powerpc
In-Reply-To: <20110930214150.770f09e1@skate>
References: <CAAXf6LUVQc9JRgoOiKy84BnsiRLqXOxHbd6k+1RzQMpRQA4T0w@mail.gmail.com>
 <20110929121549.4bb68988@skate> <20110930214150.770f09e1@skate>
Message-ID: <CAAXf6LUKtv1Cs-gEfGj4Aq9wLe3N0tiKHDxniv39dW+RwoQOjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 30, 2011 at 9:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 29 Sep 2011 12:15:49 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>
>> I think I did the compile test with a CodeSourcery glibc based
>> toolchain for PowerPC. Maybe I have missed build problems with uClibc.
>
> I confirm that it builds fine with the freescale-4.4 PowerPC toolchain
> of CodeSourcery.

An eglibc toolchain built with crosstool-ng, also works (both
compilation as running on target).

To run properly, though, valgrind needs an unstripped ld.so
I worked around this by adding ld.so as an exception to the strip
command in target-finalize (but am hoping for inclusion of Sven
Neumann's 'exclude-from-strip' patch)

Best regards,
Thomas
