Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B165C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1960040B1D;
	Wed, 24 Aug 2022 11:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1960040B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G25kbnb7jz1B; Wed, 24 Aug 2022 11:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AD86401A3;
	Wed, 24 Aug 2022 11:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AD86401A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A20D1BF37A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4443A40298
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4443A40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E3v5Fo_UA-UC for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:21:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DB9940280
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DB9940280
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7D81287D02; Wed, 24 Aug 2022 11:07:06 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 13:21:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84d32e53657db32784608c1130ec5290667a652f
X-Git-Newrev: 1fc299ad6a97f8f827ec423b00db7ac0cd73fdfa
X-Patchwork-Hint: ignore
Message-Id: <20220824110706.7D81287D02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: remove spurious
 semicolon
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fc299ad6a97f8f827ec423b00db7ac0cd73fdfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From flake8:
utils/genrandconfig:429:21: E703 statement ends with a semicolon
1     E703 statement ends with a semicolon

Fixes: d3e029575c29cad2ba40cce7bf4270a28b83870e

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index eaf5bd35d6..54146a99de 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -429,7 +429,7 @@ def fixup_config(sysinfo, configfile):
 
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
