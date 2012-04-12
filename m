From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Apr 2012 11:14:40 -0300
Subject: [Buildroot] [PATCH] toolchain/uClibc: fix default configs with
	respect to bug #5018
Message-ID: <1334240080-27421-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch from the strict UCLIBC_HAS_CTYPE_ENFORCED=y to the less
restrictive UCLIBC_HAS_CTYPE_CHECKED=y since it breaks dialog under
certain circumstances (bug #5018).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/uClibc-0.9.31.config   |    4 ++--
 toolchain/uClibc/uClibc-0.9.32.config   |    4 ++--
 toolchain/uClibc/uClibc-0.9.33.config   |    4 ++--
 toolchain/uClibc/uClibc-snapshot.config |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index 80210c5..fd1ab98 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -150,8 +150,8 @@ UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
 # UCLIBC_HAS_CTYPE_UNSAFE is not set
-# UCLIBC_HAS_CTYPE_CHECKED is not set
-UCLIBC_HAS_CTYPE_ENFORCED=y
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
 # UCLIBC_HAS_WCHAR is not set
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
diff --git a/toolchain/uClibc/uClibc-0.9.32.config b/toolchain/uClibc/uClibc-0.9.32.config
index 7f21f1c..0782b6f 100644
--- a/toolchain/uClibc/uClibc-0.9.32.config
+++ b/toolchain/uClibc/uClibc-0.9.32.config
@@ -175,8 +175,8 @@ UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
 # UCLIBC_HAS_CTYPE_UNSAFE is not set
-# UCLIBC_HAS_CTYPE_CHECKED is not set
-UCLIBC_HAS_CTYPE_ENFORCED=y
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
 # UCLIBC_HAS_WCHAR is not set
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
diff --git a/toolchain/uClibc/uClibc-0.9.33.config b/toolchain/uClibc/uClibc-0.9.33.config
index 7e4e750..4ce643a 100644
--- a/toolchain/uClibc/uClibc-0.9.33.config
+++ b/toolchain/uClibc/uClibc-0.9.33.config
@@ -184,8 +184,8 @@ UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
 # UCLIBC_HAS_CTYPE_UNSAFE is not set
-# UCLIBC_HAS_CTYPE_CHECKED is not set
-UCLIBC_HAS_CTYPE_ENFORCED=y
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
 # UCLIBC_HAS_WCHAR is not set
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index 7e4e750..4ce643a 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -184,8 +184,8 @@ UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
 # UCLIBC_HAS_CTYPE_UNSAFE is not set
-# UCLIBC_HAS_CTYPE_CHECKED is not set
-UCLIBC_HAS_CTYPE_ENFORCED=y
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
 # UCLIBC_HAS_WCHAR is not set
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
-- 
1.7.3.4
