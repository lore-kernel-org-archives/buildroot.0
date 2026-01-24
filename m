Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8754D715E3
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 10:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA4080F71;
	Sat, 24 Jan 2026 10:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trHceBX_CikP; Sat, 24 Jan 2026 10:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6130580EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769251467;
	bh=WCxjvrVBtcmPliT7qRIXc9htdM/NCud0xTQeIz2CHBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s6RA9F8f10zEkl6T6QTRUU0qI46wqi+JjWU+39fQ6JHBnqnNqvGQ8GO8V4G92/C6v
	 PWrK/4ANir08XHinJS29VpQDIRZglfHmHyZvDZWerGY1iPL2IkOmjCmmZ994DKXU3r
	 8T0a7jZ8LjjKE8zM/Mkj4BZV7Et40VNLtToZz3eS6kxfU47m0rnxSv0FMTDN2FA+QX
	 LUowv+e0fVWdYHKf7slJL5orAyhsTFWtDKE8THsu2aEKxLgmrLBYkyQQQx9UxmyuWA
	 5gZ4M+ZaCWCtsoLF5OnVB/bkXX8tt4xW4qE13F3T/+G2RwFSvGkPQ6e0B9pNEuL3+R
	 i0ChWGKS9AIhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6130580EC1;
	Sat, 24 Jan 2026 10:44:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE69B358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 10:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCF98404DF
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 10:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xa1W0d-JA3J8 for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 10:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7CD440025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7CD440025
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 10:44:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFB9E87591; Sat, 24 Jan 2026 10:44:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Jan 2026 11:30:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5e191fad75ddd88a3a0468fb0fe02f3ef258beb
X-Git-Newrev: b64a2da6e028308d9b06e77d1d1471382f6f6bb7
X-Patchwork-Hint: ignore
Message-Id: <20260124104424.AFB9E87591@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{12,
 18}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=b64a2da6e028308d9b06e77d1d1471382f6f6bb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3a1852c7e9..6b6c745e08 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a3e621f38d..64f8411046 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  472497197b2f68d4dbf1bc32cc6dc669ca220ff4c0eb0dc39a9cff9a88f9a31b  linux-6.18.6.tar.xz
-sha256  ba3897a1c060b05a03cb4dda6f20d8c75e6f73c88b217744823a915056536eaf  linux-6.12.66.tar.xz
+sha256  b726a4d15cf9ae06219b56d87820776e34d89fbc137e55fb54a9b9c3015b8f1e  linux-6.18.7.tar.xz
+sha256  16805dc62e1fa5ef8a3f466f3f44a2efb171b5206d6840ced4ba5475cf12c432  linux-6.12.67.tar.xz
 sha256  76af9d4fce24cc5a1c9f1fcbba2e23c4e87bbc8e20525b1691206801f24d14ba  linux-6.6.121.tar.xz
 sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dcf5d46505..4727ba2048 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -460,8 +460,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.198"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.121"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.66"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.6"	if BR2_KERNEL_HEADERS_6_18
+	default "6.12.67"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.7"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
