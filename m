From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 13:27:11 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: add legacy entry for
 4.20.x headers
Message-ID: <20190620113223.E76068212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f60d30829b6b05426a3914b703d03130fe64c53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b3bba8e4254 (package/linux-headers: drop support 4.20 headers)
removed the option for 4.20.x kernel headers, but forgot to add a legacy
option.  Add that now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 75d6c723a9..2b8dc3b1ee 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,6 +153,13 @@ config BR2_GDB_VERSION_8_0
 	  The 8.0.x version of gdb has been removed. Use a newer
 	  version instead.
 
+config BR2_KERNEL_HEADERS_4_20
+	bool "kernel headers version 4.20.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.20.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 comment "Legacy options removed in 2019.05"
 
 config BR2_CSKY_DSP
