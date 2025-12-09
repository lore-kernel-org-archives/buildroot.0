Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0540FD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 08:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F9882BF5;
	Fri, 12 Dec 2025 08:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbtU_ERVnADT; Fri, 12 Dec 2025 07:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBC4B843ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526376;
	bh=cz8kD6gJKuYBWEPi9WZMy4XpWyuftwOS1aB5F/r8GwQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TEhO8TwC/8cDxtL0LVbu3BQZxmyYp+yL4TzQcZI/6z++jzqVkXKTPABy9AGjwpDBH
	 lcfdBmoZseh1DkvnRFKBkWZXkDOUuf5AksPVPiJdRS2boRW5JqDCZbOk8WXB6/7qU/
	 GDRjN/kH0gcRlnAAMbFNIIymOpuv2pfWeH1zYKgVEmwtmjjOBZOa0CwC7kAQwVY6O7
	 vHf2y/iFJS/8z/5jeUF8p7qtMBiOMC8Phmrx8ap0UXjieMkkWORkAzst++/1eN0jQA
	 /5B6WEoTrEDXW2X0wvt4UAZigFmMV3TvKyjHo4AGI/r0WlJbCQnSlb3ZaywU/7xTpJ
	 rW0yGtD6amy7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBC4B843ED;
	Fri, 12 Dec 2025 07:59:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C692C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37D6841182
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDP97KjWSN3y for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C7B4112A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33C7B4112A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32CC7807F9; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 22:05:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb1f160b7a08537fdfeb0800b9240a497f4237ac
X-Git-Newrev: 4f9600c2f97039b4ad6eb66087a7654805536a76
X-Patchwork-Hint: ignore
Message-Id: <20251212075539.32CC7807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libseccomp: bump to version 2.6.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
