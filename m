From: Cam Hutchison <camh@xdna.net>
Date: Sun, 13 Jan 2013 09:38:00 -0000
Subject: [Buildroot] [PATCH] rpi-firmware: Add default kernel name to
	config.txt
References: <1357926905-26350-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <16f9.50f28078.5f8a4@xionine.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

>diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
>index 2cabd68..da212c4 100644
>--- a/package/rpi-firmware/config.txt
>+++ b/package/rpi-firmware/config.txt
>@@ -6,6 +6,7 @@
> 
> arm_freq=700
> core_freq=250
>+kernel='zImage'

In my experiments, no quotes (single or double) should be around zImage.
With either, it fails to boot. Just:

kernel=zImage

> disable_overscan=1
> gpu_mem_256=100
> gpu_mem_512=100
