From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Jun 2013 07:49:26 -0300
Subject: [Buildroot] [PATCH 2/2] udpcast: needs host-m4
In-Reply-To: <1370342966-5107-1-git-send-email-gustavo@zacarias.com.ar>
References: <1370342966-5107-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1370342966-5107-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/28b/28bc8651ee798af150bba5997b66ec7bb450ecde/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/udpcast/udpcast.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 54051b9..a6a2b87 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -8,6 +8,7 @@ UDPCAST_VERSION = 20120424
 UDPCAST_SOURCE = udpcast-$(UDPCAST_VERSION).tar.gz
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_CONF_ENV = $(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
+UDPCAST_DEPENDENCIES = host-m4
 
 define UDPCAST_REMOVE_UDP_SENDER
 	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
-- 
1.8.1.5
