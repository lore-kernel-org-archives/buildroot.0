From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 22 Apr 2021 07:29:22 +0000
Subject: [Buildroot] [PATCH 1/1] package/libupnp: security bump to version
 1.14.6
Message-ID: <20210422072922.63604-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The server part of pupnp (libupnp) appears to be vulnerable to DNS-rebinding
attacks because it does not check the value of the `Host` header.

Fixes CVE-2021-29462

https://github.com/pupnp/pupnp/security/advisories/GHSA-6hqq-w3jq-9fhg

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 8923d46f5f..e4858fdc8a 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  227ffa407be6b91d4e42abee1dd27e4b8d7e5ba8d3d45394cca4e1eadc65149a  libupnp-1.14.5.tar.bz2
+sha256  3168f676352e2a6e45afd6ea063721ed674c99f555394903fbd23f7f54f0a503  libupnp-1.14.6.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index f79d169dc8..e8ece46542 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.5
+LIBUPNP_VERSION = 1.14.6
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
-- 
2.31.1
