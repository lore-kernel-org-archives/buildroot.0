From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:26 +0100
Subject: [Buildroot] [PATCH 03/10] package/systemd: remove unused user
 accounts
In-Reply-To: <20200206093633.251413-1-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
Message-ID: <20200206093633.251413-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since V235 the "gateway" and "upload" services use DynamicUsers,
requiring no entries in /etc/passwd.
This functionality requires option nss-systemd, which is always
enabled in buildroot.

The "bus-proxy" user was removed in V230

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a390cdd1a9..b46c4fd540 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -431,10 +431,7 @@ define SYSTEMD_USERS
 	- - systemd-journal -1 * - - - Journal
 	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
-	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
-	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
 	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
-	systemd-journal-upload -1 systemd-journal-upload -1 * - - - Journal Upload
 	$(SYSTEMD_COREDUMP_USER)
 	$(SYSTEMD_NETWORKD_USER)
 	$(SYSTEMD_RESOLVED_USER)
-- 
2.24.1
