From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 22:00:43 +0200
Subject: [Buildroot] [git commit] package/rpcbind fix version number
Message-ID: <20210614193016.A1D728D5FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1011f9a8e9c206fe78a97c0f80d6e23896c558af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d13b292cec8166c4712cf4a0defbeee827ffaf78 introduced a patch for rpcbind but also changed the version number to a non-existing value.

Change rpcbind to last released version and adapt hash value.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998 at free.fr: fix version in patch too, noticed by Baruch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpcbind/0001-Remove-yellow-pages-support.patch | 2 +-
 package/rpcbind/rpcbind.hash                           | 2 +-
 package/rpcbind/rpcbind.mk                             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpcbind/0001-Remove-yellow-pages-support.patch b/package/rpcbind/0001-Remove-yellow-pages-support.patch
index 9303d71c96..694f1ac9de 100644
--- a/package/rpcbind/0001-Remove-yellow-pages-support.patch
+++ b/package/rpcbind/0001-Remove-yellow-pages-support.patch
@@ -8,7 +8,7 @@ available. As most Buildroot users are most likely never going to need
 such feature, get rid of it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[ rebased for 1.3.2 ]
+[ rebased for 1.2.6 ]
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  src/security.c | 15 ---------------
diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index 1960b86c13..6ab7d89265 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a  rpcbind-1.2.5.tar.bz2
+sha256 5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de  rpcbind-1.2.6.tar.bz2
 sha256 2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index fea2103794..d9f25e698e 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.3.2
+RPCBIND_VERSION = 1.2.6
 RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
