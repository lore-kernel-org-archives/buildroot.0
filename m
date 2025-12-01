Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66450D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32F5D8276E;
	Fri, 12 Dec 2025 07:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XicxrTOkmh5; Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C010282323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526147;
	bh=N5gX3PXl8RD8OArDvIMnVGRNlnNQ3sssjvSFdMiR3iA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E3uAoZvru/GysN8V5TCYGRDFExuhg60QHRFR2NbhmL2eZPoUXgduuYkcuasAhHSHF
	 VtB5oTVeZx81aW/F5w2NUAEayUI8RIAXsgA8gMsTKMR+sJpNjYSxuz+g1yQa4D0T+O
	 E8VXXL9PtJRsqHIkz2LQcYlfLpRy4A7AfLAvjnziw/ZMA278jbCFF2wsd/S5PUX27B
	 LaJRqlsBKuoZ3qpPh/R7z6NBTKsd1pORUHH8XrLLxa9ZVGcbzR1QAwwgM0FsCN1yco
	 ONWdcC4/aZzZ5w2o/dLe8mm2d6zDkFdt7StPF1nM902yMfYvrLKpBaVVVhwkxYc2gE
	 m5UvB9wX23rFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C010282323;
	Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFC832C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1B7F404CD
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_loV0Bh9eaa for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82BB3402A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82BB3402A8
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73E9E86CA5; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Dec 2025 21:20:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6caa5c7bfb2c0f8613e879a07a7ce358c7542f7e
X-Git-Newrev: a0c0ca5de7e96a8f7ab4b9f1759e7d34e2e12cf6
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.73E9E86CA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-fm-ucode: bump version to
 lf-6.12.34-2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0c0ca5de7e96a8f7ab4b9f1759e7d34e2e12cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index fb5fdac9a6..1f6bd01b64 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12894dd52239e98b00bdd0a4e30b57d7bf6c37becf2a5db4a2e7d0074435d072  qoriq-fm-ucode-lf-6.12.20-2.0.0.tar.gz
+sha256  a3ee2bd375c90de1249ff49e6185874583edd92aa2e2bfb4ccf25b7d8a563205  qoriq-fm-ucode-lf-6.12.34-2.1.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index fe71c283ea..3c197346ca 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.12.20-2.0.0
+QORIQ_FM_UCODE_VERSION = lf-6.12.34-2.1.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
