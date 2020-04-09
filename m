From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Apr 2020 09:25:25 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] package/haproxy: security
 bump to version 2.0.14
Message-ID: <20200409073234.4C79F8E1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53e878affaa994ae8b1f3c27f23cf6792836f2fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

- Fix CVE-2020-11100: In hpack_dht_insert in hpack-tbl.c in the HPACK
  decoder in HAProxy 1.8 through 2.x before 2.1.4, a remote attacker can
  write arbitrary bytes around a certain location on the heap via a
  crafted HTTP/2 request, possibly causing remote code execution.

  https://www.mail-archive.com/haproxy at formilux.org/msg36877.html

- Update indentation of hash file (two spaces)

Furthermore, 2.0.11..2.0.13 contains a number of bugfixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 87a29eeba1..f35f712480 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.0/src/haproxy-2.0.10.tar.gz.sha256
-sha256 1d38ab3dd45e930b209e922a360ee8c636103e21e5b5a2656d3795401316a4ea haproxy-2.0.10.tar.gz
+# From: http://www.haproxy.org/download/2.0/src/haproxy-2.0.14.tar.gz.sha256
+sha256  552a708b8b6efd0f241f5d9fd7ad4168d37ce17cdb6dcb6239c2e519f0a63c75  haproxy-2.0.14.tar.gz
 # Locally computed:
 sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 9f6f2818ae..4303a58ad2 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.0
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).10
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
