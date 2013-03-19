From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 16:12:36 +0100
Subject: [Buildroot] [git commit] libcap: fix host build when
	BR2_PACKAGE_ATTR is enabled
Message-ID: <20130319151245.82B159B1A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fc61cca6912779391ac3a205b05e0a7bd14a378
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't have (or need) a host-attr package.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcap/libcap.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 6adac73..15a2cfb 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -22,6 +22,9 @@ else
 	LIBCAP_HAVE_LIBATTR = no
 endif
 
+# we don't have host-attr
+HOST_LIBCAP_DEPENDENCIES =
+
 define LIBCAP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		LIBATTR=$(LIBCAP_HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" \
