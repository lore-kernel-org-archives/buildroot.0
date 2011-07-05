From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 21:23:50 +0200
Subject: [Buildroot] [PATCH 03/28] linux: make it possible to install
 the kernel in /boot
In-Reply-To: <201107042348.43715.yann.morin.1998@anciens.enib.fr>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <8f2cdc43b7b0efaf09e1f1be70019f9cdc0cb8ec.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107042348.43715.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110705212350.44b75765@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 4 Jul 2011 23:48:43 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> If we install the kernel in /boot, why do we stil install it in
> ${BINARIES_DIR} ?

Good idea, done.

I have also added a depends on !BR2_TARGET_ROOTFS_INITRAMFS on this
option, because it wouldn't make sense to install the kernel in the
root filesystem and have the root filesystem embedded inside the kernel
image as an initramfs.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
