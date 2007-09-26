From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 02:09:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070926090958.596C1A6884@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 02:09:55 -0700 (Wed, 26 Sep 2007)
New Revision: 20033

Log:
Ensure soft-fp patch is truly local

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-soft-fp.patch


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-soft-fp.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-soft-fp.patch	2007-09-26 06:32:42 UTC (rev 20032)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-soft-fp.patch	2007-09-26 09:09:55 UTC (rev 20033)
@@ -4388,7 +4388,7 @@
 +
 +# SOFT_FLOAT functions
 +ifeq ($(UCLIBC_HAS_SOFT_FLOAT),y)
-+CSRC := \
++SOFT_FP_SRC := \
 +	adddf3.c addsf3.c addtf3.c \
 +	divdf3.c divsf3.c divtf3.c \
 +	eqdf2.c eqsf2.c eqtf2.c \
@@ -4410,8 +4410,8 @@
 +SOFT_FP_DIR := $(top_srcdir)libc/soft-fp
 +SOFT_FP_OUT := $(top_builddir)libc/soft-fp
 +
-+SOFT_FP_SRC := $(patsubst %.c,$(SOFT_FP_DIR)/%.c,$(CSRC))
-+SOFT_FP_OBJ := $(patsubst %.c,$(SOFT_FP_OUT)/%.o,$(CSRC))
++SOFT_FP_SRC := $(patsubst %.c,$(SOFT_FP_DIR)/%.c,$(SOFT_FP_SRC))
++SOFT_FP_OBJ := $(patsubst %.c,$(SOFT_FP_OUT)/%.o,$(SOFT_FP_SRC))
 +
 +libc-y += $(SOFT_FP_OBJ)
 +
