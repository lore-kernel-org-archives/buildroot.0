From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 09:11:19 +0100
Subject: [Buildroot] [PATCH] u-boot: u-boot SPL is usually under ./spl/
In-Reply-To: <CAOQ7t2bGKQ7y_9ap1AMxi9On8Z_CqUTJDwDPcG3XEM+9KMzrQw@mail.gmail.com>
References: <1362329351-7738-1-git-send-email-carlo.caione@gmail.com>
 <20130303192824.2a2faf5d@skate>
 <CAOQ7t2ZJsu5u706BHJsuX6vOPgB5_oUJfF05EZYESpCjunvb=Q@mail.gmail.com>
 <20130303205242.423ad324@skate>
 <CAOQ7t2bGKQ7y_9ap1AMxi9On8Z_CqUTJDwDPcG3XEM+9KMzrQw@mail.gmail.com>
Message-ID: <20130304091119.70e4c949@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Caione,

On Sun, 3 Mar 2013 21:53:16 +0100, Carlo Caione wrote:

> > What about setting BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin" ?
> 
> Well, honestly I don't like it (not really clean) but I'll go for it
> if there is no other way :)

Well, in this specific case, I think it's probably the out of tree
uboot-sunxi thing that does not comply with normal U-Boot practices. I
think in U-Boot mainline, the SPL, whatever its name is, is always
finally installed in the main source directory at the end of the build.

If you really want, we can tune the boot/uboot.mk logic so that it
search $(@D) and $(@D)/spl, but I would rather suggest to fix
uboot-sunxi instead :)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
