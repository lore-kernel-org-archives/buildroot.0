From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 16:24:30 +0200
Subject: [Buildroot] [PATCH 1/2] boot/syslinux: fix build of efi part
 with gnu-efi 3.0.10
In-Reply-To: <20200324142356.1487610-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 24 Mar 2020 15:23:55 +0100")
References: <20200324142356.1487610-1-thomas.petazzoni@bootlin.com>
Message-ID: <87y2r6hx7l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The following defconfig:
 > BR2_x86_i686=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 > BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2"
 > BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
 > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 > BR2_TOOLCHAIN_EXTERNAL_CXX=y
 > BR2_INIT_NONE=y
 > BR2_TARGET_SYSLINUX=y
 > BR2_TARGET_SYSLINUX_EFI=y

 > fails to build due to missing setjmp/longjmp definitions, which is a
 > consequence of a change introduced between gnu-efi 3.0.9 and 3.0.10.

 > This build failure is fixed by adding another syslinux paytch, which
 > has been submitted upstream.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
