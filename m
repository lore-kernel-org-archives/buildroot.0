From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:57:02 +0200
Subject: [Buildroot] [git commit] package/python-sentry-sdk: fix select
 ordering
Message-ID: <20200923204731.BC5CB81171@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b799881ebef67eeccc21810be54436c4b67520c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-sentry-sdk/Config.in b/package/python-sentry-sdk/Config.in
index 5bddabe282..62b8100bdb 100644
--- a/package/python-sentry-sdk/Config.in
+++ b/package/python-sentry-sdk/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_SENTRY_SDK
 	bool "python-sentry-sdk"
-	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	help
 	  Python client for Sentry (https://getsentry.com).
 
