From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:49:54 +0200
Subject: [Buildroot] [PATCH 06/13] mke2img: remove SOURCE
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the package infrastructure doen't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the mke2img package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mke2img/mke2img.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
index 04aaa8f..9de387a 100644
--- a/package/mke2img/mke2img.mk
+++ b/package/mke2img/mke2img.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-HOST_MKE2IMG_SOURCE =
 HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
 define HOST_MKE2IMG_INSTALL_CMDS
-- 
2.7.4
