From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 15:45:16 +0200
Subject: [Buildroot] [PATCH 6/8] package/apr: Fix for Apache when listening
	to multiple ports
In-Reply-To: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412516718-12597-6-git-send-email-bernd.kuhls@t-online.de>
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
index 82b1ad2..7eda611 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -20,6 +20,7 @@ APR_CONF_ENV = \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
 	ac_cv_struct_rlimit=yes \
+	ac_cv_o_nonblock_inherited=no \
 	apr_cv_mutex_recursive=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
-- 
1.7.10.4
