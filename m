From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Jul 2019 18:37:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/libiscsi: needs threads
Message-ID: <20190715163702.1978-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

threads are needed since bump to version 1.19.0 and
https://github.com/sahlberg/libiscsi/commit/41af44eba113c59dc43764d1d240397616e85b82

Fixes:
 - http://autobuild.buildroot.org/results/1d71c95378a6ef9774926bf7431c1a315e4a1b3e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiscsi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
index 760fecea66..1e75071476 100644
--- a/package/libiscsi/Config.in
+++ b/package/libiscsi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBISCSI
 	bool "libiscsi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libiscsi is a client-side library to implement the iSCSI
 	  protocol that can be used to access resource of an iSCSI
@@ -10,3 +11,6 @@ config BR2_PACKAGE_LIBISCSI
 	  for simpler applications.
 
 	  https://github.com/sahlberg/libiscsi  (no proper homepage)
+
+comment "libiscsi needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
