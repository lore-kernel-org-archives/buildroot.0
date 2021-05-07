From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Thu,  6 May 2021 17:43:43 -0700
Subject: [Buildroot] [PATCH v2 2/3] lmbench: increase memsize delay for slow
 FPGAs
In-Reply-To: <20210507004344.3166099-1-vgupta@synopsys.com>
References: <20210507004344.3166099-1-vgupta@synopsys.com>
Message-ID: <20210507004344.3166099-3-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch

diff --git a/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
new file mode 100644
index 000000000000..6c3e7370e11b
--- /dev/null
+++ b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
@@ -0,0 +1,28 @@
+From d85b61666aa2728f68b69d02bfb162c432df709f Mon Sep 17 00:00:00 2001
+From: vgupta <vgupta@4eed8e25-bc12-0410-818a-f70ee6866280>
+Date: Sat, 3 Mar 2012 10:02:24 +0000
+Subject: [PATCH] TOO_LONG 100 usec to prevent memsize from timingout @80Mhz
+
+git-svn-id: http://sjvm-subversion02.internal.synopsys.com/svn/OSS/ARC_Linux/tests/lmbench-3.0-a9 at 157318 4eed8e25-bc12-0410-818a-f70ee6866280
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+---
+ src/memsize.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/memsize.c b/src/memsize.c
+index eb25a0924872..b333cf8cbd32 100644
+--- a/src/memsize.c
++++ b/src/memsize.c
+@@ -15,7 +15,7 @@ char	*id = "$Id$\n";
+ #define	CHK(x)	if ((x) == -1) { perror("x"); exit(1); }
+ 
+ #ifndef	TOO_LONG
+-#define	TOO_LONG	10	/* usecs */
++#define	TOO_LONG	100	/* usecs */
+ #endif
+ 
+ int	alarm_triggered = 0;
+-- 
+2.25.1
+
-- 
2.25.1
