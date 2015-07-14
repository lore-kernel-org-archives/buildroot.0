From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Jul 2015 19:35:09 +0200
Subject: [Buildroot] [PATCH v5 2/8] package/perf: if numactl (libnuma) is
	enabled, depend on it
In-Reply-To: <1436895315-15554-1-git-send-email-romain.naour@openwide.fr>
References: <1436895315-15554-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1436895315-15554-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Steven Noonan <steven@uplinklabs.net>

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
[Romain:
  - fix coding style]
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v5: new patch
---
 package/perf/perf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index dee05c3..9fdce95 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -36,6 +36,10 @@ ifeq ($(BR2_PACKAGE_SLANG),y)
 PERF_DEPENDENCIES += slang
 endif
 
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+PERF_DEPENDENCIES += numactl
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 PERF_DEPENDENCIES += elfutils
 else
-- 
2.4.3
