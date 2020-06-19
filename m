From: Ralph Siemsen <ralphs@netwinder.org>
Date: Fri, 19 Jun 2020 08:46:06 -0400
Subject: [Buildroot] [PATCH] package/ktap: fix compilation with gcc >= 8.x
 and newer kernel
Message-ID: <20200619124606.125213-1-ralphs@netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package currently fails to build for multiple architectures.
Can be fixed with two patches, taken from following github PR:
https://github.com/ktap/ktap/pull/107

---
Direct links to the patches, for reviewers convenience:
https://github.com/ktap/ktap/pull/107/commits/65923a4439398318e6d395da76e3f8c28bd6e1d4
https://github.com/ktap/ktap/pull/107/commits/b2651aa7dca61e55d16668adb7b849fde6755e4c

 package/ktap/ktap.hash | 2 ++
 package/ktap/ktap.mk   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/ktap/ktap.hash b/package/ktap/ktap.hash
index 1eff712501..697c0356c7 100644
--- a/package/ktap/ktap.hash
+++ b/package/ktap/ktap.hash
@@ -1,3 +1,5 @@
 # Locally calculated
 sha256 44a0808d57175cf9d15466f720e1e10d5ed1abc3497aedf9ddd6469545552345  ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f.tar.gz
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE-GPL
+sha256 5b0ecb2e3d73df5f91513834dc64ea2e3845fa6cfbd74c895d9182498b799c7c  65923a4439398318e6d395da76e3f8c28bd6e1d4.patch
+sha256 a3dca7eacaec4a2a22e9fa58328aa454b58cebc763f552a433d6ff2961e2cb26  b2651aa7dca61e55d16668adb7b849fde6755e4c.patch
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 3b9134da65..7479fa3b13 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -8,6 +8,8 @@ KTAP_VERSION = 23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f
 KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
 KTAP_LICENSE = GPL-2.0
 KTAP_LICENSE_FILES = LICENSE-GPL
+KTAP_PATCH += https://github.com/leitao/ktap/commit/65923a4439398318e6d395da76e3f8c28bd6e1d4.patch
+KTAP_PATCH += https://github.com/leitao/ktap/commit/b2651aa7dca61e55d16668adb7b849fde6755e4c.patch
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 KTAP_DEPENDENCIES += elfutils
-- 
2.17.1
