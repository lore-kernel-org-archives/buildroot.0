From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:00 +0100
Subject: [Buildroot] [RFC PATCH v2 01/30] pkgconf: Split pkgconf command
 into multi-line
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-2-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

The pkgconf command is a long and confusing line, which is about to get
longer. Split it up into logical stages so that it is easier to
visualise changes.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/pkgconf/pkg-config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 99c0add8fb..8795f64b68 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -2,4 +2,7 @@
 PKGCONFDIR=$(dirname $0)
 DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
 DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
+
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
+	PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} \
+	exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
-- 
2.20.1
