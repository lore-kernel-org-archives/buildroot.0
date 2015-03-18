From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:42:59 -0700
Subject: [Buildroot] [PATCH 3/7] package/perf: if libunwind is enabled,
	depend on it
In-Reply-To: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426714983-24803-3-git-send-email-steven@uplinklabs.net>
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
index 6b74b00..f35abc9 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -34,6 +34,10 @@ ifeq ($(BR2_arc),y)
 	PERF_MAKE_FLAGS += NO_BACKTRACE=1
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+	PERF_DEPENDENCIES += libunwind
+endif
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 	PERF_DEPENDENCIES += numactl
 endif
-- 
2.3.3
