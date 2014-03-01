From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  1 Mar 2014 14:54:26 -0300
Subject: [Buildroot] [PATCH] bash: always prefix readline
Message-ID: <1393696466-11902-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Always prefix the readline directory otherwise autodetection may pick up
the host readline when headers are available and target == host (or are
link-compatible). Fixes:
http://autobuild.buildroot.org/results/44a/44a962623be757143a3d6d37fc6cd14964094f79/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bash/bash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 401f1f2..6c7691f 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -12,6 +12,7 @@ BASH_LICENSE = GPLv3+
 BASH_LICENSE_FILES = COPYING
 
 BASH_CONF_ENV += \
+	ac_cv_rl_prefix="$(STAGING_DIR)" \
 	ac_cv_rl_version="$(READLINE_VERSION)" \
 	bash_cv_job_control_missing=present \
 	bash_cv_sys_named_pipes=present \
-- 
1.8.3.2
