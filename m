From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 15:08:12 +0200
Subject: [Buildroot] [git commit] package/efl: add libunwind optional
	dependency
Message-ID: <20170417130858.AC44882757@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51597e99e963075c20e5e6ed193aa02d50a98b29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no configure option to enable/disable libunwind support.
See efl/m4/efl_libunwind.m4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
