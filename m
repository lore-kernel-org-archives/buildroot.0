From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Dec 2011 12:25:58 -0300
Subject: [Buildroot] [PATCH 3/5] faad2: fix broken build with binutils 2.22+
In-Reply-To: <1323617160-4360-1-git-send-email-gustavo@zacarias.com.ar>
References: <1323617160-4360-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1323617160-4360-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/faad2/faad2.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/faad2/faad2.mk b/package/multimedia/faad2/faad2.mk
index 366515c..2913272 100644
--- a/package/multimedia/faad2/faad2.mk
+++ b/package/multimedia/faad2/faad2.mk
@@ -7,5 +7,8 @@
 FAAD2_VERSION = 2.7
 FAAD2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/faac
 FAAD2_INSTALL_STAGING = YES
+# Fix for binutils 2.22+ new default --no-copy-dt-needed
+# Requires libm
+FAAD2_CONF_ENV = LIBS="-lm"
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
