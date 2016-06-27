From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:07:31 +0100
Subject: [Buildroot] [PATCH 05/13] package/gcc: select
	BR2_TOOLCHAIN_HAS_FORTRAN when appropriated
In-Reply-To: <1467040059-38085-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040059-38085-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467040059-38085-5-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This is only for the Buildroot toolchain backend.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 54f7e1f..5ebc765 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -121,6 +121,7 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
 config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	bool "Enable Fortran support"
 	depends on BR2_USE_WCHAR # libquadmath
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Enable this option if you want your toolchain to support the
 	  Fortran language and you want Fortran libraries to be
-- 
2.7.3
