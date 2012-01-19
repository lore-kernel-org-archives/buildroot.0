From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 19 Jan 2012 13:22:08 +0100
Subject: [Buildroot] [PATCH v4] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <CA+gTGJGnxMiY9NKWhFsvsKhZT95N2QV_V2-XzDMN7aJMZRo3uA@mail.gmail.com>
References: <CA+gTGJGnxMiY9NKWhFsvsKhZT95N2QV_V2-XzDMN7aJMZRo3uA@mail.gmail.com>
Message-ID: <1326975728-25580-1-git-send-email-arnout@mind.be>
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
-- 
1.7.8.3
