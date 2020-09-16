From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 13:45:05 +0200
Subject: [Buildroot] [PATCH v3 5/8] package/minidlna: use /run for PIDFile
In-Reply-To: <20200915215645.2010-1-buildroot@heine.tech>
References: <20200915215645.2010-1-buildroot@heine.tech>
Message-ID: <20200916114508.3575-6-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/minidlna.pid ? /run/minidlna.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/minidlna/minidlnad.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlnad.service b/package/minidlna/minidlnad.service
index f69476b303..4e968d3858 100644
--- a/package/minidlna/minidlnad.service
+++ b/package/minidlna/minidlnad.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 ExecStart=/usr/sbin/minidlnad
-PIDFile=/var/run/minidlna/minidlna.pid
+PIDFile=/run/minidlna/minidlna.pid
 
 [Install]
 WantedBy=multi-user.target
-- 
2.25.1
