From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue,  8 Sep 2020 12:23:35 -0700
Subject: [Buildroot] [PATCH 2/3] package/python-sentry-sdk: fix select
 ordering
In-Reply-To: <20200908192336.155428-1-joseph.kogut@gmail.com>
References: <20200908192336.155428-1-joseph.kogut@gmail.com>
Message-ID: <20200908192336.155428-2-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
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
 
-- 
2.28.0
