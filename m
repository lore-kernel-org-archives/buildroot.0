Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09788C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B369A61153;
	Sat, 17 Sep 2022 15:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B369A61153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEhmnStppy0J; Sat, 17 Sep 2022 15:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0BFC61193;
	Sat, 17 Sep 2022 15:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0BFC61193
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59C1F1BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 345A841DBE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 345A841DBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grGTKRrnepAQ for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3627141DAD
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3627141DAD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 253208455A; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:18:55 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ba27d0889f016e111ca33dda5c00ae4974864f49
X-Git-Newrev: a4bfdee1e0deecbd41a53ed3c3e45ad2cc7fb9bb
X-Patchwork-Hint: ignore
Message-Id: <20220917154057.253208455A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] utils/genrandconfig:
 remove spurious semicolon
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4bfdee1e0deecbd41a53ed3c3e45ad2cc7fb9bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

From flake8:
utils/genrandconfig:429:21: E703 statement ends with a semicolon
1     E703 statement ends with a semicolon

Fixes: d3e029575c29cad2ba40cce7bf4270a28b83870e

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 1fc299ad6a97f8f827ec423b00db7ac0cd73fdfa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 33b124cd8d..14bc6b00bd 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -432,7 +432,7 @@ def fixup_config(sysinfo, configfile):
 
     if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
        'BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=""\n' in configlines:
-        return False;
+        return False
 
     if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
        'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n' in configlines and \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
