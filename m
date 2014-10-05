From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 15:45:13 +0200
Subject: [Buildroot] [PATCH 3/8] package/apr-util: Add comment to describe
	toolchain dependencies
In-Reply-To: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412516718-12597-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr-util/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 3d4ec23..fcef693 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -12,3 +12,7 @@ config BR2_PACKAGE_APR_UTIL
 	  The utility library for the apache runtime project
 
 	  http://apr.apache.org/
+
+comment "apr-util needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.7.10.4
