From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 20:00:23 +0100
Subject: [Buildroot] [git commit] systemd: add missing dhcp.network file
Message-ID: <20170206190028.7FD5682135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c49d3acdf18d04c4ad8b59923d84d7945e5ebe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This file was missing from commit
84d997d6890f1d045c4d6084148fd9b2d674a6c7 ("system(d): allow auto net
configuration with networkd")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/dhcp.network | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/systemd/dhcp.network b/package/systemd/dhcp.network
new file mode 100644
index 0000000..9b636fa
--- /dev/null
+++ b/package/systemd/dhcp.network
@@ -0,0 +1,4 @@
+[Match]
+Name=SYSTEMD_NETWORKD_DHCP_IFACE
+[Network]
+DHCP=ipv4
