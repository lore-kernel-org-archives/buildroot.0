From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Mar 2021 23:34:19 +0100
Subject: [Buildroot] [PATCH v1] package/wget: bump version to 1.12.1
Message-ID: <20210313223419.26648-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update/fix signing key hash

For details see [1], [2].

[1] https://lists.gnu.org/archive/html/info-gnu/2020-12/msg00013.html
[2] https://lists.gnu.org/archive/html/info-gnu/2021-01/msg00007.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wget/wget.hash | 8 ++++----
 package/wget/wget.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 956e1127f3..11071566aa 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.20.3.tar.lz.sig
-# with key 1CB27DBC98614B2D5841646D08302DB6A2670428
-sha256 69607ce8216c2d1126b7a872db594b3f21e511e660e07ca1f81be96650932abb  wget-1.20.3.tar.lz
+# https://ftp.gnu.org/gnu/wget/wget-1.21.tar.lz.sig
+# with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
+sha256  db9bbe5347e6faa06fc78805eeb808b268979455ead9003a608569c9d4fc90ad  wget-1.21.1.tar.lz
 # Locally calculated
-sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 65c132e453..ae036478b8 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.20.3
+WGET_VERSION = 1.21.1
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.30.1
