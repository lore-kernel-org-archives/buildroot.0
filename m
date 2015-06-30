From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 12:25:50 +0200
Subject: [Buildroot] [git commit] pure-ftpd: fix hash and use .bz2 tarball
Message-ID: <20150630102717.46551807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84f6eb9fe3467abbd94a6b481ae5106679d61e24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, the hash file added in commit
ee6c9f5a1bc1995d968214345c011a44a3c145c8 by Gustavo turns out to be
wrong, so this commit replaces it with the proper hash, also added
after checking the GPG signature.

While at it, we switch to using a .bz2 tarball.

Fixes:

  http://autobuild.buildroot.org/results/c44/c441f35119191f47dd5fae96fd76827024e50329/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pure-ftpd/pure-ftpd.hash |    2 +-
 package/pure-ftpd/pure-ftpd.mk   |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index d0d35ac..d1f812e 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b72456def52c71baf8d0367ca6b7aba10796e2883a76eeb41f58f2f06f7087ba	pure-ftpd-1.0.41.tar.gz
+sha256	1d48f650f366b8151d86b86c79f4bb874e95143bdac0e767038eda832d28a010	pure-ftpd-1.0.41.tar.bz2
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 3c59bb1..8269327 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -6,6 +6,7 @@
 
 PURE_FTPD_VERSION = 1.0.41
 PURE_FTPD_SITE = http://download.pureftpd.org/pub/pure-ftpd/releases
+PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
 PURE_FTPD_LICENSE_FILES = COPYING
 PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
