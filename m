From: =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <sir.venceslas@gmail.com>
Date: Wed, 11 Nov 2020 17:00:08 +0100
Subject: [Buildroot] [PATCH 2/2] package/perf: if zstd is enabled,
 depend on it
In-Reply-To: <20201111160008.2010373-1-sir.venceslas@gmail.com>
References: <20201111160008.2010373-1-sir.venceslas@gmail.com>
Message-ID: <20201111160008.2010373-2-sir.venceslas@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables the "-z" flag.

Signed-off-by: V?clav Kubern?t <sir.venceslas@gmail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index e54f019888..efa747cf8d 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -69,6 +69,10 @@ else
 PERF_MAKE_FLAGS += NO_LIBAUDIT=1
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+PERF_DEPENDENCIES += zstd
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 PERF_DEPENDENCIES += libunwind
 else
-- 
2.29.2
