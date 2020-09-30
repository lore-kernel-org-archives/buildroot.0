From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:48:04 +0200
Subject: [Buildroot] [git commit] package/open2300: switch to github
Message-ID: <20200930193757.6DC7C8E55C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d0b9e2fb32f999d7f9b0bf9b85aca5522ac0c7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream repository has been dead for quite a while now, and in fact
we are using s.b.o as the "official" location now.

There however exists a Github repository, which is still alive. That
repository has not been touched in a looooong while, but it's still
up, and there is a revision which actually gives the exact same
content (although the hash changes, because the directory name has
changed, from open2300-12/ to open2300-f2198.../).

Also fix spaces in hash file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/open2300/open2300.hash | 6 ++----
 package/open2300/open2300.mk   | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/open2300/open2300.hash b/package/open2300/open2300.hash
index 414041b923..f8b1150694 100644
--- a/package/open2300/open2300.hash
+++ b/package/open2300/open2300.hash
@@ -1,6 +1,4 @@
 # Localy computed
-# Note: open2300's upstream svn tree is off-line, so this tarball is
-# served from s.b.o. instead, which actually makes it stable.
-sha256	f4239d2f16d52156586d06be38f06a3eb58168377e243a8de8720b66e33ddb8f  open2300-12.tar.gz
+sha256  ffa7f8d35b16abfbf5e52285cb21f2a7fc6afb901abb40c0c80eef9d23d08aab  open2300-f21982e0b1f8321561e5ad1668307fde97700e1b.tar.gz
 
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 0ffb8b5046..9fb7dbc2fd 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-OPEN2300_SITE = http://www.lavrsen.dk/svn/open2300/trunk
-OPEN2300_SITE_METHOD = svn
-OPEN2300_VERSION = 12
+OPEN2300_VERSION = f21982e0b1f8321561e5ad1668307fde97700e1b
+OPEN2300_SITE = $(call github,wezm,open2300,$(OPEN2300_VERSION))
 OPEN2300_LICENSE = GPL-2.0
 OPEN2300_LICENSE_FILES = COPYING
 
