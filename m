From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:42 +0200
Subject: [Buildroot] [PATCH v2 02/14] package/systemd: remove unused user
 accounts
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since V235 the "gateway" and "upload" services use DynamicUsers,
requiring no entries in /etc/passwd.
This functionality requires nss-systemd, which is always
enabled in buildroot.

The "bus-proxy" user was removed in V230.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/systemd/systemd.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cf6c0f9576..8e82d8afa7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -502,10 +502,7 @@ define SYSTEMD_USERS
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
2.27.0
