From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 14:03:24 +0100
Subject: [Buildroot] [git commit] Revert "package/janet: add -std=c99 to
 CFLAGS"
Message-ID: <20210314124004.3355C8120A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3193e37374bae4c09ebd721a4804ab5d58b863c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b5e8f1c1475b46c8d9b7159aafe983e72d329d29. Indeed,
this commit does not fix the build failure as c_std=c99 is already set
in default_options in meson.build.

The issue is that this parameter is not used for native executables
since meson 0.51.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/janet/janet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index ea042221d8..7243d60c01 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -8,8 +8,8 @@ JANET_VERSION = 1.15.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
+
 JANET_INSTALL_STAGING = YES
-JANET_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JANET_CONF_OPTS += -Ddynamic_modules=false
