From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Apr 2021 13:00:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/yavta: disable -Werror
Message-ID: <20210417110015.1904070-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure which is raised since bump to latest version in commit
87ba7be02fdd185668f86a59539343c70e1108e0

Fixes:
 - http://autobuild.buildroot.org/results/d5b4f69f46cef4dd11410fe48d21372cb883ae4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.2
