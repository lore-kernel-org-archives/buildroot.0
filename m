From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2013 23:49:09 +0100
Subject: [Buildroot] [git commit] udisks: only build documentation if
	requested
Message-ID: <20131119225051.6B8BB9BD38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e827993e737a3330e18fe97d99ccfbd46be2239
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/b23/b234e63f92e6e5162dd5340624e32caa31b82a1a/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udisks/udisks.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 28855dd..08e942a 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -20,7 +20,8 @@ UDISKS_DEPENDENCIES = 	\
 	lvm2		\
 	libatasmart
 
-UDISKS_CONF_OPT = --disable-remote-access
+UDISKS_CONF_OPT = --disable-remote-access \
+	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-man-pages)
 
 ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
 UDISKS_CONF_OPT += --enable-lvm2
