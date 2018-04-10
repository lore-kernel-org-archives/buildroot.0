From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 23:19:38 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] busybox: disable new TLS
 support
Message-ID: <20180410212751.C99A3883A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d821b79c4688dfd141a94a1595f5504eabcbdc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Busybox 1.17.1 has added built-in TLS support. Unfortunately, it fails
to build on i686 with gcc 4.8, with:

networking/tls_pstm_mul_comba.c: In function 'pstm_mul_comba':
networking/tls_pstm_mul_comba.c:82:1: error: 'asm' operand has impossible constraints
 asm(                                                      \
 ^
networking/tls_pstm_mul_comba.c:279:4: note: in expansion of macro 'MULADD'
    MULADD(*tmpx++, *tmpy--);
    ^
make[3]: *** [networking/tls_pstm_mul_comba.o] Error 1
make[2]: *** [networking] Error 2

Since TLS support is a new feature in 1.27, and wasn't present until
now, let's disable it to avoid the build failure.

The bug has been reported upstream at
http://lists.busybox.net/pipermail/busybox/2017-July/085713.html.

Fixes:

 http://autobuild.buildroot.net/results/d973f9a2fbf0f52104f4943b902183e9dbf163a7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d5507262f37506d6b1b48eb409ed8bc3f08d3e47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox-minimal.config | 8 ++++----
 package/busybox/busybox.config         | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 5aadb22403..4130e6a8b6 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Busybox version: 1.27.1
-# Fri Jul 28 12:11:02 2017
+# Sun Jul 30 15:42:11 2017
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -888,7 +888,7 @@ CONFIG_PING=y
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
-CONFIG_SSL_CLIENT=y
+# CONFIG_SSL_CLIENT is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
@@ -905,7 +905,7 @@ CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
 # CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
-CONFIG_TLS=y
+# CONFIG_TLS is not set
 # CONFIG_TRACEROUTE is not set
 # CONFIG_TRACEROUTE6 is not set
 # CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
@@ -918,7 +918,7 @@ CONFIG_WGET=y
 # CONFIG_FEATURE_WGET_STATUSBAR is not set
 # CONFIG_FEATURE_WGET_AUTHENTICATION is not set
 # CONFIG_FEATURE_WGET_TIMEOUT is not set
-CONFIG_FEATURE_WGET_HTTPS=y
+# CONFIG_FEATURE_WGET_HTTPS is not set
 # CONFIG_FEATURE_WGET_OPENSSL is not set
 # CONFIG_WHOIS is not set
 # CONFIG_ZCIP is not set
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 62b00e9811..7753a861fd 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Busybox version: 1.27.1
-# Fri Jul 28 12:12:37 2017
+# Sun Jul 30 15:27:03 2017
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -896,7 +896,7 @@ CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
-CONFIG_SSL_CLIENT=y
+# CONFIG_SSL_CLIENT is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
@@ -917,7 +917,7 @@ CONFIG_FEATURE_TFTP_PUT=y
 CONFIG_FEATURE_TFTP_BLOCKSIZE=y
 # CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
-CONFIG_TLS=y
+# CONFIG_TLS is not set
 CONFIG_TRACEROUTE=y
 # CONFIG_TRACEROUTE6 is not set
 # CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
@@ -930,7 +930,7 @@ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
 CONFIG_FEATURE_WGET_STATUSBAR=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
 CONFIG_FEATURE_WGET_TIMEOUT=y
-CONFIG_FEATURE_WGET_HTTPS=y
+# CONFIG_FEATURE_WGET_HTTPS is not set
 # CONFIG_FEATURE_WGET_OPENSSL is not set
 # CONFIG_WHOIS is not set
 # CONFIG_ZCIP is not set
