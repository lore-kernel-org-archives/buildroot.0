From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:25:22 +0200
Subject: [Buildroot] [git commit] package/lldpd: explicit optional
	dependencies
Message-ID: <20160818212531.D39AD7FCAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d17611eab903fc7985b895bb251616cc9b5a6f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check and valgrind are optional depenencies of lldpd, so we must depend
on them when either is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lldpd/lldpd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 924f2db..cc3c3a0 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -12,6 +12,14 @@ LLDPD_LICENSE_FILES = README.md
 # 0001-build-make-generation-of-atom-glue-compatible-with-o.patch
 LLDPD_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_CHECK),y)
+LLDPD_DEPENDENCIES += check
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+LLDPD_DEPENDENCIES += valgrind
+endif
+
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at lldpd
