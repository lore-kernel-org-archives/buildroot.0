Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808F3E6896D
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 10:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311DE80DD6;
	Thu, 31 Oct 2024 10:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Re9xw0rBp1HT; Thu, 31 Oct 2024 10:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F55480E88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F55480E88;
	Thu, 31 Oct 2024 10:08:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1F885E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 10:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0A8980E88
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 10:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WCGccGqMbLV for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 10:08:11 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 31 Oct 2024 10:08:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 470BB80E8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 470BB80E8D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.13;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 470BB80E8D
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 10:08:09 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MvaO8-1txraE2DqA-00wvue; Thu, 31 Oct 2024 11:03:00 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 10:57:25 +0100
Message-ID: <20241031100108.3431-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:JmPDXshNoYE+aUBcmFJTn1eQKamdtiBjEs5+jcw40EtigDiJg1I
 sObsEivgSugws2ntS1n8g6j4q6fS971z5l06K7GX4cvlBPJw8G0m6VQy+yAR2nPJuh5y654
 y/V6fAC7VchdzH+BsxM3etJIIHvDGDvvAWrPLWC6GhDEw52sJwtytuYTEMSWCR7X2tVt02r
 R1OeiMBEY53lO+Y1CGLQQ==
UI-OutboundReport: notjunk:1;M01:P0:BmZcQbWOY48=;NgBLE3gHZieQ4EYH87eAJriGvkA
 jpySFMZ/yiT/iPb1hYGgNIyHAsXQbRFg8tuzbdOTUnofU55VgAguIHWms/m4PPwdNfCkNFgqB
 Fnn/fwagh7ECseAFe5ApVoGiCK1qIhlSpJR9XZggal6/AGOHnAsCbZ9tz8JIpxFJxb8XyjUb5
 uGN/vmFAeFUoI/ApiRcN4/8ObmeifSG3WE0qiMgU2yT68DEaGk43Vg3q1RlibbTeJvP9uW2dM
 Ds6x0lkWIbd0A/hw4OtCrMNNJ50wyMIkr6PxIv0QdlDIs3uGrFYJSjEerWlUWeDCdu96DiM9z
 JSa6+aFMPMxsCigCeh2CBno2f9GY44F//OFxUss2UrNLnc7nSDJ3r8kUfxPu94n+T0qJlOrjC
 fYCDE7V0t0FmcMJM7ZFJ79H5eN+6umsFMjvF7gQOaIDt4vHoeELs3RCEAtwmc6Zepd9Jl9ZkN
 dX9qsQq5XSbpWmHuOPbLIY0miWciDaVdc2bznVBM4Sx3O+MggWasgMWqDSkw3I2PRTTkgD+Dd
 9hyPeEkr+fM07j7J8d3ugDfTDImZ0I6zsZ7tVANKbaT8fd+c0lwRN6RMGfPHdphIsAGYU/JWo
 K63ZDhMG8mz91/g64CHkK2OM5Pv4aRo6e30gHCyy1bfWDYLYNl7JyporzIFf9PviYwbKCXG7d
 bSKxTwMpXRN/PiMQpbjcFY4ppqUMisDzW9jWYds9a/hzTpT5JFraBhbJ3gxD2N96ejJp5eAAA
 iRxuW3VkhIWz777e2veSH5uoJWSSC6RZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 2024.0(5|8).x 1/1] package/bluez-alsa: Fix
 compilation with GCC 14 on musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bluez-alsa 4.1.1 uses the glibc basename() function, which is not
available on musl.  On GCC < 14, it would probably compile with a
warning, but GCC 14 now rejects this.

Backport an upstream fix to switch to the posix basename() on musl.

Fixes: https://autobuild.buildroot.org/results/8ada292393185328677b58a69c9e370c3118880f
Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
2024.02 does not have GCC 14 and bluez-alsa was bumped in 2024.11

 ...ompilation-on-strict-POSIX-platforms.patch | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 package/bluez-alsa/0001-Fix-compilation-on-strict-POSIX-platforms.patch

diff --git a/package/bluez-alsa/0001-Fix-compilation-on-strict-POSIX-platforms.patch b/package/bluez-alsa/0001-Fix-compilation-on-strict-POSIX-platforms.patch
new file mode 100644
index 0000000000..b1c8bfaab0
--- /dev/null
+++ b/package/bluez-alsa/0001-Fix-compilation-on-strict-POSIX-platforms.patch
@@ -0,0 +1,90 @@
+From ef85a335ad8919930f62d80ae99a74a5e766fc3b Mon Sep 17 00:00:00 2001
+From: Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
+Date: Sun, 25 Aug 2024 08:42:39 +0200
+Subject: [PATCH] Fix compilation on strict POSIX platforms
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Upstream: https://github.com/arkq/bluez-alsa/commit/070ed35ac5cef8138ed4
+---
+ src/main.c            | 2 +-
+ test/mock/mock.c      | 2 +-
+ utils/aplay/aplay.c   | 1 +
+ utils/cli/cli.c       | 1 +
+ utils/rfcomm/rfcomm.c | 1 +
+ 5 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index e93cb33..597ac01 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -13,12 +13,12 @@
+ #endif
+ 
+ #include <getopt.h>
++#include <libgen.h>
+ #include <signal.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <string.h>
+ #include <strings.h>
+ #include <time.h>
+ 
+diff --git a/test/mock/mock.c b/test/mock/mock.c
+index 83a8ab5..b5bcedd 100644
+--- a/test/mock/mock.c
++++ b/test/mock/mock.c
+@@ -16,12 +16,12 @@
+ #include <assert.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <signal.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <string.h>
+ #include <strings.h>
+ #include <sys/stat.h>
+ 
+diff --git a/utils/aplay/aplay.c b/utils/aplay/aplay.c
+index 999d1ef..49b0d65 100644
+--- a/utils/aplay/aplay.c
++++ b/utils/aplay/aplay.c
+@@ -15,6 +15,7 @@
+ #include <assert.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <math.h>
+ #include <poll.h>
+ #include <pthread.h>
+diff --git a/utils/cli/cli.c b/utils/cli/cli.c
+index d480ef1..299c44c 100644
+--- a/utils/cli/cli.c
++++ b/utils/cli/cli.c
+@@ -13,6 +13,7 @@
+ #endif
+ 
+ #include <getopt.h>
++#include <libgen.h>
+ #include <stdarg.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+diff --git a/utils/rfcomm/rfcomm.c b/utils/rfcomm/rfcomm.c
+index 9eba57f..20c1214 100644
+--- a/utils/rfcomm/rfcomm.c
++++ b/utils/rfcomm/rfcomm.c
+@@ -15,6 +15,7 @@
+ #include <ctype.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <poll.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
