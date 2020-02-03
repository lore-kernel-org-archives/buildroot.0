From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 18:24:27 +0100
Subject: [Buildroot] [git commit] package/fail2ban: add conditional
 python-systemd dependancy
Message-ID: <20200203171426.B96CE88DCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6e0aaa5441275675ea953b5d980ca7d6df918e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fail2ban needs python-systemd for its systemd backend to
be able to read logs from systemd/journald

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fail2ban/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index 39e996fdb6..86e6233793 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SYSTEMD if BR2_PACKAGE_SYSTEMD
 	help
 	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
 	  bans IPs that show the malicious signs -- too many password
