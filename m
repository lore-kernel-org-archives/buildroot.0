From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 11:41:55 +0200
Subject: [Buildroot] [git commit] package/systemd: remove unused user
 accounts
Message-ID: <20200615094047.43A638227E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b82ee4dbb6280402d836aee2177e035c55b7b839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since V235 the "gateway" and "upload" services use DynamicUsers,
requiring no entries in /etc/passwd.
This functionality requires nss-systemd, which is always
enabled in buildroot.

The "bus-proxy" user was removed in V230.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e61cec80f0..141209897d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -486,10 +486,7 @@ define SYSTEMD_USERS
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
