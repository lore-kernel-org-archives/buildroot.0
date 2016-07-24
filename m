From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Jul 2016 16:24:37 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix gnulib issue with musl and
 uClibc toolchains
In-Reply-To: <20160724161727.3dd16709@free-electrons.com>
References: <1469292622-32034-1-git-send-email-romain.naour@gmail.com>
 <20160724155515.73be1284@free-electrons.com>
 <d39c775a-c185-71bd-007d-6139ba54e9d4@gmail.com>
 <20160724161727.3dd16709@free-electrons.com>
Message-ID: <9f0b5f73-7c32-2a3d-7ed1-d15869b6f855@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/07/2016 ? 16:17, Thomas Petazzoni a ?crit :
> Hello Romain,
> 
> On Sun, 24 Jul 2016 16:13:30 +0200, Romain Naour wrote:
> 
>>> I tested the following defconfig:
>>>
>>> BR2_arm=y
>>> BR2_cortex_a9=y
>>> BR2_ARM_ENABLE_VFP=y
>>> BR2_TOOLCHAIN_EXTERNAL=y
>>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>>> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>>> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2016.05-1162-g94c7298.tar.bz2"
>>> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
>>> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_6=y
>>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
>>> BR2_TOOLCHAIN_EXTERNAL_CXX=y
>>> BR2_INIT_NONE=y
>>> BR2_SYSTEM_BIN_SH_NONE=y
>>> # BR2_PACKAGE_BUSYBOX is not set
>>> BR2_PACKAGE_GDB=y
>>> BR2_PACKAGE_GDB_SERVER=y
>>> BR2_PACKAGE_GDB_DEBUGGER=y
>>> # BR2_TARGET_ROOTFS_TAR is not set
>>>
>>> and did not encounter any problem.
> 
> Seems like you missed this part of my e-mail. I was *not* able to
> reproduce the build problem.

Sorry...

> 
>>> If you can still reproduce the problem, isn't it solved by:
>>>
>>> GDB_CONF_ENV += gl_cv_func_gettimeofday_clobber=no  
>>
>> Ha! yes, gdb build fine with this! (musl and uClibc)
>>
>> Do you want to fix this locally (Reported-by) or I should resend a patch ?
> 
> Please send a patch, but please indicate which configuration fails for
> you, as I was unable to reproduce the issue.

The issue appear with gdb 7.11.1 only, that's due to bundled gnulib version has
been updated.
We didn't see this issue in the autobuilders since gdb 7.11.1 is not tested (not
the default Kconfig choice)

Anyway, I tested your proposal with gdb 7.11.1 and it working well :)

I'll resend the patch in a moment.

Best regards,
Romain


> 
> Thanks!
> 
> Thomas
> 
