From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:49:56 +0200
Subject: [Buildroot] [PATCH 08/13] mkpimage: remove SOURCE
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the package infrastructure doen't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the mkpimage package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mkpimage/mkpimage.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
index 6360902..c30a680 100644
--- a/package/mkpimage/mkpimage.mk
+++ b/package/mkpimage/mkpimage.mk
@@ -7,7 +7,6 @@
 # source included in the package
 # came from barebox's repository:
 # http://git.pengutronix.de/?p=barebox.git;a=blob;f=scripts/socfpga_mkimage.c;h=1a7a66d98841e9f52c3ea49c651286aa1412c9a5;hb=HEAD
-HOST_MKPIMAGE_SOURCE =
 HOST_MKPIMAGE_LICENSE = GPLv2
 
 define HOST_MKPIMAGE_BUILD_CMDS
-- 
2.7.4
