From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Dec 2014 11:27:00 -0300
Subject: [Buildroot] [PATCH 2/3] ntp: update sample config
In-Reply-To: <1419258421-18318-1-git-send-email-gustavo@zacarias.com.ar>
References: <1419258421-18318-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1419258421-18318-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop redundant IP version and double default restrict.
Tweak KoD and other defaults for properness.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntp/ntpd.etc.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntpd.etc.conf b/package/ntp/ntpd.etc.conf
index 6a2b88c..543c8ff 100644
--- a/package/ntp/ntpd.etc.conf
+++ b/package/ntp/ntpd.etc.conf
@@ -1,8 +1,8 @@
 server 0.pool.ntp.org iburst
 server 1.pool.ntp.org iburst
 
-restrict default kod nomodify notrap nopeer noquery
-restrict -6 default kod nomodify notrap nopeer noquery
-
+# Allow only time queries, at a limited rate, sending KoD when in excess.
+# Allow all local queries (IPv4, IPv6)
+restrict default nomodify nopeer noquery limited kod
 restrict 127.0.0.1
-restrict -6 ::1
+restrict [::1]
-- 
2.0.4
