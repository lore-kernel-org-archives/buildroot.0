Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A93D3B7F6
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 21:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0386140240;
	Tue,  9 Dec 2025 21:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkAdNazDfJ1H; Tue,  9 Dec 2025 21:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D0F40250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765314671;
	bh=RPG1ZkAZel71lbIz1nY6m5sgFvfw3Z7y7I7GV6NXO6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JjEQtu+C7z9JocsC349CrFfNJ8j7lZM1VLTlNPTxT26GfDY7jVB/5C+sbRBJKtZns
	 Ppw0HFgyXaPPDUoqpYr7528s30RKwOTeppkYJnt6BJ2Bf3H/w4raNfew5gaOxSQGVI
	 /pAl0ixF3kA1gtnKF2u7dOJw9XvxdmkCGxJQbKY3j0MH24fvd7EatK0sthN4Yh2vSJ
	 9QjQAo8HCmzfQrLgH1c8jcMl1bRDrhgO1Jx0P+jMQYByylnNT80Q3KiuUtrdVWKipu
	 oCVslyKuSQh6W4k3cFG/ifD2HD7pC4vBWbFppHYOtWVCZsSmMjtz4VsZcMxkzx+ctr
	 qCjVUq1PNcOlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27D0F40250;
	Tue,  9 Dec 2025 21:11:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7E2E2C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5500406DE
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7AgsTFc5LZe for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 21:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F00274020A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F00274020A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:11:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE6E0869A2; Tue,  9 Dec 2025 21:11:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 22:05:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eb1f160b7a08537fdfeb0800b9240a497f4237ac
X-Git-Newrev: 4f9600c2f97039b4ad6eb66087a7654805536a76
X-Patchwork-Hint: ignore
Message-Id: <20251209211108.DE6E0869A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libseccomp: bump to
 version 2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f9600c2f97039b4ad6eb66087a7654805536a76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://github.com/seccomp/libseccomp/blob/v2.6.0/CHANGELOG

This commit also enables LoongArch64 support,
added in upstream commit:
https://github.com/seccomp/libseccomp/commit/6966ec77b195ac289ae168c7c5646d59a307f33f

Signed-off-by: Preyas <preyas17@zohomail.in>
[Julien:
 - add link to change log
 - enable loongarch64 support
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libseccomp/Config.in       | 1 +
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index 7de91c07c5..18d4a76cb3 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_arm || BR2_armeb
+	default y if BR2_loongarch64
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index b80efd68f5..aaadc8424e 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.5
-sha256  248a2c8a4d9b9858aa6baf52712c34afefcf9c9e94b76dce02c1c9aa25fb3375  libseccomp-2.5.5.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.0 (PGP-signed checksum)
+sha256  83b6085232d1588c379dc9b9cae47bb37407cf262e6e74993c61ba72d2a784dc  libseccomp-2.6.0.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 10d57bb78c..26585b1887 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.5.5
+LIBSECCOMP_VERSION = 2.6.0
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
