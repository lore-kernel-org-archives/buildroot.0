From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 23:17:28 +0200
Subject: [Buildroot] [git commit] liblogging: Depend on systemd
Message-ID: <20140410212227.E3D1C9C672@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdd2075ea3ebbee9794406529563b068137bd517
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package depends on systemd because in the configure phase it
searches for a file installed by systemd. We add systemd to it's
dependencies to ensure that is built before this package.

Fixes:
   http://autobuild.buildroot.net/results/32c/32c636020600aa3f378d326c84fac82eb1fb2871/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liblogging/liblogging.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
index fa181fb..3608c40 100644
--- a/package/liblogging/liblogging.mk
+++ b/package/liblogging/liblogging.mk
@@ -13,6 +13,7 @@ LIBLOGGING_CONF_OPT = --enable-cached-man-pages
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 LIBLOGGING_CONF_OPT += --enable-journal
+LIBLOGGING_DEPENDENCIES += systemd
 else
 LIBLOGGING_CONF_OPT += --disable-journal
 endif
