From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 20:39:35 +0100
Subject: [Buildroot] [git commit] bash: always prefix readline
Message-ID: <20140301194456.1E7409936B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a95111e48f5fe387f592463effa233834c6fda1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Always prefix the readline directory otherwise autodetection may pick up
the host readline when headers are available and target == host (or are
link-compatible). Fixes:
http://autobuild.buildroot.org/results/44a/44a962623be757143a3d6d37fc6cd14964094f79/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bash/bash.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
