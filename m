From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:20:58 +0200
Subject: [Buildroot] [PATCHv2 08/15] fs/iso9660: support building a real
 iso9660 filesystem
In-Reply-To: <20150614151740.GF3615@free.fr>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150614151740.GF3615@free.fr>
Message-ID: <20150614232058.7fe8d702@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 14 Jun 2015 17:17:40 +0200, Yann E. MORIN wrote:

> I have to admit I was not very confortable reviewing this patch, because
> the splashscreen settign are split in two locations, and checking all
> possible code paths (not that many, but still) to ensure splashscreen
> was either properly copied or disabled, was not trivial.

Yes, the splashscreen handling is split because:

 * We want to remove the splashscreen related line in menu.lst if Grub
   hasn't been built with splashscreen support, and this in both
   iso9660 as the real root filesystem *and* iso9660 using
   initrd/initramfs.

 * We want to copy the splashscreen image to the temporary target dir
   only if we're doing iso9660 using initrd/initramfs (not needed if
   iso9660 is the real root filesystem, since the splashscreen has
   already been installed by grub.mk).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
