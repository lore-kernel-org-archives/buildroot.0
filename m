From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Sep 2013 09:14:16 -0300
Subject: [Buildroot] [PATCH] gcc-initial: Add host-elf2flt dependency
 when BR2_PACKAGE_HOST_ELF2FLT=y
In-Reply-To: <20130904181958.36251b69@skate>
References: <1378307915.5313.1.camel@phoenix> <20130904181958.36251b69@skate>
Message-ID: <52305E98.7040202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/2013 01:19 PM, Thomas Petazzoni wrote:

> Dear Axel Lin,
> 
> On Wed, 04 Sep 2013 23:18:35 +0800, Axel Lin wrote:
>> It's needed for some uClibc combination, link-flat.so which uses elf2flt
>> pulls in libgcc according to uclibc/Makerules (used in uclibc/libc/Makefile.in).
>> Thus pull it in for gcc-initial.
>>
>> This also ensures elf2flt is ready when BR2_PACKAGE_HOST_ELF2FLT=y before
>> building other packages.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> 
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Actually pulling in host-elf2flt should depend on BINFMT_FLAT rather
than the package being selected, as per the patch i've just sent.
Regards.
