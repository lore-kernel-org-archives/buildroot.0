From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 11:21:42 +0200
Subject: [Buildroot] Thread support in Cortex m4 toolchains,
 was: Re: Update of Buildroot toolchains on autobuild.b.o
References: <20160608220152.5b54ea7d@free-electrons.com>
 <XnsA625B1BC8388EID313208userindividu@bernd-kuhls.de>
 <20160612182040.1c4ea274@free-electrons.com>
 <20160613214825.GJ2584@waldemar-brodkorb.de>
 <j0i43dx88l.ln2@ID-313208.user.individual.net>
 <20160616211723.GW2584@waldemar-brodkorb.de>
Message-ID: <6q4i3dx42j.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 16 Jun 2016 23:17:24 +0200 schrieb Waldemar Brodkorb:

> Hi Bernd,
> Bernd Kuhls wrote,
> 
>> Afaics we have two choices: Fix the thread support in gcc or remove the
>> setting that the m4 toolchain supports threads.
> 
> I would prefer first choice.
> Can you try something like the attached patch for your gcc build?

Hi,

thanks for the patch, I tested it with gcc-4.9.3 using this defconfig:

BR2_arm=y
BR2_cortex_m4=y
BR2_KERNEL_MIRROR="https://www.kernel.org/pub"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_JLEVEL=16
# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
BR2_KERNEL_HEADERS_4_5=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

and could compile boost as well.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested boost)

Regards, Bernd
