From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:39:01 +0200
Subject: [Buildroot] [PATCH v2 13/16] package/apr: Fix for Apache when
	listening to multiple ports
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details:
https://issues.apache.org/bugzilla/show_bug.cgi?id=56727#c6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr/apr.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 4b3afc9..cbae0ff 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -22,6 +22,7 @@ APR_CONF_ENV = \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
 	ac_cv_struct_rlimit=yes \
+	ac_cv_o_nonblock_inherited=no \
 	apr_cv_mutex_recursive=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
-- 
1.7.10.4
