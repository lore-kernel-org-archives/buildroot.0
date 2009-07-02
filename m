From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Jul 2009 14:58:39 +0200
Subject: [Buildroot] [git commit] openvpn: prefix variables with OPENVPN_
Message-ID: <20090702130017.CEE2A770F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b98de697b071940258db1dcb00506c15d68a0b97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openvpn/openvpn.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 49584f8..56dc03d 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -9,14 +9,14 @@ OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.gz
 OPENVPN_SITE = http://openvpn.net/release
 OPENVPN_DEPENDENCIES = lzo openssl uclibc
 
+OPENVPN_CONF_OPT = --enable-small
+
 ifeq ($(BR2_PTHREADS_NATIVE),y)
-	THREAD_MODEL="--enable-threads=posix"
+	OPENVPN_CONF_OPT += --enable-threads=posix
 else
-	THREAD_MODEL="--enable-pthread"
+	OPENVPN_CONF_OPT += --enable-pthread
 endif
 
-OPENVPN_CONF_OPT = --enable-small $(THREAD_MODEL)
-
 $(eval $(call AUTOTARGETS,package,openvpn))
 
 $(OPENVPN_TARGET_INSTALL_TARGET):
-- 
1.6.3.3
