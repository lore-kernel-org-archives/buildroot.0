From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Tue, 21 Jan 2020 11:42:12 +0100
Subject: [Buildroot] [PATCH] package/fail2ban: add conditional
 python-systemd dependancy
Message-ID: <20200121104212.5621-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fail2ban needs python-systemd for it's systemd backend to
be able to read logs from systemd/journald

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/fail2ban/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index 8fa63bf..f05adbb 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SYSTEMD if BR2_PACKAGE_SYSTEMD
 	help
 	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
 	  bans IPs that show the malicious signs -- too many password
-- 
2.7.4
