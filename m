From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  8 Apr 2020 23:00:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: security bump to version
 2.1.4
Message-ID: <20200408210006.540664-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2020-11100: In hpack_dht_insert in hpack-tbl.c in the HPACK
  decoder in HAProxy 1.8 through 2.x before 2.1.4, a remote attacker can
  write arbitrary bytes around a certain location on the heap via a
  crafted HTTP/2 request, possibly causing remote code execution.
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 10 +++++-----
 package/haproxy/haproxy.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 7f03e88d43..b89bda834b 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,6 +1,6 @@
-# From: http://www.haproxy.org/download/2.1/src/haproxy-2.1.2.tar.gz.sha256
-sha256	6079b08a8905ade5a9a2835ead8963ee10a855d8508a85efb7181eea2d310b77	haproxy-2.1.2.tar.gz
+# From: http://www.haproxy.org/download/2.1/src/haproxy-2.1.4.tar.gz.sha256
+sha256  51030ff696d7067162b4d24d354044293aecfbb36d7acc2f840c8d928bfe91cd  haproxy-2.1.4.tar.gz
 # Locally computed:
-sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
-sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
-sha256	ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7	doc/gpl.txt
+sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
+sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  doc/gpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 673e092d48..6752367fac 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.1
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).2
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.25.1
