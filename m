From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 21:54:38 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] strongswan: add upstream
 security fix for CVE-2018-17540
Message-ID: <20181005195343.832978D5EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a92358e624a472f153a8d49ac21d25b4a2609387
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

The fix for CVE-2018-16151 / 16152 contained an exploitable bug.
For details, see:

https://www.strongswan.org/blog/2018/10/01/strongswan-vulnerability-(cve-2018-17540).html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 040cf15a8760c91f82b61a3e2cadf1b91b7c45af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/strongswan.hash | 1 +
 package/strongswan/strongswan.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index abbdbc2bf1..4d1a593a5c 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -4,5 +4,6 @@ md5	a6a28eeb22aa58080a7581771a5b63f9	strongswan-5.6.3.tar.bz2
 sha256	c3c7dc8201f40625bba92ffd32eb602a8909210d8b3fac4d214c737ce079bf24	strongswan-5.6.3.tar.bz2
 # Locally calculated
 sha256	e66c243593ee0713f5fd13bcd7f624bc50eebc54bf87f790ced429ff698077e7  strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch
+sha256	415d104717cb0781770e9077d00b3df310b11e65e4b9c1d35b62fbba04549263  strongswan-4.4.0-5.7.0_gmp-pkcs1-overflow.patch
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256	2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 9ef4e183e2..30693de7cb 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -8,7 +8,8 @@ STRONGSWAN_VERSION = 5.6.3
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_PATCH = \
-	$(STRONGSWAN_SITE)/patches/27_gmp_pkcs1_verify_patch/strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch
+	$(STRONGSWAN_SITE)/patches/27_gmp_pkcs1_verify_patch/strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch \
+	$(STRONGSWAN_SITE)/patches/28_gmp_pkcs1_overflow_patch/strongswan-4.4.0-5.7.0_gmp-pkcs1-overflow.patch
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
