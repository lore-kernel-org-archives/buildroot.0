From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 10 Jul 2016 19:43:05 +0200
Subject: [Buildroot] [PATCH 1/1] acpica: needs threads
Message-ID: <20160710174305.18872-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/53e/53e38f278ad6d1a7d0a48bce74976f59475b1a99/
  http://autobuild.buildroot.net/results/a7c/a7cc6187451f944e6846d3f6b5cd3aac700796dd/

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/acpica/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/acpica/Config.in b/package/acpica/Config.in
index 74d1f26..c5ffb00 100644
--- a/package/acpica/Config.in
+++ b/package/acpica/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ACPICA
 	bool "acpica"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The ACPI Component Architecture (ACPICA) project provides an
 	  operating system (OS)-independent reference implementation
@@ -7,3 +8,6 @@ config BR2_PACKAGE_ACPICA
 	  Specification (ACPI).
 
 	  https://www.acpica.org
+
+comment "acpica needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.9.0
