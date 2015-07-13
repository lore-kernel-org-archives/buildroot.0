From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:44:45 +0200
Subject: [Buildroot] [git commit] package/ntp: increase pool server count in
	default config
Message-ID: <20150713164456.258DA80425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d057715d5856b5c0d017db8e55a33424cf97953e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To protect agains 1 falsticker NTP server, the client needs to connect
to at least 4 servers.

Source:
 http://support.ntp.org/bin/view/Support/SelectingOffsiteNTPServers
 5.3.3. Upstream Time Server Quantity

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntpd.etc.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
