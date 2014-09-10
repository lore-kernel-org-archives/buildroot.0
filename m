From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Sep 2014 10:55:12 +0200
Subject: [Buildroot] [git commit] jasper: autoreconf to fix rpath issue
Message-ID: <20140910085707.694669D651@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=324ccec90d9c98d6aa535c96861eeb84d2e3ff33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old version of autotools used gets confused and ends up looking in
/usr/lib for libjpeg when host == target..

Fixes http://autobuild.buildroot.net/results/307/307cac65287420252a5bb64715d9a1edd90e72fa/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 7917c6a..b2da07d 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -11,5 +11,7 @@ JASPER_INSTALL_STAGING = YES
 JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = MIT
 JASPER_LICENSE_FILES = LICENSE
+# needed to fix rpath issue (http://autobuild.buildroot.net/results/307/307cac65287420252a5bb64715d9a1edd90e72fa/)
+JASPER_AUTORECONF = YES
 
 $(eval $(autotools-package))
