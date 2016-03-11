From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:19:55 +0100
Subject: [Buildroot] [PATCH 2/6] linux/perf: honour the number of parallel
	jobs
In-Reply-To: <cover.1457720152.git.yann.morin.1998@free.fr>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
Message-ID: <cc2a12fd385458208ccbe41d7517071434388dc0.1457720152.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perf does not honour the -j flags we pass to make; it yet again tries to
reinvent the wheel and by default uses the number of CPUs as the number
of parallel jobs.

Fortunately, in their inifinite wisdom, the insane developpers of the
perf buildsystem were kind enough to provide us with a variable we can
set to specify the number of parallel jobs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/linux-tool-perf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index f9b295f..a5fbf21 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -16,6 +16,7 @@ endif
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
+	JOBS=$(PARALLEL_JOBS) \
 	ARCH=$(PERF_ARCH) \
 	NO_LIBAUDIT=1 \
 	NO_NEWT=1 \
-- 
1.9.1
