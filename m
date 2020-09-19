From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:15:34 +0200
Subject: [Buildroot] [git commit] package/htpdate: use /run for PIDFile
Message-ID: <20200919130826.D145B81581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e85145d97ea264018eb6b1e11ae78b1df18538a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- rename pidfile from htpdate to htpdate.pid

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/htpdate.pid ??? /run/htpdate.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htpdate/htpdate.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
index 0c77550813..b7f1371b08 100644
--- a/package/htpdate/htpdate.service
+++ b/package/htpdate/htpdate.service
@@ -4,10 +4,10 @@ After=network.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/htpdate
+PIDFile=/run/htpdate.pid
 Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
 EnvironmentFile=-/etc/default/htpdate
-ExecStart=/usr/bin/htpdate -D -i /var/run/htpdate $HTPDATE_ARGS
+ExecStart=/usr/bin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
 
 [Install]
 WantedBy=multi-user.target
