From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2016 16:43:10 -0300
Subject: [Buildroot] [PATCH] busybox: use md5 as default password algorithm
Message-ID: <1457638990-27544-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DES is terribly outdated and a security vulnerability.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
