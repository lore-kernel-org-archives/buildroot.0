From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Jun 2012 09:55:04 +0200
Subject: [Buildroot] [git commit] faad2: fix frontend/faad linking
Message-ID: <20120627075543.56A918D49F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56168c215595e4b7bc6222fcee3d1021e327051d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/84db857a6fc8e73483493e484f2cc5f4bf64f3d0

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/faad2/faad2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/faad2/faad2.mk b/package/multimedia/faad2/faad2.mk
index 366515c..567875a 100644
--- a/package/multimedia/faad2/faad2.mk
+++ b/package/multimedia/faad2/faad2.mk
@@ -6,6 +6,8 @@
 
 FAAD2_VERSION = 2.7
 FAAD2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/faac
+# frontend/faad calls frexp()
+FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
