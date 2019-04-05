From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:33:18 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/live555: security
 bump to version 2019.03.06
Message-ID: <20190405153704.B28378D783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=200cacbf483de9442180bd6b5fdaa837aa375e44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- CVE-2019-6256: A Denial of Service issue was discovered in the LIVE555
  Streaming Media libraries as used in Live555 Media Server 0.93.  It can
  cause an RTSPServer crash in handleHTTPCmd_TunnelingPOST, when
  RTSP-over-HTTP tunneling is supported, via x-sessioncookie HTTP headers in
  a GET request and a POST request within the same TCP session.  This occurs
  because of a call to an incorrect virtual function pointer in the
  readSocket function in GroupsockHelper.cpp.

- CVE-2019-7314: liblivemedia in Live555 before 2019.02.03 mishandles the
  termination of an RTSP stream after RTP/RTCP-over-RTSP has been set up,
  which could lead to a Use-After-Free error that causes the RTSP server to
  crash (Segmentation fault) or possibly have unspecified other impact.

- CVE-2019-9215: n Live555 before 2019.02.27, malformed headers lead to
  invalid memory access in the parseAuthorizationHeader function.

The normal live555 web site is temporarily unavailable, so use an
alternative _SITE / drop upstream hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ed30a85e5a327dc2c0a840b3ee3ba3ad41400c9e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.hash | 4 +---
 package/live555/live555.mk   | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 024dcac124..f8e5b5e68c 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,3 @@
-# From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5 3383dea853735b7a73eda6ddb52b6372 live.2018.10.17.tar.gz
 # Locally generated
-sha256 7c68d9c95b39acd309a2b6a4fc14c3837544a9be3f64062ed38d1ad6f68dc9e8  live.2018.10.17.tar.gz
+sha256 0bd0c26d980425d9a419d835193e292a08a968f175da1902da4b495f126d5abd  live.2019.03.06.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 6a6d353650..250eea236c 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2018.10.17
+LIVE555_VERSION = 2019.03.06
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
-LIVE555_SITE = http://www.live555.com/liveMedia/public
+LIVE555_SITE = http://www.live555.com
 LIVE555_LICENSE = LGPL-2.1+
 LIVE555_LICENSE_FILES = COPYING
 LIVE555_INSTALL_STAGING = YES
