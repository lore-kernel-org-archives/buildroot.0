From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 12:16:39 +0200
Subject: [Buildroot] [git commit] qt: Fix missing runtime Qt3Support
	dependency
Message-ID: <20160809101729.520FA7FE9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=466934bb5c35856df22ff0c56021c38ee372685c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt3Support module has a runtime dependency on QtSql, see
https://wiki.qt.io/Qt_Library_Cross_Dependencies. This patch fix this
issue.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 548d180..b9752d3 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -126,6 +126,7 @@ config BR2_PACKAGE_QT_CONFIG_FILE
 config BR2_PACKAGE_QT_QT3SUPPORT
 	bool "Compatibility with Qt3"
 	depends on BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_SQL_MODULE
 	help
 	  Turns on support for older Qt3. This will create an additional
 	  library with proxy code and increase the space required on target.
