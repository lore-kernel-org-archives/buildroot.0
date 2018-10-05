From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 21:54:29 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] strongswan: add upstream
 security patch
Message-ID: <20181005195343.77B508D5EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28a341501dfb9553bbdf177c7ff00457d85712a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes the following security issues:

CVE-2018-16151: The OID parser in the ASN.1 code in gmp allows any number of
random bytes after a valid OID.

CVE-2018-16152: The algorithmIdentifier parser in the ASN.1 code in gmp
doesn't enforce a NULL value for the optional parameter which is not used
with any PKCS#1 algorithm.

For more details, see the advisory:
https://www.strongswan.org/blog/2018/09/24/strongswan-vulnerability-(cve-2018-16151,-cve-2018-16152).html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5e04cdde197f17472a85423f4063b8f6ee19a82c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/strongswan.hash | 1 +
 package/strongswan/strongswan.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 9a800572d7..abbdbc2bf1 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -3,5 +3,6 @@ md5	a6a28eeb22aa58080a7581771a5b63f9	strongswan-5.6.3.tar.bz2
 # Calculated based on the hash above
 sha256	c3c7dc8201f40625bba92ffd32eb602a8909210d8b3fac4d214c737ce079bf24	strongswan-5.6.3.tar.bz2
 # Locally calculated
+sha256	e66c243593ee0713f5fd13bcd7f624bc50eebc54bf87f790ced429ff698077e7  strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256	2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 5c597d572a..9ef4e183e2 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -7,6 +7,8 @@
 STRONGSWAN_VERSION = 5.6.3
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
+STRONGSWAN_PATCH = \
+	$(STRONGSWAN_SITE)/patches/27_gmp_pkcs1_verify_patch/strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
