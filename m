Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66C3F483EB
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB5D60872;
	Mon, 23 Mar 2026 19:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BzCgxMJEaU0; Mon, 23 Mar 2026 19:47:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860A860873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295257;
	bh=QDCEDdrjwDw1rFFA2msUYUfT5PFkbZQMJiPXVSavVI0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FJ8X1+72jdnI+iV2UUVKusJKWFBuoHbRHgcoNddmPIXwzuooArodku+WdBPUPlw2n
	 2WOUqNbkojZO3/1PVRx58JGunA0TTlfZgFv4+mDB7HeHukhvFJzZm2zqjWFskjnKyy
	 rxJHjZFKMQSiJHdGyGTmAzfw0OMDFa+MXgFQkBCGvpFNCUCZ2EPif1Y+kR/Kk6NjOj
	 XFKo1JE7btT2r0XkK0404CezGm0xcfSXBRFftHxg8ITV4xSqy7q25gYnSg5MJqMTed
	 0e8ecoXp+DjbepkWW7XuDbzPmVAbNfVLd5hc2+LwZYb2xbDSdMnWXNXjIskQEIHfb7
	 L4G2+bO1zjojQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860A860873;
	Mon, 23 Mar 2026 19:47:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFB2356
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFD68821ED
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4VUuZe0IyZA for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438BE821D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 438BE821D2
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80FC384BCC; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:55:59 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8bdf79c09846af6062621aea772e347c61f841f5
X-Git-Newrev: ea69fbb1ad84c7523417ff5f1e0a68545152e27a
X-Patchwork-Hint: ignore
Message-Id: <20260323194728.80FC384BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] boot/uboot: improve
 U-Boot OP-TEE TEE format options help text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea69fbb1ad84c7523417ff5f1e0a68545152e27a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

OP-TEE generates a few binaries that can be used by u-boot on some
platforms (Rockchip, Texas Instruments K3) using TEE variable.

Add a link to the OP-TEE documentation were we can find easily the
desciption for each TEE format that can be used by u-boot.

For convenience, copy tee.elf and tee.bin description in each option
choice help text.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a5f5c08dcd34452023cbf79ea30071828fb66c1a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/uboot/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 47ce24ee76..17b7f95f50 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -295,15 +295,23 @@ choice
 	  Since this version, the TEE in binary format must be used as
 	  it contains important meta-data.
 
+	  https://optee.readthedocs.io/en/4.9.0/architecture/porting_guidelines.html#binaries
+
 config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF
 	bool "tee.elf"
 	help
+	  The main OP-TEE ELF file. All other OP-TEE binaries are
+	  created with this as input.
+
 	  ELF format may be used only for OP-TEE versions before
 	  3.8.0.
 
 config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN
 	bool "tee.bin"
 	help
+	  The original OP-TEE binary with a header (v1) and combined
+	  init, paged, and unpaged parts.
+
 	  Binary format must be used for OP-TEE versions since 3.8.0.
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
