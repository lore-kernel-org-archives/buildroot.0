From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 15:35:55 +0200
Subject: [Buildroot] [git commit] e2fsprogs: don't build uuidd if not
	requested
Message-ID: <20110728133942.A61588B556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f94057d89d454bd6683e979cee1ef79c79c24401
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than not installing it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index cf1a6b8..8a7edb4 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -14,6 +14,7 @@ E2FSPROGS_CONF_OPT = \
 	--disable-debugfs \
 	--disable-imager \
 	--disable-resizer \
+	$(if $(BR2_PACKAGE_E2FSPROGS_UUIDD),,--disable-uuidd) \
 	--enable-fsck \
 	--disable-e2initrd-helper \
 	--disable-testio-debug
@@ -40,7 +41,6 @@ E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += usr/sbin/logsave
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LSATTR) += usr/bin/lsattr
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += usr/sbin/mke2fs
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += usr/sbin/mklost+found
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDD) += usr/sbin/uuidd
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += usr/bin/uuidgen
 
 # libraries to keep or remove
-- 
1.7.3.4
