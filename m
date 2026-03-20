Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D84FF483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C8B821CA;
	Mon, 23 Mar 2026 19:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5CKDdZBKt4G; Mon, 23 Mar 2026 19:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D2448219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295243;
	bh=qtH5ENrR8/kUpGM0ADQ6ZqJAP1i+kMqcxX0oVJ0WSvM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HhLP9JBIr2mf/QSB/QfjVkmhDF+sx9GVkgt+CcskN0P0GUB0xtDt0MwCn4peZ9uh/
	 7450U/EplxIHxOh82ZQpubtTaTfBDRxXUV33/JSnlFXXwsm0nAXB761ABd0SOGTRyH
	 57GxEG/T6ld8A9Etyx7MtlR2UKAoRUm+BZum9LhPJqlnRlGnQU5ArXq0rqWHFs/E9v
	 ChpGKXY9+TPA4H0PiJWCi41I1NzziGgFUVi+K7JD4IV7VmAE2/BGLqCv9tRQJVHL49
	 VDnejmcROplDSIqVpzGtX8VnxdR7FxVgMlgeTsIH1qWh1DjE9Yk5RPV23tWjTOq1Hd
	 +4MbC81Ef8kcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D2448219F;
	Mon, 23 Mar 2026 19:47:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7FEC353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B51E081A81
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0oWaBDYb7TZ for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7B6581546
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7B6581546
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A0D984C4A; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:51:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 60c8ad4b008b955570b6ce732ac2908efd1277d1
X-Git-Newrev: 863fafb6aafc9d7383f6fa1c7e3e39a3e609f018
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.0A0D984C4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/uboot: improve
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/863fafb6aafc9d7383f6fa1c7e3e39a3e609f018
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index e96753259e..ea587fff86 100644
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
