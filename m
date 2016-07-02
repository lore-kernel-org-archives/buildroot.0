From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:36 +0200
Subject: [Buildroot] [PATCH 07/69] doxygen: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-8-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/doxygen/doxygen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 14dd0905961d..cf7dfee2a545 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -9,7 +9,7 @@ DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri
 DOXYGEN_LICENSE = GPLv2
 DOXYGEN_LICENSE_FILES = LICENSE
-DOXYGEN_DEPENDENCIES = host-flex host-bison
+HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
 
 define HOST_DOXYGEN_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR)/usr)
-- 
2.1.0
