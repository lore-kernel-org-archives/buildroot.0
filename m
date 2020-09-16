From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 17:35:08 +0200
Subject: [Buildroot] [PATCH v3 6/8] package/nss-pam-ldapd: use /run for
 PIDFile
In-Reply-To: <20200916153510.476-1-buildroot@heine.tech>
References: <20200916153340.345-1-buildroot@heine.tech>
 <20200916153510.476-1-buildroot@heine.tech>
Message-ID: <20200916153510.476-6-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/nslcd.pid ? /run/nslcd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/nss-pam-ldapd/nslcd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nss-pam-ldapd/nslcd.service b/package/nss-pam-ldapd/nslcd.service
index 6c0d71b241..5a000a8e4c 100644
--- a/package/nss-pam-ldapd/nslcd.service
+++ b/package/nss-pam-ldapd/nslcd.service
@@ -4,7 +4,7 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/nslcd/nslcd.pid
+PIDFile=/run/nslcd/nslcd.pid
 ExecStart=/usr/sbin/nslcd
 
 [Install]
-- 
2.25.1
