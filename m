From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2020 21:39:36 +0200
Subject: [Buildroot] [git commit] package/sentry-native: fix double variable
 assignment
Message-ID: <20200921193102.E815582650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb216e3d8ade12442db794cbe5780e53bc082be8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SENTRY_NATIVE_INSTALL_STAGING is assigned twice, causing check-package
issues:

    package/sentry-native/sentry-native.mk:13: unconditional override of
    variable SENTRY_NATIVE_INSTALL_STAGING

Fixes:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/747319630

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sentry-native/sentry-native.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/sentry-native/sentry-native.mk b/package/sentry-native/sentry-native.mk
index b2b86d4586..f074388970 100644
--- a/package/sentry-native/sentry-native.mk
+++ b/package/sentry-native/sentry-native.mk
@@ -6,7 +6,6 @@
 
 SENTRY_NATIVE_VERSION = 0.4.1
 SENTRY_NATIVE_SITE = $(call github,getsentry,sentry-native,$(SENTRY_NATIVE_VERSION))
-SENTRY_NATIVE_INSTALL_STAGING = YES
 SENTRY_NATIVE_LICENSE = MIT
 SENTRY_NATIVE_LICENSE_FILES = LICENSE
 SENTRY_NATIVE_DEPENDENCIES = libcurl google-breakpad
