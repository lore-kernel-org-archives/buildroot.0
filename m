From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Dec 2011 18:18:53 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <4EDE32C3.7020400@neotion.com>
References: <4EDE32C3.7020400@neotion.com>
Message-ID: <201112131818.53512.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 06 December 2011 16:20:35 Emmanuel BOUAZIZ wrote:
> On the PXE server, I put these kernel parameters: append vga=0x305 fbcon=scrollback:4096k initrd=rootfs.squashfs

 Hm, my assumption that you would only use an initramfs with a 
cpio archive was clearly wrong.  So perhaps we should execute the 
ROOTFS_CPIO_ADD_INIT hook unconditionally for all filesystems?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
