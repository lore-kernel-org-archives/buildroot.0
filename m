From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 31 Oct 2020 16:08:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/pax-utils: needs wchar
Message-ID: <20201031150836.100678-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pax-utils uses asprintf and so needs wchar since version 1.2.4 and
https://gitweb.gentoo.org/proj/pax-utils.git/commit/?id=9c0ec154d782795daa3b7d2ae273bbda2b36ae83

Fixes:
 - http://autobuild.buildroot.org/results/613840edba8ea161bb900f3b56d8d3605961c78f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pax-utils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
index 58100e482a..ebcca98500 100644
--- a/package/pax-utils/Config.in
+++ b/package/pax-utils/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PAX_UTILS
 	bool "pax-utils"
+	depends on BR2_USE_WCHAR
 	help
 	  ELF related utils for ELF 32/64 binaries that can check files
 	  for security relevant properties.
 
 	  http://www.gentoo.org/proj/en/hardened/pax-utils.xml
+
+comment "pax-utils needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
-- 
2.28.0
