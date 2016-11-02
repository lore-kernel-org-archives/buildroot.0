From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:27:11 +0100
Subject: [Buildroot] [git commit] memcached: security bump to version 1.4.33
Message-ID: <20161102162724.116E78183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2a7769d84c6d671d00d15a029811e94d6868b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-8704 - server append/prepend remote code execution
vulnerability.
CVE-2016-8705 - server update remote code execution vulnerability.
CVE-2016-8706 - server SASL authentication remote code execution
vulnerability.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index dbc0c0d..256442a 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.32.tar.gz.sha1
-sha1	cbec6b533fe037b5ad5c54d111e0d30bc9db4424	memcached-1.4.32.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.33.tar.gz.sha1
+sha1	e343530c55946ccbdd78c488355b02eaf90b3b46	memcached-1.4.33.tar.gz
 # Calculated based on the hash above
-sha256	54bb9acd5fbbb73cd1fbfa67cbc6b301009a2835a26c8a4c3dba634a0c3d875d	memcached-1.4.32.tar.gz
+sha256	83726c8d68258c56712373072abb25a449c257398075a39ec0867fd8ba69771d	memcached-1.4.33.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 2d84574..74cf6b8 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.32
+MEMCACHED_VERSION = 1.4.33
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
