From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 14 Nov 2020 16:19:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to version
 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07
In-Reply-To: <20201008215931.0a4056cd@windsurf.hq.k.grp>
References: <20201002155931.1529915-1-romain.naour@gmail.com>
 <20201002155931.1529915-2-romain.naour@gmail.com>
 <20201008215931.0a4056cd@windsurf.hq.k.grp>
Message-ID: <ca30d14c-6182-f97b-56c5-e206ed2839e2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Sorry for my late reply...

Le 08/10/2020 ? 21:59, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Fri,  2 Oct 2020 17:59:31 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> - Support for Synopsys ARC HS cores (ARCv2 ISA) running Linux has been added.
>>   Remove the ARC specific version.
>>
>> - Remove --enable-obsolete-rpc configure option.
> 
> If I read this, and upstream glibc commit
> 5500cdba4018ddbda7909bc7f4f9718610b43cf0, it's not just the
> --enable-obsolete-rpc flag that has been removed, but really all the
> RPC code.
> 
> Therefore, with glibc 2.32, this is no longer true:
> 
> config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>         bool "glibc"
> 	[...]
>         # our glibc.mk enables RPC support
>         select BR2_TOOLCHAIN_HAS_NATIVE_RPC

Indeed, we need to remove it.

> 
> So to me, it seems like this needs a bit more work. Could you for
> example try to build libnfs, with glibc 2.32, and libtirpc disabled ?

libnfs already select libtirpc when BR2_TOOLCHAIN_HAS_NATIVE_RPC is not set
(musl or uclibc).
So we can't use libnfs without BR2_TOOLCHAIN_HAS_NATIVE_RPC and libtirpc
package. Each packages that require RPC seems to do the same.
So, I don't think there is something to do at Buildroot level but we need to do
some runtime testing (I hope libnfs is working with uclibc or musl :p ).

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
