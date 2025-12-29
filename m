Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57C8E92FD7
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC89B407C2;
	Mon, 29 Dec 2025 21:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsXiMiPzZyKX; Mon, 29 Dec 2025 21:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B40A40759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767045492;
	bh=QC/Fwkr9ojsA2+tFyVzMPK4zYo2faFwvaPOSa1823pM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SIU3zmebF/cfrVlZVuy2KdBCw533dYkz5hjEnw316q+R7ptQIAyTdK7PPKy6y8P4h
	 xcxopyJNJ6L2C3eb3p+gsn51QXfCHqEQhsOg9tYCLlaQui20sqe3bW5KR6uxPMyH8u
	 EreTtNukMc5NCXR1c3AMXUWkNNY2vGIJSiLBa4WhNw0tNOtxZswtjghVg8Or1ogfU4
	 GJimDUXJu7mjaoG3jP68igw3qhEViGb9AnDts5uWGStHs/VaZ129Nuo1WjbCWi9tFb
	 YwaPy168tHhphGd7zpdLf/q52uRCRAyP1D4pf9iEWsWv4OyjqBRb9PEM+ObV6/OiOi
	 +z/HLFmA+GUgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B40A40759;
	Mon, 29 Dec 2025 21:58:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFE60D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B688C4005B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWRwpVGltz2M for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 037BD4002C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 037BD4002C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:58:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5EEC87A25; Mon, 29 Dec 2025 21:58:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:37:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a315e153f120ff236f1dd63d9e097e169918c23
X-Git-Newrev: fdee48e3c7a0b94a17e236154d9173885bc0d374
X-Patchwork-Hint: ignore
Message-Id: <20251229215809.E5EEC87A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmrig: bump version to 6.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdee48e3c7a0b94a17e236154d9173885bc0d374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/xmrig/xmrig/blob/v6.25.0/CHANGELOG.md

Added armv8 and riscv64 (riscv32 is broken) as supported archs.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xmrig/Config.in  | 2 ++
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
index 0b5f5370e4..273678a88f 100644
--- a/package/xmrig/Config.in
+++ b/package/xmrig/Config.in
@@ -2,7 +2,9 @@
 config BR2_PACKAGE_XMRIG_ARCH_SUPPORTS
 	bool
 	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_ARM_CPU_ARMV8A
 	default y if BR2_aarch64
+	default y if BR2_RISCV_64
 	default y if BR2_x86_64
 	default y if BR2_i386
 
diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 89c8fa1c11..5aa1630b14 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3521c592a18ada781d79c919ea6c1b7e5a8bcfe2ec666789bc55fd88a2aee8d3  xmrig-6.24.0.tar.gz
+sha256  55e415792f2a4ef2430cb26829b0b7d96fc52f51c6274831e9fe76b8aef28593  xmrig-6.25.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 860af71f75..bfd2a98e12 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.24.0
+XMRIG_VERSION = 6.25.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
