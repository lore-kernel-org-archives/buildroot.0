From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 17:21:07 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 5.16
Message-ID: <20150423152403.CDB4E81D8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e784debcb8074f394b69469604888d2a9158c73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stunnel/stunnel.hash |    4 ++--
 package/stunnel/stunnel.mk   |    4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 7f28905..8545341 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-announce/2015-January/000090.html
-sha256	87b34a74061861d1edd2ab238c73eb989b3d0a17e44574b7b6ead1a16aae38c8	stunnel-5.09.tar.gz
+# From https://www.stunnel.org/pipermail/stunnel-announce/2015-April/000098.html
+sha256	b6b7e93fb2626eaabae1c8474e1dfa23962cfde8fa35c8602289fcaa4f53608d	stunnel-5.16.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index f7099e8..7a6bb46 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.09
+STUNNEL_VERSION = 5.16
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
+STUNNEL_CONF_ENV = \
+	ax_cv_check_cflags___fstack_protector=$(if $(BR2_ENABLE_SSP),yes,no)
 STUNNEL_LICENSE = GPLv2+
 STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
 
