From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Dec 2017 22:32:30 +0100
Subject: [Buildroot] [git commit] libostree: install to staging
Message-ID: <20171207213318.B9EAD810D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10ddb4b1dd6d01d0f1f918feefe9a6bca83c9a66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install the libraries to staging to be usable by other packages.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libostree/libostree.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index b0bcf01..113ed42 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -11,6 +11,7 @@ LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOST
 LIBOSTREE_LICENSE = GPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
+LIBOSTREE_INSTALL_STAGING = YES
 
 LIBOSTREE_CONF_OPTS += \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr \
