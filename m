From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2020 23:44:38 +0100
Subject: [Buildroot] [git commit] package/privoxy: security bump to version
 3.0.29
Message-ID: <20201130222959.535B2825CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ef54b7d0bc7163b54f35c0ce618beb40a6ed22f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:

- Security/Reliability:
  - Fixed memory leaks when a response is buffered and the buffer
    limit is reached or Privoxy is running out of memory.
    Commits bbd53f1010b and 4490d451f9b. OVE-20201118-0001.
    Sponsored by: Robert Klemme
  - Fixed a memory leak in the show-status CGI handler when
    no action files are configured. Commit c62254a686.
    OVE-20201118-0002.
    Sponsored by: Robert Klemme
  - Fixed a memory leak in the show-status CGI handler when
    no filter files are configured. Commit 1b1370f7a8a.
    OVE-20201118-0003.
    Sponsored by: Robert Klemme
  - Fixes a memory leak when client tags are active.
    Commit 245e1cf32. OVE-20201118-0004.
    Sponsored by: Robert Klemme
  - Fixed a memory leak if multiple filters are executed
    and the last one is skipped due to a pcre error.
    Commit 5cfb7bc8fe. OVE-20201118-0005.
  - Prevent an unlikely dereference of a NULL-pointer that
    could result in a crash if accept-intercepted-requests
    was enabled, Privoxy failed to get the request destination
    from the Host header and a memory allocation failed.
    Commit 7530132349. CID 267165. OVE-20201118-0006.
  - Fixed memory leaks in the client-tags CGI handler when
    client tags are configured and memory allocations fail.
    Commit cf5640eb2a. CID 267168. OVE-20201118-0007.
  - Fixed memory leaks in the show-status CGI handler when memory
    allocations fail. Commit 064eac5fd0 and commit fdee85c0bf3.
    CID 305233. OVE-20201118-0008.

For more details, see the announcement:
https://www.openwall.com/lists/oss-security/2020/11/29/1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/privoxy/privoxy.hash | 8 ++++----
 package/privoxy/privoxy.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 84daf5c611..850208dd9f 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,6 +1,6 @@
-# From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.28%20%28stable%29/
-md5  c7e8900d5aff33d9a5fc37ac28154f21  privoxy-3.0.28-stable-src.tar.gz
-sha1  fa8f9f355a48afe94afcaef31c5404b2294c1043  privoxy-3.0.28-stable-src.tar.gz
+# From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.28%20%29stable%29/
+md5  493a3a643247e6c8bc60725e9993d4ee  privoxy-3.0.29-stable-src.tar.gz
+sha1  59873a122729b1b03e1d202d663036d2b5fa1120  privoxy-3.0.29-stable-src.tar.gz
 # Locally computed
-sha256  b5d78cc036aaadb3b7cf860e9d598d7332af468926a26e2d56167f1cb6f2824a  privoxy-3.0.28-stable-src.tar.gz
+sha256  25c6069efdaf577d47c257da63b03cd6d063fb790e19cc39603d82e5db72489d  privoxy-3.0.29-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index f12d015efa..3cf1dc9754 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 3.0.28
+PRIVOXY_VERSION = 3.0.29
 PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
