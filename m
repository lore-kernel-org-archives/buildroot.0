From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:42:57 -0700
Subject: [Buildroot] [PATCH 1/7] package/perf: if slang is enabled,
	depend on it
Message-ID: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/perf/perf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index f6591a6..2b0702c 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -34,6 +34,10 @@ ifeq ($(BR2_arc),y)
 	PERF_MAKE_FLAGS += NO_BACKTRACE=1
 endif
 
+ifeq ($(BR2_PACKAGE_SLANG),y)
+	PERF_DEPENDENCIES += slang
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 	PERF_DEPENDENCIES += elfutils
 else
-- 
2.3.3
