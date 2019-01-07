From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jan 2019 08:50:12 +0100
Subject: [Buildroot] [git commit] package/liburiparser: security bump to
 version 0.9.1
Message-ID: <20190107075038.1A60D8A559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=518eb53ec5c14bfbc41353322cd45127ad43489b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes an out-of-bounds read, the parsing of some a malformed URIs and a
function that reported 1 more byte than actually needed for IPv4 address
URIs. For additional datails, see

    https://github.com/uriparser/uriparser/blob/uriparser-0.9.1/ChangeLog

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburiparser/liburiparser.hash | 2 +-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index f71dd5cc7b..bbdb37329d 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ec67eb34feda8eac166f281799f03ed48387694fca44f6f5852f61f8fb535e2c  uriparser-0.9.0.tar.bz2
+sha256  75248f3de3b7b13c8c9735ff7b86ebe72cbb8ad043291517d7d53488e0893abe  uriparser-0.9.1.tar.bz2
 sha256  ee90029e62d11f48faa59360d15c3ad8e7c094c74cc25b055716d92340da561f  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 62bc8d30d1..529f70190c 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.0
+LIBURIPARSER_VERSION = 0.9.1
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
