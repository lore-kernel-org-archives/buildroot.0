From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 08:45:24 +0100
Subject: [Buildroot] [git commit] ibrdtnd: don't build (latex) documentation
Message-ID: <20151113075130.CF66E7FDD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c26a5781409023d8a8fe6e2024d2f9eab7e3896f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/05d/05d2d80050061e3fe1bd95a9644f4178ef73ef62

The build system builds api documentation if it finds pdflatex, which we
don't need to spend time on and which may fail if not all the pdflatex
dependencies are available, so disable it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ibrdtnd/ibrdtnd.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
index 3451bfa..01ebb7a 100644
--- a/package/ibrdtnd/ibrdtnd.mk
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -18,6 +18,9 @@ IBRDTND_CONF_OPTS = \
 	--without-wifip2p \
 	--without-vmime
 
+# don't build documentation
+IBRDTND_CONF_ENV = PDFLATEX='no'
+
 ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
 IBRDTND_CONF_OPTS += --enable-libdaemon
 IBRDTND_DEPENDENCIES += libdaemon
