From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 15:17:34 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/rauc: security
 bump to version 1.5
Message-ID: <20201222140041.8A9D1813D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=993c977d442a50f1aa706cc396262b71177b3fce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

- CVE-2020-25860: Time-of-Check-Time-of-Use Vulnerability in code that
  checks and installs a firmware bundle.
  For more details, see the advisory:
  https://github.com/rauc/rauc/security/advisories/GHSA-cgf3-h62j-w9vv

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 41bbe8df540e2c630ad04f8db7383a7e7705f368)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index d327122293..73c1add995 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.4/rauc-1.4.tar.xz.asc
-sha256  85aabf214cd93a37f7ad0b3aaad89eb94facf0f3ebf6e2edca945acbca9b0967  rauc-1.4.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.5/rauc-1.5.tar.xz.asc
+sha256  5dfbc46e808240c5014d318cfe64f0431307c37aa79cb2b013caa12daaf96d9d  rauc-1.5.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index a6c7c01095..fd39f000a8 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.4
+RAUC_VERSION = 1.5
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
