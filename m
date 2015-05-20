From: Gergely Imreh <imrehg@gmail.com>
Date: Wed, 20 May 2015 03:44:17 +0000
Subject: [Buildroot] [PATCH 1/1] package/ntp: increase pool server count in
	default config
Message-ID: <1432093452-18281-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To protect agains 1 falsticker NTP server, the client needs to connect
to at least 4 servers.

Source:
 http://support.ntp.org/bin/view/Support/SelectingOffsiteNTPServers
 5.3.3. Upstream Time Server Quantity

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
---
 package/ntp/ntpd.etc.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ntp/ntpd.etc.conf b/package/ntp/ntpd.etc.conf
index 543c8ff..c451aa9 100644
--- a/package/ntp/ntpd.etc.conf
+++ b/package/ntp/ntpd.etc.conf
@@ -1,5 +1,7 @@
 server 0.pool.ntp.org iburst
 server 1.pool.ntp.org iburst
+server 2.pool.ntp.org iburst
+server 3.pool.ntp.org iburst
 
 # Allow only time queries, at a limited rate, sending KoD when in excess.
 # Allow all local queries (IPv4, IPv6)
-- 
2.1.4
