Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FED2C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:51:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F12A761029
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F12A761029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6B7483E5B;
	Tue,  3 Aug 2021 23:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrF6tcI0ZxLc; Tue,  3 Aug 2021 23:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEF183E35;
	Tue,  3 Aug 2021 23:51:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42D1D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1C2240ED6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3qdrMkiG_dQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ECB540E7B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 852DA86AA7; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jul 2021 23:03:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 90dfc0a59660020c21fdb5567e45d4edf3e66660
X-Git-Newrev: 68753ed38dc0a32389987f1f7af2413312ee667e
X-Patchwork-Hint: ignore
Message-Id: <20210803211009.852DA86AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/apitrace: fix musl
 build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=68753ed38dc0a32389987f1f7af2413312ee667e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

build on musl is broken since bump to version 10.0 in commit
1d15817576b44c30eaa9bb8d1152934c6498b776

Fixes:
 - http://autobuild.buildroot.org/results/a10793d01efa3a1533ba37aa845b9ac2bb1dfb6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...libbacktrace-backtrace-h-include-config.h.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch b/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
new file mode 100644
index 0000000000..bc76e5e26b
--- /dev/null
+++ b/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
@@ -0,0 +1,40 @@
+From 36ff87a927092b4d62c587736d7684dea9c82e63 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 19 Jul 2021 08:27:48 +0200
+Subject: [PATCH] thirdparty/libbacktrace/backtrace/h: include config.h
+
+Build on musl is broken since version 10.0 because the include on
+config.h was removed by
+https://github.com/apitrace/apitrace/commit/1544abf59d68d74977b8b692bea4d7468d65547b:
+
+In file included from /home/buildroot/autobuild/instance-3/output-1/build/apitrace-10.0/thirdparty/libbacktrace/testlib.c:40:
+/home/buildroot/autobuild/instance-3/output-1/build/apitrace-10.0/thirdparty/libbacktrace/backtrace.h:53:10: fatal error: gstdint.h: No such file or directory
+   53 | #include "gstdint.h"
+      |          ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a10793d01efa3a1533ba37aa845b9ac2bb1dfb6b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not needed
+(https://github.com/apitrace/apitrace/issues/755)]
+---
+ thirdparty/libbacktrace/backtrace.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/thirdparty/libbacktrace/backtrace.h b/thirdparty/libbacktrace/backtrace.h
+index 2814763f..ab7679a0 100644
+--- a/thirdparty/libbacktrace/backtrace.h
++++ b/thirdparty/libbacktrace/backtrace.h
+@@ -33,6 +33,8 @@ POSSIBILITY OF SUCH DAMAGE.  */
+ #ifndef BACKTRACE_H
+ #define BACKTRACE_H
+ 
++#include "config.h"
++
+ #include <stddef.h>
+ #include <stdio.h>
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
