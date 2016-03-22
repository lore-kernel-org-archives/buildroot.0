From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Mar 2016 00:01:35 +0100
Subject: [Buildroot] [git commit] busybox: use md5 as default password
	algorithm
Message-ID: <20160322230142.901A981831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1de77a59fb0cb6a3c5d25cf4a825fbc0c7acdce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DES is terribly outdated and a security vulnerability.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 2cf989d..693b9d2 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -496,7 +496,7 @@ CONFIG_PASSWD=y
 CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
 # CONFIG_CRYPTPW is not set
 # CONFIG_CHPASSWD is not set
-CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="des"
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="md5"
 CONFIG_SU=y
 CONFIG_FEATURE_SU_SYSLOG=y
 CONFIG_FEATURE_SU_CHECKS_SHELLS=y
