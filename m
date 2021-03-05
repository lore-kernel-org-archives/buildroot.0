From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 10:11:01 +0100
Subject: [Buildroot] [PATCH 1/2] package/asterisk: remove default -O3
 optimization flag
In-Reply-To: <20210305091102.2420944-1-giulio.benetti@benettiengineering.com>
References: <20210305091102.2420944-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210305091102.2420944-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually asterisk package gets built with -O3 cflag since it's defaulted
into its sources, but it's not what we want, so let's empty its OPTIMIZE
Makefile variable letting Buildroot CFLAGS to take place instead.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/asterisk/asterisk.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index b220b54189..f6a4f8f787 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -280,6 +280,9 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 ASTERISK_MAKE_OPTS += ASTLDFLAGS="-latomic"
 endif
 
+# Remove default -O3 optimization flag
+ASTERISK_MAKE_OPTS += OPTIMIZE=""
+
 # We want to install sample configuration files, too.
 ASTERISK_INSTALL_TARGET_OPTS = \
 	$(ASTERISK_DIRS) \
-- 
2.25.1
