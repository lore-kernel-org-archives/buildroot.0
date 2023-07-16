Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F71EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B85D5404FF;
	Sun, 16 Jul 2023 16:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85D5404FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKIsoiSBfJ66; Sun, 16 Jul 2023 16:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBB0240141;
	Sun, 16 Jul 2023 16:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBB0240141
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 654631BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BFF081452
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BFF081452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0NKD8i3oY8j for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:29:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F4A8813D2
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4A8813D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EF9C86F59; Sun, 16 Jul 2023 16:29:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:25:04 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: da9f314f9de6165d574c383372c882fd1a4fe7ce
X-Git-Newrev: 5230b93c77fb4017a6eb64adab45981184e7b46d
X-Patchwork-Hint: ignore
Message-Id: <20230716162934.6EF9C86F59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] configs/nitrogen*: add
 missing pylibfdt u-boot dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=5230b93c77fb4017a6eb64adab45981184e7b46d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Needed by binman.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271714
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271716
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271718
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271719

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce8bf14ff61199c61577ee79f6745616466bc6f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nitrogen8m_defconfig  | 1 +
 configs/nitrogen8mm_defconfig | 1 +
 configs/nitrogen8mn_defconfig | 1 +
 configs/nitrogen8mp_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 6c490f195b..4ae3f45ff1 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 27cdc9e19e..0d0482458b 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 775bdecd90..ae53f5ce04 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 0767ab1375..105d572a7f 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
