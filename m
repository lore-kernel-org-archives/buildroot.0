From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Oct 2012 23:10:38 +0200
Subject: [Buildroot] no /dev/console;
 /dev/null when booting with initrd of type 'ext2'
In-Reply-To: <507E9EB7.3010008@wanadoo.fr>
References: <507D6C50.4060607@wanadoo.fr> <507D86C9.2050008@mind.be>
 <507E9EB7.3010008@wanadoo.fr>
Message-ID: <20121017231038.582d4198@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Wed, 17 Oct 2012 14:04:07 +0200, Thierry Bultel wrote:

> FYI, I have hacked into "iso9660.mk"
> 
> diff -r1.1.1.1 iso9660.mk
> 18c18
> < $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux
> rootfs-ext2 grub
> ---
> > $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux
> rootfs-cpio grub
> 22a23
> 
> 25c26
> <     cp $(BINARIES_DIR)/rootfs.ext2 $(ISO9660_TARGET_DIR)/initrd
> ---
> >     cp $(BINARIES_DIR)/rootfs.cpio $(ISO9660_TARGET_DIR)/initrd
> 
> and it works perfectly without having to use the
> "device_table_dev.txt"

Could you send a proper Git patch for that? See
http://elinux.org/Buildroot_how_to_contribute.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
