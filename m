From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:03:09 +0200
Subject: [Buildroot] [git commit] package/rpm: add optional zstd dependency
Message-ID: <20190331130146.3A36688125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba931a1d76f7e855206514f1bd737346a6f709d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zstd support has been in version 4.14.0 and
https://github.com/rpm-software-management/rpm/commit/3684424fe297c996bb05bb64631336fa2903df12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 626e6bf94c..5fd7256618 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -92,6 +92,13 @@ ifeq ($(BR2_PACKAGE_BINUTILS),y)
 RPM_DEPENDENCIES += binutils
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+RPM_DEPENDENCIES += zstd
+RPM_CONF_OPTS += --enable-zstd
+else
+RPM_CONF_OPTS += --disable-zstd
+endif
+
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
