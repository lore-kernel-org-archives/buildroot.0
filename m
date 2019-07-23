From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 00:25:39 +0200
Subject: [Buildroot] [git commit] package/git: remove autoreconf
Message-ID: <20190723222334.EA4C48688D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d328cdca66b248eed480e1743c7979294c4e26d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After (8aa5ee1721 package/git: bump to version 2.22.0) autoreconf
is not needed anymore because patch which modified the configure
script was removed.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/git/git.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 1b4a1a51e9..c91cd5210b 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -10,7 +10,6 @@ GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
-GIT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += host-pkgconf openssl
