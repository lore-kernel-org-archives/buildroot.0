From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:41 +0000
Subject: [Buildroot] [PATCH 32/32] package/systemd: remove unnecessary make
	opts
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-33-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These flags were originally needed to support uClibc in earlier releases.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e361f69..8a0a88d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -283,10 +283,6 @@ else
 SYSTEMD_CONF_OPTS += --disable-hibernate
 endif
 
-# mq_getattr needs -lrt
-SYSTEMD_MAKE_OPTS += LIBS=-lrt
-SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
-
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../lib/systemd/systemd $(TARGET_DIR)/sbin/init
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
-- 
1.9.1
