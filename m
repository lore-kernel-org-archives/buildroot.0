From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:49:53 +0200
Subject: [Buildroot] [PATCH 05/13] initscripts: remove SOURCE
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the package infrastructure doen't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the initscripts package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/initscripts/initscripts.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
index a5d8db7..cfee155 100644
--- a/package/initscripts/initscripts.mk
+++ b/package/initscripts/initscripts.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# source included in buildroot
-INITSCRIPTS_SOURCE =
-
 define INITSCRIPTS_INSTALL_TARGET_CMDS
 	mkdir -p  $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
-- 
2.7.4
