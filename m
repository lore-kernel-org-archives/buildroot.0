From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:28:25 +0200
Subject: [Buildroot] [git commit] package/yavta: disable -Werror
Message-ID: <20210419210153.44C2483B53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b27fca6482f5bbbf41c602d5902b226c43ebf945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure which is raised since bump to latest version in commit
87ba7be02fdd185668f86a59539343c70e1108e0

Fixes:
 - http://autobuild.buildroot.org/results/d5b4f69f46cef4dd11410fe48d21372cb883ae4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yavta/yavta.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yavta/yavta.mk b/package/yavta/yavta.mk
index 984d0ff5e2..d16bee69b1 100644
--- a/package/yavta/yavta.mk
+++ b/package/yavta/yavta.mk
@@ -9,5 +9,6 @@ YAVTA_SITE = https://git.ideasonboard.org/git/yavta.git
 YAVTA_SITE_METHOD = git
 YAVTA_LICENSE = GPL-2.0+
 YAVTA_LICENSE_FILES = COPYING.GPL
+YAVTA_CONF_OPTS = -Dwerror=false
 
 $(eval $(meson-package))
