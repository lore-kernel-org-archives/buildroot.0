From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 11:18:47 +0100
Subject: [Buildroot] [git commit] libeet: host variant doesn't need gnutls /
	gcrypt
Message-ID: <20130102101909.683AE9A5B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86d9bda613689229b55445ad90673754f75318ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/2127880b551d57f16c7907481eeac22e601868eb/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libeet/libeet.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index 7034198..3d5b460 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -13,6 +13,7 @@ LIBEET_LICENSE_FILES = COPYING
 LIBEET_INSTALL_STAGING = YES
 
 LIBEET_DEPENDENCIES = host-pkgconf zlib jpeg libeina
+HOST_LIBEET_DEPENDENCIES = host-pkgconf host-zlib host-jpeg host-libeina
 
 ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 LIBEET_DEPENDENCIES += gnutls libgcrypt
