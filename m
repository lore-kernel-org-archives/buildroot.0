From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 20:56:32 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] Config.in.legacy: add
 legacy entry for 4.20.x headers
Message-ID: <20190624190446.C3133868B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1d928c297d177c651d43abe25f231506bdeb491
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Commit b3bba8e4254 (package/linux-headers: drop support 4.20 headers)
removed the option for 4.20.x kernel headers, but forgot to add a legacy
option.  Add that now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8f60d30829b6b05426a3914b703d03130fe64c53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index a32cbcb6f2..7a4ea7394c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.05"
 
+config BR2_KERNEL_HEADERS_4_20
+	bool "kernel headers version 4.20.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.20.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
 	bool "compositor moved to gst1-plugins-base"
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR
