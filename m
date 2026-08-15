Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F5EC5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71F47405E7;
	Sat, 15 Aug 2026 14:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEtvzPKefzaV; Sat, 15 Aug 2026 14:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1339407A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786805268;
	bh=xs/+t3KzZXS+HY5TUgweNQjRdz/9mbJb7IyrmkyFvB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PbDA13kEH8iC1rZdnOVTDh/+ZXpdqVHfkQvxgla/z/qyegSJb7tYJhC9sDQ1kczU6
	 uI7CP4xiVZj5jdqfBqKayJZsHFWgZfGN2wzNd2D5L9OHFNSTwZ6TaEt8rTP1HFYZad
	 zB9ETrqR6spWns0ZJ4oZGwS3jQQInB50Is/Rsl9MUWrKA2VLa63+sS5aRZlFeC0SSN
	 lm7tL42SW1aMMw8UJM2wtXXk4NIMxei2VjOyxyXpsOhOChw190+MmrtatZ4N5obj9t
	 fts0w/tQDbAe+S+RFSpUxaIgdSt6bKqhE+njC9jJi4S1GPFZmggJkwGEqmUF+FvT+F
	 tB/DRfLGvMQLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1339407A0;
	Sat, 15 Aug 2026 14:47:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F35171393
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F12D060661
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKAFz4x5zEaQ for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0C46065F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA0C46065F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A6FA8D5FC; Sat, 15 Aug 2026 14:46:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 16:41:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7cf802aceba9ee2bd3064230f1bcbc86a58f926
X-Git-Newrev: e43fb3491a52d2df14fae4873b170799125200a7
X-Patchwork-Hint: ignore
Message-Id: <20260815144654.2A6FA8D5FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: fix CPE
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e43fb3491a52d2df14fae4873b170799125200a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
