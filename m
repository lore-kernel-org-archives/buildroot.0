From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 08:37:01 +0100
Subject: [Buildroot] [git commit] mrouted: add missing dependency on
	host-bison
Message-ID: <20130325073638.5B9A99B2A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94dad5d0351c1577237ecc77421cfb74a976c068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/10d875724388034369e7673a6c08ecad3863ba06/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mrouted/mrouted.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 90f2f59..56aa7e1 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -7,6 +7,7 @@
 MROUTED_VERSION = 3.9.6
 MROUTED_SOURCE = mrouted-$(MROUTED_VERSION).tar.bz2
 MROUTED_SITE = http://cloud.github.com/downloads/troglobit/mrouted
+MROUTED_DEPENDENCIES = host-bison
 
 define MROUTED_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
