From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 13:45:02 +0200
Subject: [Buildroot] [PATCH v3 2/8] package/bandwithd: use /run for PIDFile
In-Reply-To: <20200915215645.2010-1-buildroot@heine.tech>
References: <20200915215645.2010-1-buildroot@heine.tech>
Message-ID: <20200916114508.3575-3-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/bandwithd.pid ? /run/bandwithd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/bandwidthd/bandwidthd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bandwidthd/bandwidthd.service b/package/bandwidthd/bandwidthd.service
index 9c03d42946..ab7f05a2e8 100644
--- a/package/bandwidthd/bandwidthd.service
+++ b/package/bandwidthd/bandwidthd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 ExecStart=/usr/bin/bandwidthd
-PIDFile=/var/run/bandwidthd.pid
+PIDFile=/run/bandwidthd.pid
 
 [Install]
 WantedBy=multi-user.target
-- 
2.25.1
