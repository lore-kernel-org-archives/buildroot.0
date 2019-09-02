From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 16:01:52 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libgit2: security
 bump to version 0.27.9
Message-ID: <20190902135747.8564489168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d300f83d27d5baddf898fbf01d130e3d1eff51fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following security issues:

    A carefully constructed commit object with a very large number
    of parents may lead to potential out-of-bounds writes or
    potential denial of service.

    The ProgramData configuration file is always read for compatibility
    with Git for Windows and Portable Git installations. The ProgramData
    location is not necessarily writable only by administrators, so we
    now ensure that the configuration file is owned by the administrator
    or the current user.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bee5ab6c9d68c7ddb04d64e2ebe714eca882b2f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 29b829291c..2d06c26d2d 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8313873d49dc01e8b880ec334d7430ae67496a89aaa8c6e7bbd3affb47a00c76  libgit2-v0.27.8.tar.gz
+sha256	adf17310b590e6e7618f070c742b5ee028aeeed2c60099bc4190c386b5060de1  libgit2-0.27.9.tar.gz
 sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 6c64aa67c8..25a93d72f3 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = v0.27.8
-LIBGIT2_SITE = $(call github,libgit2,libgit2,$(LIBGIT2_VERSION))
+LIBGIT2_VERSION = 0.27.9
+LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_INSTALL_STAGING = YES
