From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 11 Aug 2015 10:27:54 -0400
Subject: [Buildroot] [PATCH] fs: cpio: uImage depends on U-Boot
In-Reply-To: <20150811101731.150c1b7e@free-electrons.com>
References: <1439237106-18033-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <55C9A3A2.5040300@green-communications.fr>
 <20150811101731.150c1b7e@free-electrons.com>
Message-ID: <20150811142750.GA24631@ketchup.touchtunes.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas, Thomas,

On 15-08-11 10:17:31, Thomas Petazzoni wrote:
> Dear Nicolas Cavallari,
> 
> On Tue, 11 Aug 2015 09:26:26 +0200, Nicolas Cavallari wrote:
> > On 10/08/2015 22:05, Vivien Didelot wrote:
> > > Even though some bootloaders such as Barebox can boot uImage, this
> > > format is quite U-Boot specific. So make BR2_TARGET_ROOTFS_CPIO_UIMAGE
> > > depends on BR2_TARGET_UBOOT.
> > 
> > What if you already have a U-Boot binary compiled by your board vendor ?
> 
> Agreed. Even if uImage is indeed mainly U-Boot specific, I agree that
> you may not be building U-Boot with Buildroot, or it might be used in
> other contexts.

That is true.

> I'll mark Vivien's patch as Rejected in patchwork.

My initial concern was seeing the BR2_TARGET_ROOTFS_CPIO_UIMAGE entry
when enabling BR2_TARGET_ROOTFS_ISO9660 (this last one depends on
BR2_TARGET_GRUB, BR2_TARGET_GRUB2 or BR2_TARGET_SYSLINUX_ISOLINUX).

Should we make them exclusive?

    config BR2_TARGET_ROOTFS_CPIO_UIMAGE
        depends on !BR2_TARGET_ROOTFS_ISO9660

Or is that OK to display such options?

Thanks,
-v
