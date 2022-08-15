Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E73BC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ECE640A93;
	Mon, 15 Aug 2022 09:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ECE640A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PA3ihJ7RdTeF; Mon, 15 Aug 2022 09:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C68D40AB7;
	Mon, 15 Aug 2022 09:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C68D40AB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 138E61BF9A4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2BAA416F4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2BAA416F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clyB726kg7EQ for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35B0F41634
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B0F41634
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4CADB875A7; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59244619944725e7d01619829d80d15dfd7c19c2
X-Git-Newrev: 52c000f3ab12773c96dc0df89eea8b606d34a117
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.4CADB875A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcf-agent: drop bogus BR2_powerpcle
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

commit: https://git.buildroot.net/buildroot/commit/?id=52c000f3ab12773c96dc0df89eea8b606d34a117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The inexistent symbol is referenced by commit from 2018:
'd0d04b4c5a tcf-agent: new package'

Cc: Eugene Tarassov <eugene@largest.net>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tcf-agent/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 50e58642b0..8c7aab0c0b 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i686"       if BR2_i386 && BR2_ARCH="i686"
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
-	default "powerpc"    if BR2_powerpc || BR2_powerpcle
+	default "powerpc"    if BR2_powerpc
 	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
 	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
