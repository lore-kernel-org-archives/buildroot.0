From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 14:11:15 +1100
Subject: [Buildroot] [git commit] busybox: add comment that other packages
	are needed
Message-ID: <20170120031226.AED3981EBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f290a21d0707724575a2957ee94a2d68ed3378e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Inspired on the confusion in [1], we want to warn the user that building
without busybox may not lead to a working system.

[1] https://bugs.busybox.net/show_bug.cgi?id=9526

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 7ef3f0e..504cd8a 100644
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
