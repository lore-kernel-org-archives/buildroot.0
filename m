From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:12:31 +0100
Subject: [Buildroot] [PATCH 10/13] toolchain/toolchain-external: add
	libgfortran and libquadmath to the USR_LIB_EXTERNAL_LIBS list
In-Reply-To: <1467040354-39816-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040354-39816-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467040354-39816-5-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 53a7c7a..3dbcc3a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -90,6 +90,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+USR_LIB_EXTERNAL_LIBS += libgfortran.so.* libquadmath.so*
+endif
+
 TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 # Details about sysroot directory selection.
-- 
2.7.3
