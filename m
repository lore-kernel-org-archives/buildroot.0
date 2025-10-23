Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34811CCD1BF
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04D0684A0D;
	Thu, 23 Oct 2025 20:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAjBMGiE4sra; Thu, 23 Oct 2025 20:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 198E284A20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 198E284A20;
	Thu, 23 Oct 2025 20:01:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C802A43F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD0E761B99
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbaDhi3mWK1A for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 20:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 437DF61B8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 437DF61B8F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E878877A8; Thu, 23 Oct 2025 20:01:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 22:00:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cf55b4e4917363f13b541e8ab873b7bbc4b03dd
X-Git-Newrev: 6144b0f4b73bea810809f09d23bbe76b4979bc13
X-Patchwork-Hint: ignore
Message-Id: <20251023200146.3E878877A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tss: ignore CVE-2023-22745
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

commit: https://git.buildroot.net/buildroot/commit/?id=6144b0f4b73bea810809f09d23bbe76b4979bc13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tpm2-tss/tpm2-tss.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index e1f65c384d..81a1a0e59b 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -16,6 +16,10 @@ TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
 # 0001-configure-Only-use-CXX-when-fuzzing.patch
 TPM2_TSS_AUTORECONF = YES
 
+# Fixed in upstream commit
+# https://github.com/tpm2-software/tpm2-tss/commit/7ab42953216adec046d000a5e3085f3ee5e9cabf
+TPM2_TSS_IGNORE_CVES += CVE-2023-22745
+
 # systemd-sysusers and systemd-tmpfiles are only used at install time
 # to trigger the creation of users and tmpfiles, which we do not care
 # about at build time. groupadd, useradd, and setfacl are used in the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
