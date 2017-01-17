From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 17 Jan 2017 23:58:54 +0100
Subject: [Buildroot] [PATCH] busybox: add comment that other packages are
	needed
Message-ID: <20170117225854.2544-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inspired on the confusion in [1], we want to warn the user that building
without busybox may not lead to a working system.

[1] https://bugs.busybox.net/show_bug.cgi?id=9526

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Better wording is certainly welcome!
---
 package/busybox/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 7ef3f0eda8..504cd8a65a 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -77,6 +77,9 @@ endif
 
 if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
 
+comment "You may need to enable other packages to get a working system"
+comment "You better know what you're doing!"
+
 # This option is not an option of Busybox, it can be selected even if
 # Busybox is not enabled. This dummy option ensures that packages that
 # depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS are visible when Busybox
-- 
2.11.0
