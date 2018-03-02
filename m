From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri,  2 Mar 2018 10:07:55 -0800
Subject: [Buildroot] [PATCH 1/2] memcached: bump to version 1.5.6
Message-ID: <20180302180756.14315-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From ReleaseNotes156

This is a bugfix release, but it primarily disables the UDP protocol by
default.

In the last few days reports of UDP amplification attacks utilizing
inesure memcached instances have surfaced. Attackers are able to set
large values into memcached, then send requests via spoofed UDP packets.
Memcached will then send a very large number of very large UDP packets
back in response.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/memcached/memcached.hash | 7 +++----
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 204590d27c..8278933827 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,3 @@
-# From http://www.memcached.org/files/memcached-1.5.0.tar.gz.sha1
-sha1 e12af93e63c05ab7e89398e4cfd0bfc7b7bff1c5  memcached-1.5.0.tar.gz
-# Calculated based on the hash above
-sha256 c001f812024bb461b5e4d7d0506daab63dff9614eea26f46536c3b7e1e601c32  memcached-1.5.0.tar.gz
+# From http://www.memcached.org/files/memcached-1.5.6.tar.gz.sha1
+sha1 ca35929e74b132c2495a6957cfdc80556337fb90  memcached-1.5.6.tar.gz
+sha256 9675ee859d7d81f7a950f190a6812720b26f08228d356044ec517d4d5af25f03  memcached-1.5.6.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index d0e3bc01d9..c15abc79bf 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.5.0
+MEMCACHED_VERSION = 1.5.6
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.14.3
