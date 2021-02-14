From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:50:16 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/subversion:
 security bump to version 1.14.1
Message-ID: <20210214163443.B89EC815F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=952c3d364aa8e6f823c1a44d6c47e435f4fc0e12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes the following security issue:

CVE-2020-17525: Remote unauthenticated denial-of-service in Subversion
mod_authz_svn

Subversion's mod_authz_svn module will crash if the server is using
in-repository authz rules with the AuthzSVNReposRelativeAccessFile option
and a client sends a request for a non-existing repository URL.

For more details, see the advisory:
https://subversion.apache.org/security/CVE-2020-17525-advisory.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4109401acdb195d16c3f32219492ed53f83206b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.hash | 4 ++--
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index da0fe91184..534d596514 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
-# From https://www.apache.org/dist/subversion/subversion-1.14.0.tar.bz2.sha512
-sha512  af6b706fdc91f7ab292fce9d9de582da306fd11e92767dc852687e71a6a8b65bb867fa70d5afd7f76a46005acb1b3c2d3193e690def48cd26875b3a7851cd13b  subversion-1.14.0.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.14.1.tar.bz2.sha512
+sha512  0a70c7152b77cdbcb810a029263e4b3240b6ef41d1c19714e793594088d3cca758d40dfbc05622a806b06463becb73207df249393924ce591026b749b875fcdd  subversion-1.14.1.tar.bz2
 
 # Locally calculated
 sha256  484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad  LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 83a359b966..b434221151 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.14.0
+SUBVERSION_VERSION = 1.14.1
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = https://downloads.apache.org/subversion
 SUBVERSION_LICENSE = Apache-2.0
