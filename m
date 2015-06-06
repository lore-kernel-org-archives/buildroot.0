From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat,  6 Jun 2015 09:15:21 +0200
Subject: [Buildroot] [PATCH 3/3] stunnel: add STUNNEL_VERSION_MAJOR variable
In-Reply-To: <1433574921-30965-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1433574921-30965-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1433574921-30965-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/stunnel/stunnel.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 2d35e75..3f5b9aa 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.17
-STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/5.x
+STUNNEL_VERSION_MAJOR = 5
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).17
+STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
-- 
1.9.1
