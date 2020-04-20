From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:45:04 +0200
Subject: [Buildroot] [git commit] package/exfatprogs: needs wchar
Message-ID: <20200420053724.CE9C98F3B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5d2f8bb53d8391749728960deefc98b72dccd85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

exfatprogs unconditionally uses wchar_t in libexfat.h

Fixes:
 - http://autobuild.buildroot.org/results/884bbaec2bbbff33c30a0bebda3d95198aa1281c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
