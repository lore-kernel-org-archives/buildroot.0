From: Julien Beraud <julien.beraud@spectracom.orolia.com>
Date: Tue, 21 Mar 2017 14:23:56 +0100
Subject: [Buildroot] [PATCH 1/1] apr: fix size of pid_t
Message-ID: <20170321132356.16093-1-julien.beraud@spectracom.orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pid_t is a signed 32bits integer on both 32bits and 64bits
architectures.
This fixes an issue with apache server which causes bad pid
to be written in PidFile

Signed-off-by: Julien Beraud <julien.beraud@spectracom.orolia.com>
---
 package/apr/apr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 361a79f99..f09f94368 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -22,6 +22,7 @@ APR_CONF_ENV = \
 	apr_cv_mutex_robust_shared=no \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
+	ac_cv_sizeof_pid_t=4 \
 	ac_cv_struct_rlimit=yes \
 	ac_cv_o_nonblock_inherited=no \
 	apr_cv_mutex_recursive=yes
-- 
2.11.0
