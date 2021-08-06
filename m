Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B4AC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 13:23:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB1E610FB
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 13:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CB1E610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 315BB40450;
	Fri,  6 Aug 2021 13:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzeemjXdZm7k; Fri,  6 Aug 2021 13:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D8BA40478;
	Fri,  6 Aug 2021 13:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A23951BF375
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 13:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9182083B40
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 13:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3Z8XrSuFRcN for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 13:23:00 +0000 (UTC)
X-Greylist: delayed 00:08:39 by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFCA683B24
 for <buildroot@busybox.net>; Fri,  6 Aug 2021 13:22:59 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:9cb1:396:ff75:91b9] (unknown
 [IPv6:2a01:e0a:947:6e20:9cb1:396:ff75:91b9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id E40C7C0009
 for <buildroot@busybox.net>; Fri,  6 Aug 2021 15:14:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1628255656;
 bh=GCsYliGSy+bqP2sBfPgD1xYtGsLyffFnLF7UczsYqmQ=;
 h=To:From:Subject:Date:From;
 b=Yt4t7NRkd0V9e8CYKmv9tSHOLgQHNe+Kwce50R+9OEb/bx/4ghAvHnBwYiyVdiiT1
 HS1N1AavzK4x5rAAfmc8YBcDTItJ2MOGv+5UrbSXW4BG5QsH1ckWTbYOb4QDGXXgXQ
 s7nn5K2g4IzZrivHv5u/8fA7pzWZZDwxhJoncqI6B0p5Bqup46NAM/Z3+0ush1EJeY
 LVXcfzrY+8g8CgrWPFBjaVCo3F6Ev23ZPXrmf3lV7i9mQWW6BwxhbB4mRDcw0iRNjy
 mp0bQd1bIFDfnlyFts6SKWy17i2ZtYnihMFRs4Zliz0LUP6Wp0LauU1Ph2AfMZ8rdL
 lvF0PVU7PG93g==
To: buildroot mailing list <buildroot@busybox.net>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <6c91caa7-cd14-38e0-2c0c-f84a534b62a8@grenoble.cnrs.fr>
Date: Fri, 6 Aug 2021 15:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump
 at91bootstrap3 version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

AT91Bootstrap 3.10.2 has a bug in its Makefile:[1] it gives the
-nostartfiles flag to the ld command, although this is a gcc flag, not
an ld flag. The bug happens to be harmless when using binutils 2.35.
However, the ld shipped with binutils 2.36 is more strict in its option
parsing, and fails with the following error:

    .../output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld:
    Error: unable to disambiguate: -nostartfiles
    (did you mean --nostartfiles ?)

The bug was fixed upstream in commit 3207586a.[2] However, since there
has been no tagged 3.x release since then, we just upgrade to the
current head of the branch at91bootstrap-3.x.

[1] https://github.com/linux4sam/at91bootstrap/issues/127
[2] https://github.com/linux4sam/at91bootstrap/commit/3207586a79aba527bbf20560930089b800f191ac

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Note: I only updated the defconfigs matching the board I have. I seems,
however, that many defconfigs use a version of AT91Bootstrap affected by
this bug (it is there since the upstream's initial commit), and none of
these defconfigs requests a version of binutils older than 2.36.

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 618ef0e756..00b99c0ad8 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.2"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index e9d74be7c8..f4af2501b8 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.2"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
