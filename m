From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 20:42:34 +0200
Subject: [Buildroot] [git commit] gutenprint: ensure staging version of
	cups-config is used
Message-ID: <20130512184648.94FD99A120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c27b71bccb390b5bc8a1775516efa6628f1690b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And not whatever is available on the host.

Fixes http://autobuild.buildroot.net/results/dd202d9be79e00ecab622bd7427542b16e962916/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gutenprint/gutenprint.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index b469843..834d967 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -21,6 +21,8 @@ GUTENPRINT_DEPENDENCIES = cups host-pkgconf \
 # so we need to build both a host package and a target package
 GUTENPRINT_DEPENDENCIES += host-gutenprint
 
+GUTENPRINT_CONF_ENV = ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
+
 GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
                       --disable-samples \
                       --without-doc \
