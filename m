From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 21:00:38 +0100
Subject: [Buildroot] [PATCH] external-toolchain: Detect linux/version.h
 via cross compiler
In-Reply-To: <20201023093641.619746-1-raj.khem@gmail.com>
References: <20201023093641.619746-1-raj.khem@gmail.com>
Message-ID: <20201103210038.2afaada6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Khem,

Thanks for the patch.

On Fri, 23 Oct 2020 02:36:41 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> Using linux/version.h is assumed to be hardcoded inside sysroot but this
> does not consider the case where toolchains might be built with
> --with-native-system-header-dir which means the header directories will
> not be under <sysroot>/usr/include but customized, archlinux, debian
> built cross toolchains use these install settings ( due to multiarch )
> they have the headers installed like /usr/aarch64-linux-gnu/include and
> not /usr/aarch64-linux-gnu/usr/include

I am wondering how this can work with Buildroot. Indeed all the logic
of our external toolchains consists in copying the external toolchain
sysroot to $STAGING_DIR, and then pointing the cross-compiler to it
using --sysroot. But if the toolchain headers are not inside the
sysroot, I think we would not copy them to STAGING_DIR, and therefore
the rest of the Buildroot logic would not work.

Could you give more details on how this work with regard to how we're
copying the sysroot to STAGING_DIR ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
