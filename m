From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Apr 2020 09:41:47 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/haproxy: security
 bump to version 1.9.15
Message-ID: <20200409073229.CCEC28E1EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8be2d4ab29b11e7286c616525866307ba1220241
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Fix CVE-2020-11100: In hpack_dht_insert in hpack-tbl.c in the HPACK
  decoder in HAProxy 1.8 through 2.x before 2.1.4, a remote attacker can
  write arbitrary bytes around a certain location on the heap via a
  crafted HTTP/2 request, possibly causing remote code execution.

  https://www.mail-archive.com/haproxy at formilux.org/msg36878.html

Furthermore, 1.9.14 contains a number of bugfixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 2 +-
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 6060400de4..c33e336d29 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	adae40f963b03df0917edc44681064627f77683dcf7db66ef030672ad6d00547	haproxy-1.9.13.tar.gz
+sha256	291871c7f0145da14cc7222d2f68d3a0ec1c10734d91fd933226d3a103aebea5	haproxy-1.9.15.tar.gz
 sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
 sha256	ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7	doc/gpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index aa440d7d66..1d32e7d31e 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 1.9
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
