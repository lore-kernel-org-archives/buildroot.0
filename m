From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:18 +0200
Subject: [Buildroot] [PATCH 18/31] package/systemd: remove unnecessary make
	opts
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-18-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

These flags were originally needed to support uClibc in earlier releases.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e463c8e..eefd980 100644
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
2.8.1
