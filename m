From: John Keeping <john@metanate.com>
Date: Mon,  2 Apr 2018 13:51:45 +0100
Subject: [Buildroot] [PATCH] linux-tool-perf: permit TUI build
Message-ID: <20180402125145.13431-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Linux 3.10, perf's NO_NEWT configuration option simply sets
NO_SLANG=1 and there is no dependency on libnewt.

We already handle NO_SLANG correctly based on whether or not
BR2_PACKAGE_SLANG is selected, so all we accomplish by setting NO_NEWT=1
is disabling perf's TUI when all of the dependencies are available.

Linux 3.10 is almost 5 years old now, so there doesn't seem to be any
point in jumping through additional hoops to make perf from older kernel
versions build when the newt package is not available.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 69492ba8da..bb9d1655e6 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -22,7 +22,6 @@ PERF_MAKE_FLAGS = \
 	prefix=/usr \
 	WERROR=0 \
 	NO_LIBAUDIT=1 \
-	NO_NEWT=1 \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
-- 
2.16.3
