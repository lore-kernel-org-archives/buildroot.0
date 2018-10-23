From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Oct 2018 18:07:37 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] tinc: security bump to
 version 1.0.35
Message-ID: <20181023160555.DD155835DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1aa66ce3e89203f953c443beb0ff0ce4b53776ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

CVE-2018-16758: Michael Yonli discovered that tinc 1.0.34 and earlier allow
a man-in-the-middle attack that, even if the MITM cannot decrypt the traffic
sent between the two endpoints, when the MITM can correctly predict when an
ephemeral key exchange message is sent in a TCP connection between two
nodes, allows the MITM to force one node to send UDP packets in plaintext.
The tinc 1.1pre versions are not affected by this.

CVE-2018-16738: Michael Yonli discoverd that tinc versions 1.0.30 to 1.0.34
allow an oracle attack, similar to CVE-2018-16737, but due to the
mitigations put in place for the Sweet32 attack in tinc 1.0.30, it now
requires a timing attack that has only a limited time to complete.  Tinc
1.1pre16 and earlier are also affected if there are nodes on the same VPN
that still use the legacy protocol from tinc version 1.0.x.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0758184c03f6bb7928cb957faa649be68a145c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinc/tinc.hash | 2 +-
 package/tinc/tinc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 09d2867b16..0daeb324e9 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  c03a9b61dedd452116dd9a8db231545ba08a7c96bce011e0cbd3cfd2c56dcfda tinc-1.0.34.tar.gz
+sha256  18c83b147cc3e2133a7ac2543eeb014d52070de01c7474287d3ccecc9b16895e tinc-1.0.35.tar.gz
 sha256  3a112fd37b47d624e89b130d0e158bb8d14ec5bc9ecf5f18b448d2c07626e43d COPYING
 sha256  9bf76a8aa304d807df20bf3d221c21d259764be63e39b58f299b80ba3ac14b5b COPYING.README
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index 85dccdc34e..ae7ce97bfa 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.34
+TINC_VERSION = 1.0.35
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPL-2.0+ with OpenSSL exception
