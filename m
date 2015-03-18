From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:43:01 -0700
Subject: [Buildroot] [PATCH 5/7] package/perf: patch installation paths
In-Reply-To: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426714983-24803-5-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/perf/0001-fix-install-paths.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/perf/0001-fix-install-paths.patch

diff --git a/package/perf/0001-fix-install-paths.patch b/package/perf/0001-fix-install-paths.patch
new file mode 100644
index 0000000..6046362
--- /dev/null
+++ b/package/perf/0001-fix-install-paths.patch
@@ -0,0 +1,20 @@
+--- a/tools/perf/config/Makefile	2014-02-13 23:00:14.000000000 +0100
++++ b/tools/perf/config/Makefile	2014-02-17 20:01:33.370539725 +0100
+@@ -561,7 +561,7 @@
+ bindir = $(prefix)/$(bindir_relative)
+ mandir = share/man
+ infodir = share/info
+-perfexecdir = libexec/perf-core
++perfexecdir = lib/perf
+ sharedir = $(prefix)/share
+ template_dir = share/perf-core/templates
+ htmldir = share/doc/perf-doc
+@@ -573,7 +573,7 @@
+ ETC_PERFCONFIG = etc/perfconfig
+ endif
+ ifeq ($(IS_X86_64),1)
+-lib = lib64
++lib = lib
+ else
+ lib = lib
+ endif
-- 
2.3.3
