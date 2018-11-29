From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:50:47 +0100
Subject: [Buildroot] [git commit] package/libdrm: add optional cunit
 dependency
Message-ID: <20181202071601.328F9815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1705f775e90895d6fba522444355eadbe2b0be93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously the option to install tests would result in the test cases
that don't have a cunit dependency, to build and be installed.

This patch adds an optional dependency on cunit so that all test cases
can be built and installed to target.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: keep as an optional dependency, as cunit is only useful for
additional tests specific to the amdgpu backend]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 18ef9cdd2e..06efa20195 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -115,6 +115,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
 LIBDRM_CONF_OPTS += --enable-install-test-programs
+ifeq ($(BR2_PACKAGE_CUNIT),y)
+LIBDRM_DEPENDENCIES += cunit
+endif
 endif
 
 $(eval $(autotools-package))
