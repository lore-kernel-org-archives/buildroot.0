Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A3AC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D643E842E7;
	Fri, 16 Sep 2022 11:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D643E842E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZj2SB9Cl5Jj; Fri, 16 Sep 2022 11:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C85842E2;
	Fri, 16 Sep 2022 11:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C85842E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64BB21C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84484842C4
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84484842C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMUaXMLJERwi for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB55C842CA
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB55C842CA
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9BB7B83CC5; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:26:54 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 08e1aa9aa46fcffdd878cd66f06d50665547a943
X-Git-Newrev: f895f7e19c8f096398bd4786f8c26b46bc7a65c9
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.9BB7B83CC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/jquery-ui-themes:
 fix typo on BR2_PACKAGE_JQUERY_UI_THEMES_VADER
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

commit: https://git.buildroot.net/buildroot/commit/?id=f895f7e19c8f096398bd4786f8c26b46bc7a65c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The typo was added in 2018 by commit
'94c146282f jquery-ui-themes: rename options to have proper prefix'

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f008c74061e604069d9716ac97d2a3f78c9f00b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
