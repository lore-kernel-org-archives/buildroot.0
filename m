From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 May 2013 07:40:01 -0300
Subject: [Buildroot] [PATCH] crda: needs threads
Message-ID: <1368700801-18262-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because libnl needs threads, fixes:
http://autobuild.buildroot.net/results/8e32f222ddeba262ee2471d22e1c6a8afbf241c2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/crda/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/crda/Config.in b/package/crda/Config.in
index 66baf14..539a5c7 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRDA
 	bool "crda"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
 	# regdb is a runtime dependency
@@ -13,3 +14,6 @@ config BR2_PACKAGE_CRDA
 	  may operate within for a given location.
 
 	  http://linuxwireless.org/en/developers/Regulatory/CRDA
+
+comment "crda requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5
