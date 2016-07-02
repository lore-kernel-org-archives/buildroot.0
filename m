From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:04:34 +0200
Subject: [Buildroot] [git commit] package/systemd: remove unnecessary make
	opts
Message-ID: <20160702110928.4F43981D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f52f09c7f10b2fcf49d08aa94c179aa6f6303c1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These flags were originally needed to support uClibc in earlier releases.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
