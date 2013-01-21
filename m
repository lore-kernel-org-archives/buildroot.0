From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 08:51:26 -0300
Subject: [Buildroot] [PATCH] busybox: add ntp patch for 1.20.2
Message-ID: <1358769086-4410-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/busybox-1.20.2/busybox-1.20.2-ntpd.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/busybox/busybox-1.20.2/busybox-1.20.2-ntpd.patch

diff --git a/package/busybox/busybox-1.20.2/busybox-1.20.2-ntpd.patch b/package/busybox/busybox-1.20.2/busybox-1.20.2-ntpd.patch
new file mode 100644
index 0000000..17fc0b1
--- /dev/null
+++ b/package/busybox/busybox-1.20.2/busybox-1.20.2-ntpd.patch
@@ -0,0 +1,11 @@
+--- busybox-1.20.2/networking/ntpd.c
++++ busybox-1.20.2-ntpd/networking/ntpd.c
+@@ -1840,7 +1840,7 @@ recv_and_process_client_pkt(void /*int f
+ 
+ 	/* Build a reply packet */
+ 	memset(&msg, 0, sizeof(msg));
+-	msg.m_status = G.stratum < MAXSTRAT ? G.ntp_status : LI_ALARM;
++	msg.m_status = G.stratum < MAXSTRAT ? (G.ntp_status & LI_MASK) : LI_ALARM;
+ 	msg.m_status |= (query_status & VERSION_MASK);
+ 	msg.m_status |= ((query_status & MODE_MASK) == MODE_CLIENT) ?
+ 			 MODE_SERVER : MODE_SYM_PAS;
-- 
1.7.12.4
