Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3696C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 699FF40A99;
	Mon, 15 Aug 2022 09:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 699FF40A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBgbOSCbBako; Mon, 15 Aug 2022 09:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0568740A93;
	Mon, 15 Aug 2022 09:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0568740A93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2311BF990
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E804827CE
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E804827CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPjxaDZX6nO6 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 943088289B
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943088289B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9C153875B3; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e83ab59920537d8ed2dfdb60fbbe9d062be3661
X-Git-Newrev: f008c74061e604069d9716ac97d2a3f78c9f00b3
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.9C153875B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jquery-ui-themes: fix typo on
 BR2_PACKAGE_JQUERY_UI_THEMES_VADER
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f008c74061e604069d9716ac97d2a3f78c9f00b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The typo was added in 2018 by commit
'94c146282f jquery-ui-themes: rename options to have proper prefix'

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jquery-ui-themes/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
index 29359544ac..b372d40b60 100644
--- a/package/jquery-ui-themes/Config.in
+++ b/package/jquery-ui-themes/Config.in
@@ -112,6 +112,6 @@ config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
 	default "trontastic"		if BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC
 	default "ui-darkness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS
 	default "ui-lightness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS
-	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEMES_UI_VADER
+	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEMES_VADER
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
