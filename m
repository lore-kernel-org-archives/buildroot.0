From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 16:58:11 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-external: add
	lib{gfortran, quadmath} to TOOLCHAIN_EXTERNAL_LIBS
Message-ID: <20160703145820.DD1D981E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8814d65337c4141d0e36ed13d0d7ecc881f18e9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8e64789..e675045 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -90,6 +90,14 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+TOOLCHAIN_EXTERNAL_LIBS += libgfortran.so.*
+# fortran needs quadmath on x86 and x86_64
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBQUADMATH),y)
+TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
+endif
+endif
+
 TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 # Details about sysroot directory selection.
