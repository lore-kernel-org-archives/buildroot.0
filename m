From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 19:49:07 +0200
Subject: [Buildroot] [PATCH] docs/manual: add a 'Known issues' chapter
Message-ID: <1381081747-20598-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a 'Known issues' chapter, which lists the exceptions I have
currently in the autobuilder scripts to avoid known problems from
occuring. I believe it is more useful to document them rather than
keeping them hidden in my autobuilder script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/known-issues.txt | 32 ++++++++++++++++++++++++++++++++
 docs/manual/manual.txt       |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 docs/manual/known-issues.txt

diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
new file mode 100644
index 0000000..f731f8f
--- /dev/null
+++ b/docs/manual/known-issues.txt
@@ -0,0 +1,32 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+Known issues
+============
+
+* The +ltp-testsuite+ package does not build with the default uClibc
+  configuration used by the Buildroot toolchain backend. The LTP
+  testsuite uses several functions that are considered obsolete, such
+  as sigset() and others. uClibc configuration options such as
+  DO_XSI_MATH, UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and
+  UCLIBC_SV4_DEPRECATED are needed if one wants to build the
+  +ltp-testsuite+ package with uClibc. You need to either a glibc or
+  eglibc based toolchain, or enable the appropriate options in the
+  uClibc configuration.
+
+* The +xfsprogs+ package does not build with the default uClibc
+  configuration used by the Buildroot toolchain backend. You need to
+  either a glibc or eglibc based toolchain, or enable the appropriate
+  options in the uClibc configuration.
+
+* The +mrouted+ package does not build with the default uClibc
+  configuration used by the Buildroot toolchain backend. You need to
+  either a glibc or eglibc based toolchain, or enable the appropriate
+  options in the uClibc configuration.
+
+* The +libffi+ package is not supported on the SuperH 2 and ARC
+  architectures.
+
+* The +prboom+ package triggers a compiler failure with the SuperH 4
+  compiler from Soucery CodeBench, version 2012.09.
+
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 9685667..9ae658e 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -23,6 +23,8 @@ include::working-with.txt[]
 
 include::faq-troubleshooting.txt[]
 
+include::known-issues.txt[]
+
 include::going-further.txt[]
 
 include::developer-guide.txt[]
-- 
1.8.1.2
