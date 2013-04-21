From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:20:10 +0200
Subject: [Buildroot] [git commit] libwebsockets: do not build/install
	testapps to target
Message-ID: <20130421212044.046259B782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72fa62dd7b5a116fa765ec269e67f37245c1bf2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libwebsockets/libwebsockets.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index e1f1efa..6672dbe 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -10,6 +10,7 @@ LIBWEBSOCKETS_LICENSE = LGPLv2.1
 LIBWEBSOCKETS_LICENSE_FILES = COPYING
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_AUTORECONF = YES
+LIBWEBSOCKETS_CONF_OPT = --without-testapps
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
