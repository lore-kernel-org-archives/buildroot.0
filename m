From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:55 +0100
Subject: [Buildroot] [git commit] gawk: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150407.DD5DA90386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12b199c0c268e9558901bf96c455e2bb2f9c7549
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gawk/gawk.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 7fd85ee..f1a6472 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -13,6 +13,9 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GAWK_DEPENDENCIES += busybox
 endif
 
+# we don't have a host-busybox
+HOST_GAWK_DEPENDENCIES =
+
 define GAWK_CREATE_SYMLINK
 	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
 endef
