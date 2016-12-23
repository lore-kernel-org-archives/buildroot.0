From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Fri, 23 Dec 2016 00:32:40 +0000
Subject: [Buildroot] [PATCH] oprofile: Include operf command
Message-ID: <1482453206.8507.24.camel@kymetacorp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the main command to control oprofile.  It was introduced in
version 0.9.8 from 2012-08-27 and in version 1.0.0 the previous
control tool, opcontrol, was removed.

In commit 9863553fe8fa16a4d19f652b409a44bb58ef5567, removing avr32
support, code that added operf for !avr32 was removed rather than
keeping the code but making it non-conditional.

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
---
 package/oprofile/oprofile.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index d91ddab..f6c0f13 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -17,7 +17,7 @@ OPROFILE_BINARIES = \
 	utils/ophelp pp/opannotate pp/oparchive pp/opgprof \
 	pp/opreport opjitconv/opjitconv \
 	utils/op-check-perfevents libabi/opimport \
-	pe_counting/ocount
+	pe_counting/ocount pe_profiling/operf
 
 ifeq ($(BR2_i386),y)
 OPROFILE_ARCH = i386
-- 
2.7.0.25.gfc10eb5.dirty
