Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10044EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 09:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF4261237;
	Wed, 14 Jun 2023 09:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF4261237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntF34PsWVJuO; Wed, 14 Jun 2023 09:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA17E611CE;
	Wed, 14 Jun 2023 09:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA17E611CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 619241BF969
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A6C541756
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A6C541756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ud_-2y4NeuYb for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 787B84175C
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 787B84175C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6812783581; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 11:22:53 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0afd81fbf53d2cfb5aa491f601d2581143fed5e9
X-Git-Newrev: cc7beaea3d51ccf117189c83dec1aeba7ef488ea
X-Patchwork-Hint: ignore
Message-Id: <20230614092354.6812783581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/earlyoom:
 unhardcode package version in CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc7beaea3d51ccf117189c83dec1aeba7ef488ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

'earlyoom --help' still says 'earlyoom 1.6' though it's already
version 1.7. '-DVERSION' flag value should be either unhardcoded,
either updated with each package version bump.

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 239dd7dcbda1b2c86a29491158fa089e06efca33)
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
