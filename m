From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 24 May 2014 19:55:47 +0200
Subject: [Buildroot] [PATCH] xbmc: Add missing unicode properties supports
Message-ID: <1400954147-25609-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At startup, XBMC complains that PCRE is lacking unicode properties
supports.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/xbmc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 0f45f5c..d94cdad 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -40,6 +40,7 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UCP
 	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_BSDDB
 	select BR2_PACKAGE_PYTHON_BZIP2
-- 
2.0.0.rc0
