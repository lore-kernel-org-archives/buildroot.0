From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Apr 2015 00:26:07 +0200
Subject: [Buildroot] [git commit] poppler: fix build with openjpeg
Message-ID: <20150404222741.7DC0B80386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0574a401c938a9511019f6468a564c34a2ed2f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The openjpeg version we have in Buildroot is v1, not v2.

Fixes:
http://autobuild.buildroot.net/results/e17/e17193604956cc61d47a9913632144601ef72656/
http://autobuild.buildroot.net/results/6b9/6b9d4ce15f54683670af3132ab21a053d9853e6c/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 5a6b22b..d35da54 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -71,7 +71,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 POPPLER_DEPENDENCIES += openjpeg
-POPPLER_CONF_OPTS += -enable-libopenjpeg=openjpeg2
+POPPLER_CONF_OPTS += -enable-libopenjpeg=openjpeg1
 else
 POPPLER_CONF_OPTS += -enable-libopenjpeg=none
 endif
