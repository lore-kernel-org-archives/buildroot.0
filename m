From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:13:47 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/ngircd: security
 bump to version 26
Message-ID: <20200722085616.DB26F88122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed9bfa509ccabbb2381c585a0a3febd3533eff43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Fix CVE-2020-14148: The Server-Server protocol implementation in
  ngIRCd before 26~rc2 allows an out-of-bounds access, as demonstrated
  by the IRC_NJOIN() function.
- Fix a static build failure with openssl thanks to
  https://github.com/ngircd/ngircd/commit/ad86a41eeed9f85d74bb50a25fa0bf4515aaf3af
- Update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/078a7afc432786316a1d2ea03f96444ff741b942

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 53f92e65edf10831a65d8ad4f6403552b564c06d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/ngircd.hash | 4 ++--
 package/ngircd/ngircd.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ngircd/ngircd.hash b/package/ngircd/ngircd.hash
index 3772bd6c16..72874c8d49 100644
--- a/package/ngircd/ngircd.hash
+++ b/package/ngircd/ngircd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 c4997cae3e3dd6ff6a605ca274268f2b8c9ba0b1a96792c7402e5594222eee4e  ngircd-25.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  56dcc6483058699fcdd8e54f5010eecee09824b93bad7ed5f18818e550d855c6  ngircd-26.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 5fa86afdd5..4859a29c2f 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGIRCD_VERSION = 25
+NGIRCD_VERSION = 26
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
@@ -18,8 +18,8 @@ NGIRCD_CONF_OPTS += --without-pam
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
-NGIRCD_DEPENDENCIES += openssl
+NGIRCD_CONF_OPTS += --with-openssl
+NGIRCD_DEPENDENCIES += host-pkgconf openssl
 else
 NGIRCD_CONF_OPTS += --without-openssl
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
