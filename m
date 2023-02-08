Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46B0C636D7
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F92C4067C;
	Wed,  8 Feb 2023 14:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F92C4067C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RTfmGAmj-85; Wed,  8 Feb 2023 14:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66BE740491;
	Wed,  8 Feb 2023 14:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66BE740491
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2D171BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD99640BF1
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD99640BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ck0rXvdsjBfW for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D24140BFC
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D24140BFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07D2E846E9; Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 15:28:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dab7a877148adad499a07c5ed785c42707593175
X-Git-Newrev: 2b021bc1d77ce485ac46114482024d12339d6b5b
X-Patchwork-Hint: ignore
Message-Id: <20230208142852.07D2E846E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: check files in utils/
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b021bc1d77ce485ac46114482024d12339d6b5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All the errors in existing scripts in utils/ have been fixed, so nothing
needs to be added to .checkpackageignore.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/check-package | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/check-package b/utils/check-package
index 12009b2476..98a25bd0b2 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -113,6 +113,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
     r"package/",
     r"system/",
     r"toolchain/",
+    r"utils/",
     ]))
 DO_NOT_CHECK_INTREE = re.compile(r"|".join([
     r"boot/barebox/barebox\.mk$",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
