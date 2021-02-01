From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  1 Feb 2021 13:48:47 +0100
Subject: [Buildroot] [PATCH] package/privoxy: security bump to version 3.0.31
Message-ID: <20210201124848.9388-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the announcement:

ChangeLog for Privoxy 3.0.31
--------------------------------------------------------------------
- Security/Reliability:
  - Prevent an assertion from getting triggered by a crafted CGI request.
    Commit 5bba5b89193fa. OVE-20210130-0001.
    Reported by: Joshua Rogers (Opera)
  - Fixed a memory leak when decompression fails "unexpectedly".
    Commit f431d61740cc0. OVE-20210128-0001.

- Bug fixes:
  - Fixed detection of insufficient data for decompression.
    Previously Privoxy could try to decompress a partly
    uninitialized buffer.

https://www.privoxy.org/announce.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/privoxy/privoxy.hash | 8 ++++----
 package/privoxy/privoxy.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 850208dd9f..00c0f33bdb 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,6 +1,6 @@
-# From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.28%20%29stable%29/
-md5  493a3a643247e6c8bc60725e9993d4ee  privoxy-3.0.29-stable-src.tar.gz
-sha1  59873a122729b1b03e1d202d663036d2b5fa1120  privoxy-3.0.29-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.31%20%28stable%29/
+md5  014cc371d00e84b2db34d0e2b05c77d4  privoxy-3.0.31-stable-src.tar.gz
+sha1  4f0e0c36d55f72f6b33e4c645a9c5d4f40026abd  privoxy-3.0.31-stable-src.tar.gz
 # Locally computed
-sha256  25c6069efdaf577d47c257da63b03cd6d063fb790e19cc39603d82e5db72489d  privoxy-3.0.29-stable-src.tar.gz
+sha256  077729a3aac79222a4e8d88a650d9028d16fd4b0d6038da8f5f5e47120d004eb  privoxy-3.0.31-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 3cf1dc9754..5c1f862bfd 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 3.0.29
+PRIVOXY_VERSION = 3.0.31
 PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
-- 
2.20.1
