From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 25 Oct 2015 02:59:28 +0200
Subject: [Buildroot] [PATCH v3 02/13] package/dhcp: systemd: rename
	environment file
In-Reply-To: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <1445734779-7212-2-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the same EnvironmentFile name as the SysV init script for
consistency. The filenames under /etc/default/ are usually just the
package/daemon/service/feature name without any extension, so remove the
".conf" extension from EnvironmentFile.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>

---
Changes v2 -> v3: new patch.
---
 package/dhcp/dhcpd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
index 7b265cb..5989506 100644
--- a/package/dhcp/dhcpd.service
+++ b/package/dhcp/dhcpd.service
@@ -7,7 +7,7 @@ Type=forking
 PIDFile=/run/dhcpd.pid
 ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
 KillSignal=SIGINT
-EnvironmentFile=/etc/default/dhcpd.conf
+EnvironmentFile=/etc/default/dhcpd
 
 [Install]
 WantedBy=multi-user.target
-- 
2.1.4
