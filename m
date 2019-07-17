From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:31:08 +0200
Subject: [Buildroot] [git commit] package/libiscsi: needs threads
Message-ID: <20190717052935.A337681398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43caf8e1f71506b664efe75795f6d9d25f493497
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

threads are needed since bump to version 1.19.0 and
https://github.com/sahlberg/libiscsi/commit/41af44eba113c59dc43764d1d240397616e85b82

Fixes:
 - http://autobuild.buildroot.org/results/1d71c95378a6ef9774926bf7431c1a315e4a1b3e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
