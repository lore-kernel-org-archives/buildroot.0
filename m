From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Apr 2021 20:42:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/uftrace: needs threads
Message-ID: <20210426184255.500745-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uftrace needs threads since its addition to buildroot in commit
09c97972d9f90b69cfc36f9ffe9e22c13daf9307

Fixes:
 - http://autobuild.buildroot.org/results/d27c34a2f773aeb3c806d56dd2468d17caf2fbc6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uftrace/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
index 7aa74c9aa9..9af7ee8c28 100644
--- a/package/uftrace/Config.in
+++ b/package/uftrace/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
 config BR2_PACKAGE_UFTRACE
 	bool "uftrace"
 	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ARGP_STANDALONE if \
 	       BR2_TOOLCHAIN_USES_UCLIBC || \
 	       BR2_TOOLCHAIN_USES_MUSL
@@ -20,3 +21,6 @@ config BR2_PACKAGE_UFTRACE
 	  analysis of the program execution and performance.
 
 	  https://github.com/namhyung/uftrace
+
+comment "uftrace needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.30.2
