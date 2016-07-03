From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:49:50 +0200
Subject: [Buildroot] [PATCH 02/13] makedevs: remove VERSION/SOURCE
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the package infrastructure doen't attempt to download a package
that has an empty version string, there's no need to define the VERSION
and SOURCE variables in the makedevs package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/makedevs/makedevs.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 130f5bc..95933c4 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -4,11 +4,6 @@
 #
 ################################################################################
 
-# source included in buildroot
-MAKEDEVS_SOURCE =
-HOST_MAKEDEVS_SOURCE =
-
-MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
 MAKEDEVS_LICENSE = GPLv2
 
 HOST_MAKEDEVS_CFLAGS = $(HOST_CFLAGS)
-- 
2.7.4
