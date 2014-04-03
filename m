From: Paul Cercueil <paul@crapouillou.net>
Date: Thu,  3 Apr 2014 23:01:21 +0200
Subject: [Buildroot] [PATCH 11/11] stress: Patch to fix documentation source
In-Reply-To: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
Message-ID: <1396558881-29631-11-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maarten ter Huurne <maarten@treewalker.org>

Some versions of "makeinfo" consider @itemx not immediately following
@item an error. It is a violation of the texinfo syntax, but silently
ignored on most systems, for some reason.

Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
Acked-By: Paul Cercueil <paul@crapouillou.net>
---
 package/stress/stress-doc-itemx.patch | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/stress/stress-doc-itemx.patch

diff --git a/package/stress/stress-doc-itemx.patch b/package/stress/stress-doc-itemx.patch
new file mode 100644
index 0000000..8ef7fa4
--- /dev/null
+++ b/package/stress/stress-doc-itemx.patch
@@ -0,0 +1,47 @@
+diff -ru stress-1.0.4.org/doc/stress.texi stress-1.0.4/doc/stress.texi
+--- stress-1.0.4.org/doc/stress.texi	2005-03-10 02:16:02.000000000 +0100
++++ stress-1.0.4/doc/stress.texi	2013-07-21 21:50:47.000000000 +0200
+@@ -65,7 +65,7 @@
+ @itemx --help
+ Show help information.
+ 
+- at itemx --version
++ at item --version
+ Show version information.
+ 
+ @item -v
+@@ -84,7 +84,7 @@
+ @itemx --timeout @var{secs}
+ Time out after @var{secs} seconds.
+ 
+- at itemx --backoff @var{usecs}
++ at item --backoff @var{usecs}
+ Wait for factor of @var{usecs} microseconds before starting work.
+ 
+ @item -c @var{forks}
+@@ -99,10 +99,10 @@
+ @itemx --vm @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{malloc()}.
+ 
+- at itemx --vm-bytes @var{bytes}
++ at item --vm-bytes @var{bytes}
+ Allocate @var{bytes} number of bytes.  The default is 1.
+ 
+- at itemx --vm-hang
++ at item --vm-hang
+ Instruct each vm hog process to go to sleep after allocating memory.  This
+ contrasts with their normal behavior, which is to free the memory and
+ reallocate @emph{ad infinitum}.  This is useful for simulating low memory
+@@ -117,10 +117,10 @@
+ @itemx --hdd @var{forks}
+ Spawn @var{forks} processes each spinning on @samp{write()}.
+ 
+- at itemx --hdd-bytes @var{bytes}
++ at item --hdd-bytes @var{bytes}
+ Write @var{bytes} number of bytes.  The default is 1GB.
+ 
+- at itemx --hdd-noclean
++ at item --hdd-noclean
+ Do not unlink file(s) to which random ASCII data is written.
+ 
+ @end table
-- 
1.9.0
