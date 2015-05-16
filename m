From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 18:28:06 +0200
Subject: [Buildroot] [git commit] Revert "kmod: disable --gc-sections ld
	option when building for xtensa"
Message-ID: <20150516162820.2532880D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e678b07bad96595d9ed88dc4e3b74c566d75f3a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 55c83179c4b30c9ec715a75297849abd74a63e05.
Now that binutils bug with --gc-section is fixed this workaroud is no
longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/kmod.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 1ac83ea..98d9998 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -39,11 +39,6 @@ KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
 KMOD_CONF_OPTS += --enable-python
 endif
 
-# --gc-sections triggers a bug in the current Xtensa binutils
-ifeq ($(BR2_xtensa),y)
-KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=no
-endif
-
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 
 # add license info for kmod tools
