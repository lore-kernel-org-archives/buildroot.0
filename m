From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Sep 2017 09:47:13 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] strongswan: add upstream
	security patch
Message-ID: <20170918074221.D28E18103E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de22cee0616f21f25b4e2326ea583f04749bf885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-11185: The gmp plugin in strongSwan before 5.6.0 allows
remote attackers to cause a denial of service (NULL pointer dereference and
daemon crash) via a crafted RSA signature.

For more details, see
https://www.strongswan.org/blog/2017/08/14/strongswan-vulnerability-%28cve-2017-11185%29.html

While we're at it, add hashes for the license files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2a59db1bb079dfd7cb40ffff7ac1cd550ff6662e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/strongswan.hash | 3 +++
 package/strongswan/strongswan.mk   | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index cbc4e38..820c712 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -5,3 +5,6 @@ sha256	f8288faaea6a9cd8a7d413c0b76b7922be5da3dfcd01fd05cb30d2c55d3bbe89	strongsw
 # Locally calculated
 sha256	f5ba7f46cf7ae81dd81bc86f9e4cfa0c5c7c6987149b3bc9c0b8bf08598a1063  strongswan-4.4.0-5.5.2_gmp_mpz_powm_sec.patch
 sha256	03db8c7a4133e877e8992e155c046dd27ec4810d50f239abf55595f0280caf31  strongswan-5.0.0-5.5.2_asn1_choice.patch
+sha256	c80e02c9a5eeaf10f0a8bdde3be6375dd2833e515af03dad3a700e93c4fd041a  strongswan-4.4.0-5.5.3_gmp_mpz_export.patch
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256	2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 99862fd..ce837d0 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -9,7 +9,8 @@ STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_PATCH = \
 	$(STRONGSWAN_SITE)/patches/21_gmp_mpz_powm_sec_patch/strongswan-4.4.0-5.5.2_gmp_mpz_powm_sec.patch \
-	$(STRONGSWAN_SITE)/patches/22_asn1_choice_patch/strongswan-5.0.0-5.5.2_asn1_choice.patch
+	$(STRONGSWAN_SITE)/patches/22_asn1_choice_patch/strongswan-5.0.0-5.5.2_asn1_choice.patch \
+	$(STRONGSWAN_SITE)/patches/23_gmp_mpz_export_patch/strongswan-4.4.0-5.5.3_gmp_mpz_export.patch
 STRONGSWAN_LICENSE = GPLv2+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
