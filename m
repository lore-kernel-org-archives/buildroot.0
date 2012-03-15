From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 09:35:03 +0100
Subject: [Buildroot] [git commit] nbd: fix download URL
Message-ID: <20120315083521.9168790D92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6953341b71028294f4e1e818df40f522e730c6f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old URL nowadays return a 404.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nbd/nbd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 452ed34..62ae9be 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -6,7 +6,7 @@
 
 NBD_VERSION = 3.0
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
-NBD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
+NBD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
 
