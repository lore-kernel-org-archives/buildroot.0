Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92908C5DF95
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C68381DEC;
	Fri, 21 Aug 2026 15:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwnztW6p9LkV; Fri, 21 Aug 2026 15:12:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325125;
	bh=/sC3gz/xDw4f44fEe09DJB/gXI+3maMgDP8QgZZVjYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K8mibINBlCalO8eS4mJSESpNG8hDSPArzparE2MzEyhNN/cxOmrTOB0FTU1C8vRzU
	 IBJazfsxCVEasFTQ8+zyQK4Tyo/d28UXCCjtXGC6lZgIeKO1HR3N9E+vueyIoPL+SR
	 PrnBTaMEINiph0cs1GQaFq1h8NKZ84stf2KQfwHHm+S3M1/wokUTsWd81QRrE2HV9O
	 h5msG48R4JUg+wW0Mk0coVRA57VOhBM6xFuXnCixEX2gnlNpUL4skGbBc69Xu8SITz
	 2Y0eu/YF85SYPOjY5qI6HMYlaE/NWRytf1gpo4+3MtcmN/AnmFxPRWPPMMe/1P9Y6q
	 LBTccqVVNAadA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4967C81C19;
	Fri, 21 Aug 2026 15:12:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E94F81F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD7A281154
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIJJZ0sJ5qt2 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26A7681140
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78A608E17F; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:20:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e38702fc5796a0dd09c2c37c9752886b2c00889d
X-Git-Newrev: 59df6105d0268fb491b44c6fe99d31252e930561
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.78A608E17F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] boot/optee-os: fix CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59df6105d0268fb491b44c6fe99d31252e930561
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
