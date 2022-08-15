Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE0EC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DD2781501;
	Mon, 15 Aug 2022 09:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DD2781501
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9TC3_PysPrZ; Mon, 15 Aug 2022 09:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D3D8149B;
	Mon, 15 Aug 2022 09:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D3D8149B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B3551BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 455AA40977
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455AA40977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mh7BjmwGUKdx for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5388240928
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5388240928
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4BB3987601; Mon, 15 Aug 2022 09:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:53:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4d32bd37458d6fa2b418c1a37aba59fcba9f3fac
X-Git-Newrev: 0b389385666687ecfd09cdbce6c6ecfd74ce11ab
X-Patchwork-Hint: ignore
Message-Id: <20220815093903.4BB3987601@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/makedumpfile: add
 mips64 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b389385666687ecfd09cdbce6c6ecfd74ce11ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

mips64 is supported since bump to version 1.6.9 in commit
cb648d12fa733788cd2ea8e0fa8b00bb95983c4e and
https://github.com/makedumpfile/makedumpfile/commit/7f185d29aa1794a82a090c748aae2f7bf240fb49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index d5af38b598..62549f851f 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_s390x
 	default y if BR2_sparc64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
