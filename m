From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 12:09:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20081006190915.298B13C7B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 12:09:14 -0700 (Mon, 06 Oct 2008)
New Revision: 23603

Log:
bash.mk:
-Force some autoconf options so that job control
 is turned on.
 (Otherwise these checks fail when cross compiling.
  And when job control is disabled, bash can't be
  the default shell)


Modified:
   trunk/buildroot/package/bash/bash.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2008-10-06 18:52:02 UTC (rev 23602)
+++ trunk/buildroot/package/bash/bash.mk	2008-10-06 19:09:14 UTC (rev 23603)
@@ -36,6 +36,16 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		CCFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		ac_cv_func_setvbuf_reversed=no \
+		ac_cv_have_decl_sys_siglist=yes \
+		bash_cv_job_control_missing=present \
+		bash_cv_sys_named_pipes=present \
+		bash_cv_unusable_rtsigs=no \
+		bash_cv_func_ctype_nonascii=yes \
+		bash_cv_decl_under_sys_siglist=yes \
+		bash_cv_ulimit_maxfds=yes \
+		bash_cv_getcwd_malloc=yes \
+		bash_cv_func_sigsetjmp=present \
+		bash_cv_printf_a_format=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
