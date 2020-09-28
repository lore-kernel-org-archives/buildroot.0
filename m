From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 22:48:05 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/nss-pam-ldapd:
 use /run for PIDFile
Message-ID: <20200928211214.465B68D4B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=166096223200df95200a818e476862d54576a7c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/nslcd.pid ??? /run/nslcd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce3d5129a6e0a6c53192e4aeea5a60883d92c5fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
