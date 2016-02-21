From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:45:25 +0100
Subject: [Buildroot] [git commit] package/jack2: add optional support for
	readline
Message-ID: <20160221114650.04C3E8042F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f658b1934f91e8c416fd7519c9f7e3ab86dca076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
