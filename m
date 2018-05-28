From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:14:55 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] wget: security bump to
 version 1.19.5
Message-ID: <20180528142834.6FCED805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cb41540ae18e8ce858066393b9ea2d1fe82d134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-0494: cookie injection vulnerability.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cc39457fb9e1f569ca4958374046d5d99fcc50cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index ab0d1d1dfd..eee4a5194e 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.19.4.tar.lz.sig
-sha256 2fc0ffb965a8dc8f1e4a89cbe834c0ae7b9c22f559ebafc84c7874ad1866559a  wget-1.19.4.tar.lz
+# https://ftp.gnu.org/gnu/wget/wget-1.19.5.tar.lz.sig
+sha256 29fbe6f3d5408430c572a63fe32bd43d5860f32691173dfd84edc06869edca75  wget-1.19.5.tar.lz
 # Locally calculated
 sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 23e4c8acca..72a73cce79 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.19.4
+WGET_VERSION = 1.19.5
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
