From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:31:42 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] apr: fix size of pid_t
Message-ID: <20170331071606.2D93D826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b9349e3cb8804bf3f1d2de3823f58371e735ab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

pid_t is a signed 32bits integer on both 32bits and 64bits
architectures.
This fixes an issue with apache server which causes bad pid
to be written in PidFile

Signed-off-by: Julien Beraud <julien.beraud@spectracom.orolia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit ee8cbc5fca779ff054a50ed8e6271952367147c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/apr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 361a79f..f09f943 100644
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
