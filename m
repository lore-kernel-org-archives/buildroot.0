From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:50:58 +0100
Subject: [Buildroot] [git commit] package/apr: Fix for Apache when listening
	to multiple ports
Message-ID: <20141026215107.B101BB0D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=858145a8514b4bf0a0c345c2b85f64d10a7b6142
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details:
https://issues.apache.org/bugzilla/show_bug.cgi?id=56727#c6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr/apr.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
