From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Jan 2012 09:06:00 +0100
Subject: [Buildroot] [git commit] bash: Adding features that can not be
	automatically detected while cross-compiling
Message-ID: <20120120081939.D078C902FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b367ca32e53a774c174899e44c77ed1d128cbcdc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are some bash features that can not be detected automatically during
configure stage while cross-compiling. This commit forces them on.

Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bash/bash.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index f1f951c..44f9337 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -7,7 +7,11 @@
 BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses
-BASH_CONF_ENV = bash_cv_job_control_missing=no
+BASH_CONF_ENV +=                       \
+   bash_cv_job_control_missing=present \
+   bash_cv_sys_named_pipes=present     \
+   bash_cv_func_sigsetjmp=present      \
+   bash_cv_printf_a_format=yes
 
 # Make sure we build after busybox so that /bin/sh links to bash
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
