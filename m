From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Oct 2011 11:39:02 +0200
Subject: [Buildroot] Status of valgrind on powerpc
In-Reply-To: <CAAXf6LUKtv1Cs-gEfGj4Aq9wLe3N0tiKHDxniv39dW+RwoQOjw@mail.gmail.com>
References: <CAAXf6LUVQc9JRgoOiKy84BnsiRLqXOxHbd6k+1RzQMpRQA4T0w@mail.gmail.com>
 <20110929121549.4bb68988@skate> <20110930214150.770f09e1@skate>
 <CAAXf6LUKtv1Cs-gEfGj4Aq9wLe3N0tiKHDxniv39dW+RwoQOjw@mail.gmail.com>
Message-ID: <20111001113902.2aeff98d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Sep 2011 23:12:52 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> An eglibc toolchain built with crosstool-ng, also works (both
> compilation as running on target).

Ok. It would be good to identify whether Valgrind can be built with
uClibc with additional configuration options, or if glibc/eglibc is
really needed. In the former case, additional documentation in the
Config.in help would be good. In the latter case, some additional
"depends on" to hide valgrind when uClibc is used would be nice.

> To run properly, though, valgrind needs an unstripped ld.so
> I worked around this by adding ld.so as an exception to the strip
> command in target-finalize (but am hoping for inclusion of Sven
> Neumann's 'exclude-from-strip' patch)

Ok.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
