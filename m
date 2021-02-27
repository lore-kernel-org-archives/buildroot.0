From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:02:20 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/irqbalance: fix
 systemd startup script (add RuntimeDirectory)
Message-ID: <20210227182007.60C16814CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1697a41e731000b78b2fc8593bd6cfab657fac2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

- add RuntimeDirectory=irqbalance to create /run/irqbalanace needed to
  create socket /run/irqbalance/irqbalance<pid>.sock

Fixes:

  - Bug 13541 [1]

  /usr/sbin/irqbalance[158]: Daemon couldn't be bound to the file-based socket.

[1] https://bugs.busybox.net/show_bug.cgi?id=13541

Reported-by: Alfredo Pons Menargues <alfredo.pons@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 60518c1d7680bff5efe879ee86f48e6092239c03)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irqbalance/irqbalance.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/irqbalance/irqbalance.service b/package/irqbalance/irqbalance.service
index 9ba3be43bb..39574877fb 100644
--- a/package/irqbalance/irqbalance.service
+++ b/package/irqbalance/irqbalance.service
@@ -3,6 +3,7 @@ Description=irqbalance daemon
 After=syslog.target
 
 [Service]
+RuntimeDirectory=irqbalance
 ExecStart=/usr/sbin/irqbalance --foreground
 
 [Install]
