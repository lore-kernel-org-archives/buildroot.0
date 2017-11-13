From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 13 Nov 2017 17:07:14 +0000
Subject: [Buildroot] [PATCH] Linux: Clear CONFIG_INITRAMFS_SOURCE if
 BR2_TARGET_ROOTFS_INITRAMFS is not set
In-Reply-To: <878tfas2b6.fsf@dell.be.48ers.dk>
References: <20171113043416.43750-1-didin@synopsys.com>
 <878tfas2b6.fsf@dell.be.48ers.dk>
Message-ID: <1510592834.6361.73.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, 2017-11-13 at 15:03 +0100, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:
> 
> ?> This patch makes sure CONFIG_INITRAMFS_SOURCE option gets reset
> ?> when BR2_TARGET_ROOTFS_INITRAMFS is not set. Some kernel defconfigs,?
> ?> for example for ARC processors, set CONFIG_INITRAMFS_SOURCE value, which cause such error:
> ?> "./scripts/gen_initramfs_list.sh: Cannot open '../../arc_initramfs_hs/'"
> 
> I'm not sure. I really would like to keep our "magic" .config fixups to
> a minimum as they are kind of hidden and force specific use cases
> without any options of disabling it (E.G. perhaps somebody has a
> prebuilt initramfs they would like to include even though buildroot
> builds the real rootfs (so BR2_TARGET_ROOTFS_INITRAMFS is not set). With
> this change, this is no longer possible.

Well a couple of things I was thinking about:
1. This would be [in my view] just a complimentary option to setting BR's rootfs.
2. Usage of prebuilt initramf with BR might be quite a tricky thing because
? ?different toolchain could be used with different ABI, libc etc so chances
? ?are quite high that user-space stuff built with BR will be incompatible with
? ?contents of prebuilt rootfs. But I guess we cannot stop people from doing that.

> Couldn't you fix these arc specific defconfig issues with a small
> kconfig fragment instead?

So maybe this is indeed a bit better solution even though we know nobody
who'd do such a trick with pre-built initramfs.

-Alexey
