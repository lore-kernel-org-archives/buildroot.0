From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Apr 2014 15:24:44 +0200
Subject: [Buildroot] [git commit] freetype: host variant needs to run
	autogen too
Message-ID: <20140423132509.87E3E9C9BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73797e7b3c948e6cbda8dec289df417958736d19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/fb8/fb8e38bcc73ff60a71df7558a1a4d6cc7cc9157f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 2f8d497..c7c9a06 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -26,6 +26,7 @@ define FREETYPE_RUN_AUTOGEN
 	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
 endef
 FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
+HOST_FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
 FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
 HOST_FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
 
