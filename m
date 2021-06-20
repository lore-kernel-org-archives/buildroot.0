Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B2DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:02:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23CBE60ED6
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23CBE60ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5FF840195;
	Tue,  3 Aug 2021 22:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9k4PRkOorb8w; Tue,  3 Aug 2021 22:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB4104020C;
	Tue,  3 Aug 2021 22:02:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3571BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 886EE608C5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o06B1BEAkcbK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C962B608C7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2C107876CF; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 14:40:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c6a4d7bed8d7cd6f0124111d974fd35d281e7a49
X-Git-Newrev: d5df29a2444d1c64e590c19c72d435ac146968e2
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.2C107876CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-rpi-ws281x:
 Bump to version 4.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5df29a2444d1c64e590c19c72d435ac146968e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove 0001-ws2811.c-fix-build-with-gcc-4.8.patch,
it has been merged upstream.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-ws2811.c-fix-build-with-gcc-4.8.patch     | 51 ----------------------
 package/python-rpi-ws281x/python-rpi-ws281x.hash   |  4 +-
 package/python-rpi-ws281x/python-rpi-ws281x.mk     |  4 +-
 3 files changed, 4 insertions(+), 55 deletions(-)

diff --git a/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch b/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 9b534ac67a..0000000000
--- a/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8faa5c2fb2b04b4fb062255aa807abafc50bff66 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 3 Apr 2021 10:27:20 +0200
-Subject: [PATCH] ws2811.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 (which has been added by
-commit 391f6e856d28510bd9ae4efd3a166da7f73613ab):
-
-lib/ws2811.c: In function 'ws2811_set_custom_gamma_factor':
-lib/ws2811.c:1289:5: error: 'for' loop initial declarations are only allowed in C99 mode
-     for (int chan = 0; chan < RPI_PWM_CHANNELS; chan++)
-     ^
-lib/ws2811.c:1289:5: note: use option -std=c99 or -std=gnu99 to compile your code
-lib/ws2811.c:1295:11: error: 'for' loop initial declarations are only allowed in C99 mode
-           for(int counter = 0; counter < 256; counter++)
-           ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/3d037922484bfc45d0f985f87b38f20c5a4ab064
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jgarff/rpi_ws281x/commit/0814bae544f0184ab1600bc2660486874eef5970]
----
- ws2811.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/ws2811.c b/ws2811.c
-index f5cdebd..6482796 100644
---- a/lib/ws2811.c
-+++ b/lib/ws2811.c
-@@ -1286,13 +1286,14 @@ const char * ws2811_get_return_t_str(const ws2811_return_t state)
- 
- void ws2811_set_custom_gamma_factor(ws2811_t *ws2811, double gamma_factor)
- {
--    for (int chan = 0; chan < RPI_PWM_CHANNELS; chan++)
-+    int chan, counter;
-+    for (chan = 0; chan < RPI_PWM_CHANNELS; chan++)
-     {
-         ws2811_channel_t *channel = &ws2811->channel[chan];
- 
-         if (channel->gamma)
-         {
--          for(int counter = 0; counter < 256; counter++)
-+          for(counter = 0; counter < 256; counter++)
-           {
- 
-              channel->gamma[counter] = (gamma_factor > 0)? (int)(pow((float)counter / (float)255.00, gamma_factor) * 255.00 + 0.5) : counter;
--- 
-2.30.2
-
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
index cb021a821d..06b2d18607 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
-md5  5da00a092ac3755c4913f5a53451744b  rpi_ws281x-4.2.6.tar.gz
-sha256  65a9918fbdd9df1ac612ccc1a385d4a550f1bc74cc6bbf6b9035ad26dc41b3ce  rpi_ws281x-4.2.6.tar.gz
+md5  333dacfc58058d5f485f9af74551c70e  rpi_ws281x-4.3.0.tar.gz
+sha256  0b9549687ab7117acbc4bac0e92742fd2c8290fd204514d72fed91c06ba2e805  rpi_ws281x-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index b8ba119919..b711039615 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_WS281X_VERSION = 4.2.6
+PYTHON_RPI_WS281X_VERSION = 4.3.0
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/7f/1e/ea9ff56d9823fc55c79748630ffe0ceb30f619c9218743050bbf96d08704
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/cd/b3/eb7ac93376952f165577707ec756f40c9537ed53c59fcbc3290c357370e0
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
