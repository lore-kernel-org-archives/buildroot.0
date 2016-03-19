From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:37:32 +0100
Subject: [Buildroot] [git commit] linux/perf: honour the number of parallel
	jobs
Message-ID: <20160319134759.F2D2B817FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4a2020424168cf467872ebac95bfdf41ec788dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perf does not honour the -j flags we pass to make; it yet again tries to
reinvent the wheel and by default uses the number of CPUs as the number
of parallel jobs.

Fortunately, in their infinite wisdom, the insane developpers of the
perf buildsystem were kind enough to provide us with a variable we can
set to specify the number of parallel jobs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
