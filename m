From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Nov 2011 12:11:17 +0100
Subject: [Buildroot] [git commit] uClibc 0.9.31.1: add patch to export
	strverscmp for real
Message-ID: <20111102114940.57D248F415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fed97eb0d82c6adfaf957d1b2f00362d1653453
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc/uClibc-0.9.31.1-export-strverscmp.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.31.1-export-strverscmp.patch b/toolchain/uClibc/uClibc-0.9.31.1-export-strverscmp.patch
new file mode 100644
index 0000000..19bc021
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31.1-export-strverscmp.patch
@@ -0,0 +1,30 @@
+From 139b8f0c673fed465d27f99c98568e5d5e1b9b72 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 4 Jun 2010 13:36:30 +0200
+Subject: [PATCH] strverscmp: I forgot to export it
+
+Result was:
+
+strverscmp.o:
+000000ec T __GI_strverscmp
+
+i.e. no plain "strverscmp"!
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ libc/string/strverscmp.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/libc/string/strverscmp.c b/libc/string/strverscmp.c
+index 74ae4c6..b19e8f0 100644
+--- a/libc/string/strverscmp.c
++++ b/libc/string/strverscmp.c
+@@ -115,3 +115,4 @@ int strverscmp (const char *s1, const char *s2)
+       return state;
+   }
+ }
++libc_hidden_def(strverscmp)
+-- 
+1.7.3.4
+
