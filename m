Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08339C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD558137D;
	Fri, 21 Aug 2026 15:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAuGxmJbxX1Y; Fri, 21 Aug 2026 15:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324888;
	bh=4ACrMzGqO3TimJo3AQ/W6MSrXYwnVwdrez2tHnoVoos=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aLjc0VY2jsjjTNq3G/h6GvBcdm199DOpLWxw/UuSfXpll4AGRd0J5ngUcoI2uAbW1
	 mVQxslg2TEXqNpT3WqBFGJAdQnJjV6AdMmYdI7u2ewYpywJuW0iokNj4PltVPzmt33
	 jn/Hhl4DYlcDt80ehT5BmnWYepm5lMSZEvr1U4788Xbzn86E2YRP2TiGM8apbYYa6P
	 c+HNcLjrBNt/is93C4AWMZa/BaqhMPCcoRvsQzVUjj9jwjH3PIVCJLDoSyMRWHN1fe
	 x7P+Zyb2dZnO+HPuj7fD3jRwALfPcdZrSyDJjp5U51pV3e0hHhz5DCb8/p+fgEJAZQ
	 YfzENu5VR7zAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EADF18136F;
	Fri, 21 Aug 2026 15:08:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C215EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F211740026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAo_ecDGzJ_H for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76B7A40417
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB1978E150; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a0ebb8483fbebb47ef576c77c1cf8e70e7372697
X-Git-Newrev: 7948f1794fc1fb4fd90002e66fe59e74f0f2d4f0
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.EB1978E150@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/optee-os: fix CPE
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7948f1794fc1fb4fd90002e66fe59e74f0f2d4f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

A new (and hopefully definitive) CPE is to be used for OP-TEE OS:

cpe:2.3:o:trustedfirmware:op-tee:

as reported during review for a TF-A CPE fix[1]. NVD correctly
reports[2] the new CPE deprecates the "old" one Buildroot was using.

CVEs for projects under the TrustedFirmware umbrella are now seemingly
handled under the CPE vendor "trustedfirmware".

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/49486/comment/2fd93ed7_df27998e/ before last comment from Sandrine
[2] https://nvd.nist.gov/products/cpe/detail/EB42962B-24FD-4716-B3E2-69F3258A57CF
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e43fb3491a52d2df14fae4873b170799125200a7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 boot/optee-os/optee-os.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 1639597407..38faf8bff7 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -9,7 +9,7 @@ OPTEE_OS_LICENSE = BSD-2-Clause
 OPTEE_OS_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_LICENSE_FILES))
 
 OPTEE_OS_CPE_ID_PREFIX = cpe:2.3:o
-OPTEE_OS_CPE_ID_VENDOR = linaro
+OPTEE_OS_CPE_ID_VENDOR = trustedfirmware
 OPTEE_OS_CPE_ID_PRODUCT = op-tee
 
 OPTEE_OS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
