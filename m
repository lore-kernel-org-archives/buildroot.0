From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:16:07 +0200
Subject: [Buildroot] [git commit] package/postgresql: remove PIDFile from
 .service
Message-ID: <20200919130827.0D4BF81581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9bc0024b6f79a59537a48e64d71a78b73175561
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit eada187e77022f0d changed the service to Type=notify.
notify units don't need a PIDFile so this can be removed.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
index 53e6f84f00..539eea8964 100644
--- a/package/postgresql/postgresql.service
+++ b/package/postgresql/postgresql.service
@@ -15,7 +15,6 @@ Group=postgres
 StandardOutput=syslog
 StandardError=syslog
 SyslogIdentifier=postgres
-PIDFile=/var/lib/pgsql/postmaster.pid
 
 ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
 ExecStart=/usr/bin/postgres -D /var/lib/pgsql
