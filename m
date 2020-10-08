From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 21:59:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to version
 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07
In-Reply-To: <20201002155931.1529915-2-romain.naour@gmail.com>
References: <20201002155931.1529915-1-romain.naour@gmail.com>
 <20201002155931.1529915-2-romain.naour@gmail.com>
Message-ID: <20201008215931.0a4056cd@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Fri,  2 Oct 2020 17:59:31 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> - Support for Synopsys ARC HS cores (ARCv2 ISA) running Linux has been added.
>   Remove the ARC specific version.
> 
> - Remove --enable-obsolete-rpc configure option.

If I read this, and upstream glibc commit
5500cdba4018ddbda7909bc7f4f9718610b43cf0, it's not just the
--enable-obsolete-rpc flag that has been removed, but really all the
RPC code.

Therefore, with glibc 2.32, this is no longer true:

config BR2_TOOLCHAIN_BUILDROOT_GLIBC
        bool "glibc"
	[...]
        # our glibc.mk enables RPC support
        select BR2_TOOLCHAIN_HAS_NATIVE_RPC

So to me, it seems like this needs a bit more work. Could you for
example try to build libnfs, with glibc 2.32, and libtirpc disabled ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
