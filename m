From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Jun 2018 22:14:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: enable mod_timerfd
Message-ID: <20180618201400.26287-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mod_timerfd uses the Linux kernel timerfd API to create and use a kernel
timer that delivers timer expire notifications via a file descriptor,
for details read

https://freeswitch.org/confluence/display/FREESWITCH/mod_timerfd
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 4d490b0730..7f2a067a35 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -150,6 +150,7 @@ FREESWITCH_ENABLED_MODULES += \
 	say/mod_say_sv \
 	say/mod_say_th \
 	say/mod_say_zh \
+	timers/mod_timerfd \
 	xml_int/mod_xml_cdr \
 	xml_int/mod_xml_rpc \
 	xml_int/mod_xml_scgi
-- 
2.17.1
