From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Apr 2019 19:13:11 +0200
Subject: [Buildroot] [git commit] package/wget: security bump to version
 1.20.3
Message-ID: <20190406171029.9E7B381387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d732da7a2088f375aa7fd59860589c9b81568ae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2019-5953: Buffer overflow vulnerability

For more details, see the announcement:
https://lists.gnu.org/archive/html/bug-wget/2019-04/msg00015.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index e49768ee2c..956e1127f3 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.20.2.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.20.3.tar.lz.sig
 # with key 1CB27DBC98614B2D5841646D08302DB6A2670428
-sha256 84d3cbece8c08e130a8da0a72cf6e543a2adf58ca8ecf28726560b06243d4ce6  wget-1.20.2.tar.lz
+sha256 69607ce8216c2d1126b7a872db594b3f21e511e660e07ca1f81be96650932abb  wget-1.20.3.tar.lz
 # Locally calculated
 sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 50405e5bf9..7b9c3e75d9 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.20.2
+WGET_VERSION = 1.20.3
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
