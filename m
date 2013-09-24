From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Sep 2013 14:11:54 +0200
Subject: [Buildroot] [git commit] civetweb: use TARGET_LDFLAGS
Message-ID: <20130924121819.CACC59B863@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb8208bf1d5420bef2eddaa6dc6a7a3eb8a6cf37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We should use our LDFLAGS when building as well. At the same time, drop the
unused CIVETWEB_LDFLAGS.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/civetweb/civetweb.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index e34da06..e468563 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -11,7 +11,6 @@ CIVETWEB_LICENSE_FILES = LICENSE.md
 
 CIVETWEB_CONF_OPT = TARGET_OS=LINUX
 CIVETWEB_COPT = $(TARGET_CFLAGS) -DHAVE_POSIX_FALLOCATE=0
-CIVETWEB_LDFLAGS = $(TARGET_LDFLAGS)
 CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
 
@@ -35,7 +34,7 @@ else
 endif
 
 define CIVETWEB_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D) build \
+	$(MAKE) CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) build \
 		$(CIVETWEB_CONF_OPT) \
 		COPT="$(CIVETWEB_COPT)"
 endef
