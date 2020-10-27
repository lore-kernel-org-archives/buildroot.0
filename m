From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Oct 2020 19:33:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/memcached: security bump to version
 1.6.8
Message-ID: <20201027183308.458232-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Small security related release. A remote crash is possible if UDP is
enabled. The remediation is to upgrade or disable UDP. The crash was
introduced in the 1.6 series.

https://github.com/memcached/memcached/wiki/ReleaseNotes168

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index d616c856b1..1330f6521c 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.7.tar.gz.sha1
-sha1  49336bb0a4b7ad296422b08148581ed54edf32d0  memcached-1.6.7.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.8.tar.gz.sha1
+sha1  8f3efd851efc5b822bd991b93d06a271b2fac052  memcached-1.6.8.tar.gz
 
 # Locally computed
-sha256  7bbdac9b031d8cfca4a1207f28df598b90ee2e9b44667f7eabd0fe1a59ca5173  memcached-1.6.7.tar.gz
+sha256  e23b3a11f6ff52ac04ae5ea2e287052ce58fd1eadd394622eb65c3598fcd7939  memcached-1.6.8.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index cc5227abf0..378f57a276 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.7
+MEMCACHED_VERSION = 1.6.8
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.28.0
