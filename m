From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 10:48:08 +0200
Subject: [Buildroot] [git commit] acpica: needs threads
Message-ID: <20160712084830.E39467FF29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6f09008b5f0a433deeb8f597c02ec6ff1580869
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/53e/53e38f278ad6d1a7d0a48bce74976f59475b1a99/
  http://autobuild.buildroot.net/results/a7c/a7cc6187451f944e6846d3f6b5cd3aac700796dd/

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
