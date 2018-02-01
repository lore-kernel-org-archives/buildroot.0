From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Feb 2018 20:23:31 +0100
Subject: [Buildroot] [PATCH 1/1] libmaxminddb: needs a toolchain with threads
Message-ID: <20180201192331.17585-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmaxminddb added a pthread dependency to bin/mmdblookup in version
1.3.2

Fixes:
 - https://autobuild.buildroot.net/results/3e653a5fa4cbd714980ce0f1c3b02f3abb6d558e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmaxminddb/Config.in b/package/libmaxminddb/Config.in
index 1b8061b7b7..9e86cfee07 100644
--- a/package/libmaxminddb/Config.in
+++ b/package/libmaxminddb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBMAXMINDDB
 	bool "libmaxminddb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  C library for the MaxMind DB file format
 
@@ -16,3 +17,6 @@ config BR2_PACKAGE_LIBMAXMINDDB
 	  Attribution-ShareAlike 3.0 Unported License.
 
 	  http://maxmind.github.io/libmaxminddb
+
+comment "libmaxminddb needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.14.1
