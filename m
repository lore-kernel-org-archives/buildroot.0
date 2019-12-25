From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 18:09:14 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libssh: security
 bump to version 0.9.3
Message-ID: <20191225170049.DF2048E355@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a4fc9288c2a7dd8cc11e1e2c62c2414069ea93f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-14889: Unsanitized location in scp could lead to unwanted command
  execution.

And adds various hardening improvements.  For details, see the announcement:

https://www.libssh.org/2019/12/10/libssh-0-9-3-and-libssh-0-8-8-security-release/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7f723e4ea3510dd9ab90ab7ddd08dadf349495a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 2f5708ddac..ca296701bf 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.9/libssh-0.9.0.tar.xz.asc
+# https://www.libssh.org/files/0.9/libssh-0.9.3.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256 25303c2995e663cd169fdd902bae88106f48242d7e96311d74f812023482c7a5  libssh-0.9.0.tar.xz
+sha256 2c8b5f894dced58b3d629f16f3afa6562c20b4bdc894639163cf657833688f0c  libssh-0.9.3.tar.xz
 sha256 1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index d5f22c29a0..ce0defa473 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.9
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
