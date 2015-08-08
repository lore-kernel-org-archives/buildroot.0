From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:41 -0000
Subject: [Buildroot] [git commit branch/next] package/ntp: increase pool
	server count in default config
Message-ID: <20150808105630.E10BC7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d057715d5856b5c0d017db8e55a33424cf97953e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
