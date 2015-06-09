From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:04:47 +0200
Subject: [Buildroot] [git commit] package/matchbox-common: fix dependencies
Message-ID: <20150609211052.7350381D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=595c84d464ea1bda24b3c0322dfca14ba760e457
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

matchbox-common can be used by both matchbox-desktop and matchbox-panel,
so it needs to depend on either, not both.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-common/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/matchbox-common/Config.in b/package/matchbox-common/Config.in
index 33d6cc4..5a038e1 100644
--- a/package/matchbox-common/Config.in
+++ b/package/matchbox-common/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "matchbox-common"
 	select BR2_PACKAGE_MATCHBOX_LIB
-	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
+	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
 	help
 	  Common desktop folders and matchbox-session script.
 
