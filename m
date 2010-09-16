From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libpcap: remove useless
	stripping
Message-ID: <20100916113832.A916D8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6cf3ec38b886f82df5576ce1146931e9eafcb154
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpcap/libpcap.mk |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 801b15e..b14a6f7 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -19,10 +19,3 @@ LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(
 LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
 
 $(eval $(call AUTOTARGETS,package,libpcap))
-
-$(LIBPCAP_HOOK_POST_INSTALL): $(LIBPCAP_TARGET_INSTALL_TARGET)
-ifeq ($(BR2_PREFER_STATIC_LIB),)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(wildcard $(TARGET_DIR)/usr/lib/libpcap.so*)
-endif
-	touch $@
-
-- 
1.7.1
