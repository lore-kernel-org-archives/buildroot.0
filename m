From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:18 +0100
Subject: [Buildroot] [PATCH 14/14] package/jack2: add optional support for
	readline
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When readline was compiled before, jack2 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/jack_transport | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libjack.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libopus.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libreadline.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jack2/jack2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index e018861..81508da 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+JACK2_DEPENDENCIES += readline
+endif
+
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
-- 
2.7.0
