From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 28 Jan 2014 14:10:58 +0100
Subject: [Buildroot] [PATCH 2/2] perf: Don't build backtrace for ARC
Message-ID: <1390914658-18198-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/perf/perf.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index ffe18bc..5628ba5 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -22,6 +22,10 @@ PERF_MAKE_FLAGS = \
 	WERROR=0 \
 	ASCIIDOC=
 
+ifeq ($(BR2_arc),y)
+	PERF_MAKE_FLAGS += NO_BACKTRACE=1
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 	PERF_DEPENDENCIES += elfutils
 else
-- 
1.7.9.5
