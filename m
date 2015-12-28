From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 12:27:57 +0100
Subject: [Buildroot] [git commit] pinentry: add host-pkgconf dependency
Message-ID: <20151228112950.2489882531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=116b9b4adf715aaedae653dd904e42f9114abea9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pinentry configure.ac uses PKG_CHECK_MODULES() and also manual calls
to pkg-config, to detect the availability of some libraries, so we
need to depend on host-pkgconf.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pinentry/pinentry.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index d3e6b7a..ab7be54 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -9,7 +9,9 @@ PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
 PINENTRY_LICENSE = GPLv2+
 PINENTRY_LICENSE_FILES = COPYING
-PINENTRY_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+PINENTRY_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	host-pkgconf
 PINENTRY_CONF_OPTS += --without-libcap       # requires PAM
 
 # build with X if available
