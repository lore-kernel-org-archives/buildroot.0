From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:10:09 +0100
Subject: [Buildroot] [git commit] package/haproxy: security bump to version
 2.0.10
Message-ID: <20191129090526.26AB580418@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbd4c6028e18349359673e5841f3246503d93c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities:

- CVE-2019-19330: The HTTP/2 implementation in HAProxy before 2.0.10
  mishandles headers, as demonstrated by carriage return (CR, ASCII 0xd),
  line feed (LF, ASCII 0xa), and the zero character (NUL, ASCII 0x0), aka
  Intermediary Encapsulation Attacks.

In addition, 2.0.6..10 fixes a number of bugs.  See the changelog for
details:

https://www.haproxy.org/download/2.0/src/CHANGELOG

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 0b4ecdc25c..87a29eeba1 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.0/src/haproxy-2.0.5.tar.gz.sha256
-sha256 3f2e0d40af66dd6df1dc2f6055d3de106ba62836d77b4c2e497a82a4bdbc5422 haproxy-2.0.5.tar.gz
+# From: http://www.haproxy.org/download/2.0/src/haproxy-2.0.10.tar.gz.sha256
+sha256 1d38ab3dd45e930b209e922a360ee8c636103e21e5b5a2656d3795401316a4ea haproxy-2.0.10.tar.gz
 # Locally computed:
 sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 9d0ef5710f..9f6f2818ae 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.0
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).5
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).10
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
