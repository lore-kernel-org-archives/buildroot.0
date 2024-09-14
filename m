Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FD4C021A6
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A376C80EEF;
	Sat, 14 Sep 2024 16:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQ3dk7xhdl3T; Sat, 14 Sep 2024 16:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA81A8409B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA81A8409B;
	Sat, 14 Sep 2024 16:32:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 265551BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD65880D66
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEevqu4Q5tjZ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E7580E22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E7580E22
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:32:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4AF58354A; Sat, 14 Sep 2024 16:32:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 18:30:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f05f2101dfac67e7953909ab06baf70138769be3
X-Git-Newrev: 9114da45e612e9c02622c7fc9bf26694e9758556
X-Patchwork-Hint: ignore
Message-Id: <20240914163220.D4AF58354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx6udoo: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9114da45e612e9c02622c7fc9bf26694e9758556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
build warning:

include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
 1471 | #  include <openssl/evp.h>

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199927

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 configs/mx6udoo_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 6c84a41bfd..7e94e0a833 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
