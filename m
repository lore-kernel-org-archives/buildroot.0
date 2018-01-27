From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 19:12:27 +0100
Subject: [Buildroot] [git commit] package/tinc: upgrade to 1.0.33,
 install upstream's systemd files
Message-ID: <20180127181335.99F36817CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f6db0d50449f26a0280f9ea9316a041729f5b22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinc/tinc.hash | 4 +++-
 package/tinc/tinc.mk   | 7 ++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 135a4f3..b0cdde8 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	abc17e25afc1b9e74423c78fef586b11d503cbbbe5e4a2ed323870f4a82faa73 tinc-1.0.30.tar.gz
+sha256	7f6f5dc6444bc651ac635c81f4745bcce581bbd1d45ed60cbdc4ee11bebb10f4 tinc-1.0.33.tar.gz
+sha256  10618781fe68ee0958d627f9f4b279b55eaff6c852f7742bbef64dc470c0077c COPYING
+sha256  9bf76a8aa304d807df20bf3d221c21d259764be63e39b58f299b80ba3ac14b5b COPYING.README
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index f537d46..0027853 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.30
+TINC_VERSION = 1.0.33
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPL-2.0+ with OpenSSL exception
@@ -17,4 +17,9 @@ TINC_CONF_ENV += \
 	ax_cv_check_ldflags___pie=no
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+TINC_DEPENDENCIES += systemd
+TINC_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+endif
+
 $(eval $(autotools-package))
