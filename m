Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C55FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39ED680BDA;
	Mon,  7 Mar 2022 22:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGuOv1MEPmzN; Mon,  7 Mar 2022 22:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A02180BA9;
	Mon,  7 Mar 2022 22:28:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 733121BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62C8E6070A
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2-7U4zpqqTD for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:27:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED67A60B1B
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:27:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1AC5083235; Mon,  7 Mar 2022 22:19:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 23:17:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dc48e8b9d832889edbeeed28c2dcf0a7bf01718
X-Git-Newrev: f64e13a6a6e861ae8a03dc8e93fe079f09c443aa
X-Patchwork-Hint: ignore
Message-Id: <20220307221917.1AC5083235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/upmpdcli: append to _CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=f64e13a6a6e861ae8a03dc8e93fe079f09c443aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package now gives a warning about this. It's not a problem at the
moment, but it's a risk if an unconditional setting of _CONF_OPTS is
done earlier in the file.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/upmpdcli/upmpdcli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index d1c0aef912..2f001c51ee 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -12,7 +12,7 @@ UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 
 # Disable spotify plugin which requires dlfcn.h
 ifeq ($(BR2_STATIC_LIBS),y)
-UPMPDCLI_CONF_OPTS = --disable-spotify
+UPMPDCLI_CONF_OPTS += --disable-spotify
 endif
 
 # Upmpdcli only runs if user upmpdcli exists
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
