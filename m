From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu, 27 Sep 2018 07:46:46 -0700
Subject: [Buildroot] [PATCH 2/2] perl-sys-cpu: remove extraneous include
In-Reply-To: <20180927144646.20954-1-chrismcc@gmail.com>
References: <20180927144646.20954-1-chrismcc@gmail.com>
Message-ID: <20180927144646.20954-3-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove extraneous include <sys/unistd.h>
in glibc this points back to include unistd.h
neither musl, nor uclib have it.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-sys-cpu/0001-remove-extraneous-include.patch | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 package/perl-sys-cpu/0001-remove-extraneous-include.patch

diff --git a/package/perl-sys-cpu/0001-remove-extraneous-include.patch b/package/perl-sys-cpu/0001-remove-extraneous-include.patch
new file mode 100644
index 0000000000..2ef11a0226
--- /dev/null
+++ b/package/perl-sys-cpu/0001-remove-extraneous-include.patch
@@ -0,0 +1,10 @@
+--- perl-sys-cpu-0.52/CPU.xs.orig	2018-09-18 10:23:48.473223024 -0700
++++ perl-sys-cpu-0.52/CPU.xs	2018-09-18 10:24:40.973670159 -0700
+@@ -24,7 +24,6 @@
+  #include <winreg.h>
+ #else                /* other (try unix) */
+  #include <unistd.h>
+- #include <sys/unistd.h>
+ #endif
+ #if defined(__sun) || defined(__sun__) 
+  #include <sys/processor.h>
-- 
2.14.4
