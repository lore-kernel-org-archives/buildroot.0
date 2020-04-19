From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2020 00:50:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: needs wchar
Message-ID: <20200419225024.341725-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exfatprogs unconditionally uses wchar_t in libexfat.h

Fixes:
 - http://autobuild.buildroot.org/results/884bbaec2bbbff33c30a0bebda3d95198aa1281c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfatprogs/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/exfatprogs/Config.in b/package/exfatprogs/Config.in
index 99defb5b69..4f50427a68 100644
--- a/package/exfatprogs/Config.in
+++ b/package/exfatprogs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EXFATPROGS
 	bool "exfatprogs"
+	depends on BR2_USE_WCHAR
 	help
 	  exFAT filesystem userspace utilities.
 
@@ -11,3 +12,6 @@ config BR2_PACKAGE_EXFATPROGS
 	  programs in package/exfat-utils.
 
 	  https://github.com/exfatprogs/exfatprogs
+
+comment "exfatprogs needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
-- 
2.25.1
