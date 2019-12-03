From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 17:36:25 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/haproxy: security
 bump to version 1.9.13
Message-ID: <20191203162905.5D5C5867D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7360fba5a59c29d629151c7c9e00114fa3ebee62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-19330: The HTTP/2 implementation in HAProxy before 2.0.10
  mishandles headers, as demonstrated by carriage return (CR, ASCII 0xd),
  line feed (LF, ASCII 0xa), and the zero character (NUL, ASCII 0x0), aka
  Intermediary Encapsulation Attacks (1.9.13)

- CVE-2019-14241: HAProxy through 2.0.2 allows attackers to cause a denial
  of service (ha_panic) via vectors related to
  htx_manage_client_side_cookies in proto_htx.c (1.9.9)

- CVE-2019-11323: HAProxy before 1.9.7 mishandles a reload with rotated
  keys, which triggers use of uninitialized, and very predictable, HMAC
  keys.  This is related to an include/types/ssl_sock.h error (1.9.7)

In addition, a large number of non-security related bugs have been fixed.
See the changelog for details:

https://www.haproxy.org/download/1.9/src/CHANGELOG

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 2 +-
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index be3451d83b..6060400de4 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	ad46312fa1e38763863807d2c9304551c28ad91cff83f0c21a36756913c1c8e1	haproxy-1.9.1.tar.gz
+sha256	adae40f963b03df0917edc44681064627f77683dcf7db66ef030672ad6d00547	haproxy-1.9.13.tar.gz
 sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
 sha256	ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7	doc/gpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index e382f61f8e..aa440d7d66 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 1.9
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).1
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
