From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 19:38:45 +0200
Subject: [Buildroot] [git commit] Revert "package/luvi: bump version to
 2.8.0"
Message-ID: <20181020173714.43FB68777D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4025a65604c0be322cf02e7b3e3c76c3b19a3ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ac6fedda6b43996545ff498cd19a781698a96050.

Quoting J??rg Krause:
http://lists.busybox.net/pipermail/buildroot/2018-August/228534.html

"The version bump as version 2.8.0 does only updates the projects
 submodules, which we are not using at all. Instead, we always build
 luvi with dependencies provided as packages in Buildroot."

[Peter: drop autobuilder reference, issue is in luv, not luvi]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luvi/luvi.hash | 3 +--
 package/luvi/luvi.mk   | 9 +++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index d5716e0036..e2239b6171 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 a18e138c7032ef8406fef6e2135a61fad713861742512f2073adc0b4ab6d8f8b  luvi-v2.8.0.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
+sha256  ce9a1fb762e61267618ddea9ea129170fd543bb918c382b71cb35985d0024c42  luvi-src-v2.7.6.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 8b3b7659b0..4b693e23a2 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.8.0
-LUVI_SITE = https://github.com/luvit/luvi.git
-LUVI_SITE_METHOD = git
-LUVI_GIT_SUBMODULES = YES
+# we keep version 2.7.6 because 2.8.0 causes build errors and only
+# contains updates to submodules we do not need
+LUVI_VERSION = v2.7.6
+LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
+LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit
