From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:55 +0100
Subject: [Buildroot] [git commit] e2fsprogs: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150407.BB95290383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e7663e2992032d8fe2b5e8b7c6041e7a1028f31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index cf9b089..d945a12 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -28,6 +28,8 @@ E2FSPROGS_MAKE_OPT = \
 define HOST_E2FSPROGS_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
 endef
+# we don't have a host-util-linux
+HOST_E2FSPROGS_DEPENDENCIES = host-pkg-config
 
 # binaries to keep or remove
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += usr/sbin/badblocks
