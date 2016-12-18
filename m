From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 13:22:01 +0100
Subject: [Buildroot] [PATCH] xorg-server: add dependency on dri2proto
 when	systemd is built
References: <20161129143658.20619-1-fparent@baylibre.com>
Message-ID: <9kbiidxsat.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 29 Nov 2016 15:36:58 +0100 schrieb Fabien Parent:

> When systemd is selected, xorg-server must have config-udev-kms enabled
> in order to build correctly, but it won't be the case if
> BR2_PACKAGE_XPROTO_DRI2PROTO is not part of the build.
> 
> Add BR2_PACKAGE_XPROTO_DRI2PROTO as a dependency of xorg-xserver only
> when systemd is part of the build.
> 
> Signed-off-by: Fabien Parent
> <fparent@baylibre.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested using defconfig from
 https://bugs.busybox.net/show_bug.cgi?id=9486)

Fixes https://bugs.busybox.net/show_bug.cgi?id=9486
