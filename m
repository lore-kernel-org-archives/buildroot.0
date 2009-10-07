From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:35 +0200
Subject: [Buildroot] [PATCH 12/23] qt: respect silent mode instead non
	existing verbose mode
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-13-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 9d80437..b12d3eb 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -441,7 +441,7 @@ endif
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		./configure \
-		$(if $(VERBOSE),-verbose,-silent) \
+		$(if $(QUIET),-silent,-verbose) \
 		-force-pkg-config \
 		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
 		$(QT_QCONFIG_COMMAND) \
-- 
1.6.3.3
