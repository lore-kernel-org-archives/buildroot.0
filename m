Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFF4D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C8183E18;
	Fri, 12 Dec 2025 07:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HiNpqQik-EgC; Fri, 12 Dec 2025 07:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5049183D53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526228;
	bh=bjv9/pf8STviDfqZ97NoZT0GCnruOE1SIwmWdJr/dmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VJZ7AoPPXDrVxcEUiAbfcRMaCE/PdhRbJ0Oml3Sdf9cmVT/YKjGU9N7/aQ1/Ianh2
	 bjxBoIWnqbpgoj5JWr38vRloAOfHJyQw3aXK4nHxSCBLijnBpfh14/v3pGwGm7LGPf
	 kG28DeQXKqZD4DPPUaq9XI28Ipdzgsjna9mYtxQW0Q/wtjwf6Ukl197QEfGT0+qSzw
	 taOkLZTG+g6/oiI5qZoq/+Z52i0lU14fmw2Hhump0EyzzaDfZ/BIljh/j4NnVSh9ak
	 /xPBbNEqa7o0YYWiEdkadxfFjqid/0+82eTFv6+deajHXNOFrFpDe3vGGSaqgherCM
	 x7CbZWORd4h+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5049183D53;
	Fri, 12 Dec 2025 07:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAE3C2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63FF24113B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zW6LQOX9fyLk for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEC1041141
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEC1041141
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDBA586C94; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 17:51:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9e7472d6c8a6220bff9ce51f3188158ba930e7e
X-Git-Newrev: 86b0fb67ea9a98d032e1e16ef49e6d280fe604e5
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.DDBA586C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: bump to version 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=86b0fb67ea9a98d032e1e16ef49e6d280fe604e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
 * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.0
 * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.1

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 1160f3f2bb..a610b17140 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  6025e5dc6cddd532ff960d14e68ced5f42a1916b23a73fea6bcb437f06992eaf  sdbus-cpp-2.1.0.tar.gz
+sha256  da69a0104beb6e51415a59f1571a47beb1eacc65cc6027b250eb1cf13ff4f802  sdbus-cpp-2.2.1.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index a01bcd22c6..abe12c05b9 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 2.1.0
+SDBUS_CPP_VERSION = 2.2.1
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
