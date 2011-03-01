From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2011 13:18:11 -0300
Subject: [Buildroot] [PATCH 3/3] dnsmasq: bump to version 2.57
In-Reply-To: <1298996291-676-1-git-send-email-gustavo@zacarias.com.ar>
References: <1298996291-676-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1298996291-676-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/dnsmasq.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 976e1d6..d8f4d77 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.55
+DNSMASQ_VERSION = 2.57
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
@@ -25,7 +25,7 @@ endif
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 	DNSMASQ_MAKE_OPT += all-i18n
 	DNSMASQ_DEPENDENCIES += libidn libintl
-	DNSMASQ_MAKE_ENV += LDFLAGS+="-lintl"
+	DNSMASQ_MAKE_ENV += LDFLAGS+="-lintl -lidn"
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-- 
1.7.3.4
