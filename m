From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:43:49 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/wget: security
 bump to version 1.20.2
Message-ID: <20190405154002.9E4038D785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d54047a1e038dc23f077309aaef826b9488c75bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

From NEWS:

* Changes in Wget 1.20.2
** Fixed a buffer overflow vulnerability

For more details, see the announcement:
https://lists.gnu.org/archive/html/info-gnu/2019-04/msg00000.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c21d440c8a79a6af284ec5793481d1b8a0b298ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 7d1a1c5521..e49768ee2c 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.20.1.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.20.2.tar.lz.sig
 # with key 1CB27DBC98614B2D5841646D08302DB6A2670428
-sha256 0f63e84dd23dc53ab3ab6f483c3afff8301e54c165783f772101cdd9b1c64928  wget-1.20.1.tar.lz
+sha256 84d3cbece8c08e130a8da0a72cf6e543a2adf58ca8ecf28726560b06243d4ce6  wget-1.20.2.tar.lz
 # Locally calculated
 sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 5cdecbcc81..50405e5bf9 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.20.1
+WGET_VERSION = 1.20.2
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
