From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jan 2011 22:52:30 +0100
Subject: [Buildroot] [git commit master 1/1] portmap: respect target CFLAGS
Message-ID: <20110119215340.5C0698B4DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fef028dbd37b4c8e32e61314ab680f9eaadf22cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/portmap/portmap.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 4a5fe62..bebafce 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -15,6 +15,7 @@ PORTMAP_FLAGS += NO_FORK=1
 endif
 
 define PORTMAP_BUILD_CMDS
+	CFLAGS="$(TARGET_CFLAGS)" \
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
 endef
 
-- 
1.7.3.4
