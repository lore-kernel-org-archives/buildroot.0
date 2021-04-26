From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:36:04 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/nettle: security
 bump to version 3.7.2
Message-ID: <20210426125912.3CC6A817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f8243c2a2c8ec4dae420834e37124fd6ebedf71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-20305: A flaw was found in Nettle in versions before 3.7.2,
where several Nettle signature verification functions (GOST DSA, EDDSA &
ECDSA) result in the Elliptic Curve Cryptography point (ECC) multiply
function being called with out-of-range scalers, possibly resulting in
incorrect results. This flaw allows an attacker to force an invalid
signature, causing an assertion failure or possible validation. The
highest threat to this vulnerability is to confidentiality, integrity,
as well as system availability.

https://git.lysator.liu.se/nettle/nettle/-/blob/nettle_3.7.2_release_20210321/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ed653df5731eb4d0273fc23842d8fbaebcb5b893)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 5fd69200bf..09652dcc8b 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.7.1.tar.gz.sig
-sha256  156621427c7b00a75ff9b34b770b95d34f80ef7a55c3407de94b16cbf436c42e  nettle-3.7.1.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.7.2.tar.gz.sig
+sha256  8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e78b3352e0ef162  nettle-3.7.2.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index dc76fc21ff..bf833eb27e 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.7.1
+NETTLE_VERSION = 3.7.2
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
