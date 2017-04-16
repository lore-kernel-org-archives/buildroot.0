From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 16 Apr 2017 21:49:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: add libunwind optional
	dependency
Message-ID: <20170416194906.9842-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no configure option to enable/disable libunwind support.
See efl/m4/efl_libunwind.m4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/efl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 4008d30..04e15f5 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -293,6 +293,10 @@ endef
 EFL_POST_INSTALL_TARGET_HOOKS = EFL_HOOK_REMOVE_UPOWER
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+EFL_DEPENDENCIES += libunwind
+endif
+
 $(eval $(autotools-package))
 
 ################################################################################
-- 
2.9.3
