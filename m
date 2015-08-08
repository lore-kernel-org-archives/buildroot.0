From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:16:44 +0200
Subject: [Buildroot] [git commit] package/libgpgme: add argp-standalone
	dependency with musl
Message-ID: <20150808095147.20964818E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51b7086c14cf48bda08e8f6caca4e08433b0ec06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since argp-standalone is only available for uClibc-ng
and musl toolchains, it's safe to link with it when
the package is selected.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpgme/libgpgme.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index ec64d37..1868099 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -22,7 +22,7 @@ LIBGPGME_CONF_OPTS = --with-gpg=/usr/bin/gpg \
 	--disable-gpg-test
 
 # Handle argp-standalone or it errors out during build
-ifeq ($(BR2_PACKAGE_ARGP_STANDALONE)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBGPGME_CONF_ENV += LIBS="-largp"
 LIBGPGME_DEPENDENCIES += argp-standalone
 endif
