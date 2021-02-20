From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 18:36:28 +0100
Subject: [Buildroot] [git commit] package/irqbalance: fix systemd startup
 script (add RuntimeDirectory)
Message-ID: <20210220171505.36A2F815D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60518c1d7680bff5efe879ee86f48e6092239c03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add RuntimeDirectory=irqbalance to create /run/irqbalanace needed to
  create socket /run/irqbalance/irqbalance<pid>.sock

Fixes:

  - Bug 13541 [1]

  /usr/sbin/irqbalance[158]: Daemon couldn't be bound to the file-based socket.

[1] https://bugs.busybox.net/show_bug.cgi?id=13541

Reported-by: Alfredo Pons Menargues <alfredo.pons@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
