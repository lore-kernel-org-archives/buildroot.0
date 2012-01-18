From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 18 Jan 2012 12:31:51 +0100
Subject: [Buildroot] [PATCH v3] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <201201181230.52774.arnout@mind.be>
References: <201201181230.52774.arnout@mind.be>
Message-ID: <1326886311-3155-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

There are some bash features that can not be detected automatically during
configure stage while cross-compiling. This commit forces them on.

Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bash/bash.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index f1f951c..60fab06 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -7,7 +7,11 @@
 BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses
-BASH_CONF_ENV = bash_cv_job_control_missing=no
+BASH_CONF_ENV +=                       \
+   bash_cv_job_control_missing=no      \
+   bash_cv_sys_named_pipes=present     \
+   bash_cv_func_sigsetjmp=present      \
+   bash_cv_printf_a_format=yes
 
 # Make sure we build after busybox so that /bin/sh links to bash
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.8.3
