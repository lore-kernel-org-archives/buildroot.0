From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 17:35:10 +0200
Subject: [Buildroot] [PATCH v3 8/8] package/postgresql: remove PIDFile from
 .service
In-Reply-To: <20200916153510.476-1-buildroot@heine.tech>
References: <20200916153340.345-1-buildroot@heine.tech>
 <20200916153510.476-1-buildroot@heine.tech>
Message-ID: <20200916153510.476-8-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit eada187e77022f0d changed the service to Type=notify.
notify units don't need a PIDFile so this can be removed.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
-- 
2.25.1
