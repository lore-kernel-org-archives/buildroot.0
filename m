From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 16:03:58 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/privoxy: security
 bump to version 3.0.32
Message-ID: <20210313144552.9BA247FBEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=415c99917e5546add6b528641f411a7deb28770e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Privoxy 3.0.32 fixes a number of security issues:

- Security/Reliability:
  - ssplit(): Remove an assertion that could be triggered with a
    crafted CGI request.
    Commit 2256d7b4d67. OVE-20210203-0001.
    Reported by: Joshua Rogers (Opera)
  - cgi_send_banner(): Overrule invalid image types. Prevents a
    crash with a crafted CGI request if Privoxy is toggled off.
    Commit e711c505c48. OVE-20210206-0001.
    Reported by: Joshua Rogers (Opera)
  - socks5_connect(): Don't try to send credentials when none are
    configured. Fixes a crash due to a NULL-pointer dereference
    when the socks server misbehaves.
    Commit 85817cc55b9. OVE-20210207-0001.
    Reported by: Joshua Rogers (Opera)
  - chunked_body_is_complete(): Prevent an invalid read of size two.
    Commit a912ba7bc9c. OVE-20210205-0001.
    Reported by: Joshua Rogers (Opera)
  - Obsolete pcre: Prevent invalid memory accesses with an invalid
    pattern passed to pcre_compile(). Note that the obsolete pcre code
    is scheduled to be removed before the 3.0.33 release. There has been
    a warning since 2008 already.
    Commit 28512e5b624. OVE-20210222-0001.
    Reported by: Joshua Rogers (Opera)

for more details, see the announcement:
https://www.openwall.com/lists/oss-security/2021/02/28/1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e276d14cd846d396fd8e7c4fcc1f2c4c5613ba65)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/privoxy/privoxy.hash | 8 ++++----
 package/privoxy/privoxy.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 00c0f33bdb..92ecd1dd21 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.31%20%28stable%29/
-md5  014cc371d00e84b2db34d0e2b05c77d4  privoxy-3.0.31-stable-src.tar.gz
-sha1  4f0e0c36d55f72f6b33e4c645a9c5d4f40026abd  privoxy-3.0.31-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.32%20%28stable%29/
+md5  3a0a8ebdf80e0a29154683e74cbf510b  privoxy-3.0.32-stable-src.tar.gz
+sha1  3a298ab2599fc92555c86dc29a37742d7396a0d3  privoxy-3.0.32-stable-src.tar.gz
 # Locally computed
-sha256  077729a3aac79222a4e8d88a650d9028d16fd4b0d6038da8f5f5e47120d004eb  privoxy-3.0.31-stable-src.tar.gz
+sha256  c61de4008c62445ec18f1f270407cbf2372eaba93beaccdc9e3238bb2defeed7  privoxy-3.0.32-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 5c1f862bfd..2d9f9e8c78 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 3.0.31
+PRIVOXY_VERSION = 3.0.32
 PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
