Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6D9C6FA8B
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C0B40BAD;
	Fri, 16 Sep 2022 11:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81C0B40BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jqZA1HHX3M8s; Fri, 16 Sep 2022 11:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A33B640BA5;
	Fri, 16 Sep 2022 11:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A33B640BA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89D821BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46E8484294
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E8484294
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krWAotCfTeAa for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E756842B1
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E756842B1
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6EF6683CC3; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:21:55 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5186896a4f2a8c3b4bce4d4564bfa5cdeee12f60
X-Git-Newrev: 74f67426320458fe0b5f84251592f16b46471a5a
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.6EF6683CC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tcf-agent: drop
 bogus BR2_powerpcle
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

commit: https://git.buildroot.net/buildroot/commit/?id=74f67426320458fe0b5f84251592f16b46471a5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The inexistent symbol is referenced by commit from 2018:
'd0d04b4c5a tcf-agent: new package'

Cc: Eugene Tarassov <eugene@largest.net>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 52c000f3ab12773c96dc0df89eea8b606d34a117)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
