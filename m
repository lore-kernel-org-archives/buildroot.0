Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59F7C7EE29
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62998418B3;
	Fri,  2 Jun 2023 19:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62998418B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3M5Lvu5mBVy; Fri,  2 Jun 2023 19:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A50F341896;
	Fri,  2 Jun 2023 19:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A50F341896
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 110151BF97E
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF4F84189C
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF4F84189C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgJpPwcQznfo for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:25:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0588241883
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0588241883
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7C9886B7E; Fri,  2 Jun 2023 19:25:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 21:24:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 281a80dc934d3e8d8e780b04276cfe38b4bea9d5
X-Git-Newrev: 239dd7dcbda1b2c86a29491158fa089e06efca33
X-Patchwork-Hint: ignore
Message-Id: <20230602192548.E7C9886B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/earlyoom: unhardcode package
 version in CFLAGS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=239dd7dcbda1b2c86a29491158fa089e06efca33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'earlyoom --help' still says 'earlyoom 1.6' though it's already
version 1.7. '-DVERSION' flag value should be either unhardcoded,
either updated with each package version bump.

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/earlyoom/earlyoom.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
index c7042a054e..808b9c49fa 100644
--- a/package/earlyoom/earlyoom.mk
+++ b/package/earlyoom/earlyoom.mk
@@ -11,7 +11,7 @@ EARLYOOM_LICENSE_FILES = LICENSE
 
 EARLYOOM_BUILD_TARGETS = earlyoom.service earlyoom
 EARLYOOM_INSTALL_TARGETS = install-default install-bin
-EARLYOOM_CFLAGS = '$(TARGET_CFLAGS) -std=gnu99 -DVERSION=\"1.6\"'
+EARLYOOM_CFLAGS = '$(TARGET_CFLAGS) -std=gnu99 -DVERSION=\"$(EARLYOOM_VERSION)\"'
 
 EARLYOOM_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
