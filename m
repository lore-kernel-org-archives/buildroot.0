From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 21:55:28 +0100
Subject: [Buildroot] [git commit] pkgconf: pkg-config.in: exec pkgconf
Message-ID: <20180305200717.D73508126F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc2f3a2a5924934b14a078d914ad3c4d731f3e8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace the shell script with pkgconf without creating a new process.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkgconf/pkg-config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 9387931ff2..99c0add8fb 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -2,4 +2,4 @@
 PKGCONFDIR=$(dirname $0)
 DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
 DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
