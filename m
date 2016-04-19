From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 Apr 2016 21:15:45 +0300
Subject: [Buildroot] [PATCH 2/3] c-icap: bump to version 0.4.2
In-Reply-To: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
Message-ID: <3280a03616963d1b2a5bfa3120390bcd59bee470.1461089746.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/c-icap/c-icap.hash | 2 +-
 package/c-icap/c-icap.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
index 89c70f423e00..2b083ef659ab 100644
--- a/package/c-icap/c-icap.hash
+++ b/package/c-icap/c-icap.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 46b97fab73dbb9e8def8e34c3f94048c92f50a5341bb85bec4f6f6349aec529a c_icap-0.3.5.tar.gz
+sha256 b138c7d7d9828d54c3307bcfe7b4917911266593832ffc26a60df9a0dfd2511e c_icap-0.4.2.tar.gz
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 40926ea8e5d8..a70993fa4490 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_VERSION = 0.3.5
+C_ICAP_VERSION = 0.4.2
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPLv2.1+
@@ -17,6 +17,7 @@ C_ICAP_CONF_OPTS = \
 	--without-perl \
 	--enable-large-files \
 	--enable-ipv6
+C_ICAP_CONF_ENV = ac_cv_10031b_ipc_sem=yes ac_cv_fcntl=yes
 C_ICAP_MAKE_OPTS = exec_prefix=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-- 
2.8.0.rc3
