From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 09:59:45 +0100
Subject: [Buildroot] [git commit] lftp: fix static linking
Message-ID: <20140317090140.B17389C0FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6402234e5935812b67bc058a14cef7423ae2e49d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/14b/14b72a78936233b60dd893cef7803f909b846bea/

--with-modules only makes sense when linking shared, so disable when not.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lftp/lftp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 0b00594..5c6fd4b 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -11,7 +11,9 @@ LFTP_LICENSE_FILES = COPYING
 LFTP_AUTORECONF = YES
 LFTP_DEPENDENCIES  = readline zlib
 
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
 LFTP_CONF_OPT += --with-modules
+endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LFTP_DEPENDENCIES += gnutls
