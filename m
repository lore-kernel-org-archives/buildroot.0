From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 14:26:37 +0100
Subject: [Buildroot] [git commit] busybox: add ntp patch for 1.20.2
Message-ID: <20130121132644.0B82E9A668@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7ac4d3987408e5b96bc01ce4e728a6ced383257
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.20.2/busybox-1.20.2-ntpd.patch       |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

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
