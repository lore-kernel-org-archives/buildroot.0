From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 May 2015 17:06:13 +0200
Subject: [Buildroot] [git commit] Revert "qt: QT_COORD_TYPE_DOUBLE should
	only be set on soft float"
Message-ID: <20150505152638.5605381DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed8c73a47404f61a955d2fc26896b986d353b9dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e07ec136ee3dd4bf16b18571623ac57f99136faa.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 9568b70..83fdeec 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -121,7 +121,6 @@ config BR2_PACKAGE_QT_CONFIG_FILE
 	  file, which Buildroot will give to Qt at compile time.
 
 config BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE
-	depends on BR2_SOFT_FLOAT
 	bool "QT_COORD_TYPE to double"
 	help
 	  Set QT_COORD_TYPE to double. On ARM-based platforms, qreal
