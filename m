Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49E3CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CD1851BA;
	Sat, 30 May 2026 08:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esEfuLXXfnOc; Sat, 30 May 2026 08:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D1A2851B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130040;
	bh=vcOgdyko6iPFRDDtVepEcisHo/qEBReY7DavGay9iSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gw6SdG6cFrer5XrafDNVrVuWZsdR/yeAA/dZM6u/ucI3WDfaXuZvO0X5rNY//zvNi
	 awtYhlvtjCsslgbikfyxsb7zTwCLJGfTY27OhCPIhp78MPvcVPUbJqF5RBGf7gyNje
	 3ncrWjv+OmQuD3FGy5DBnza7OGI1VWQSyWEEyXRDpKzpQV291c0vQiKiguMkmtXO4q
	 99lHbGjq4MK4gt84YALk/YE/fG8ZGj7KVJzmlFbnjmVVFjKUTrtrkcwsU9kH/3G2cF
	 v3GIl24EDBQAG+LFLz71z5J12PzFGkLnor7BMQ3k3BC2B4x/ZX9UEWlTkXIaMVGdl9
	 TeMGZY82pEQPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D1A2851B2;
	Sat, 30 May 2026 08:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6BED3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1921D61CD2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id El7H27C69ZbS for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E98F61C91
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E98F61C91
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:33:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 297638642A; Sat, 30 May 2026 08:33:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:19:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: abcaada9fd31abf697253d37e645485cd220cadb
X-Git-Newrev: 87aa6af2411b4623d8c01f2259091f1917ee9ae4
X-Patchwork-Hint: ignore
Message-Id: <20260530083345.297638642A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdbus-cpp: bump to
 version 2.3.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87aa6af2411b4623d8c01f2259091f1917ee9ae4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog:
 * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.0

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index a610b17140..db1c5d5fee 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  da69a0104beb6e51415a59f1571a47beb1eacc65cc6027b250eb1cf13ff4f802  sdbus-cpp-2.2.1.tar.gz
+sha256  8c01d28fa7b1a973d7a9cfdfd65480e733a52172506eaa1fea225b681590fe3c  sdbus-cpp-2.3.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index abe12c05b9..d8743c66b3 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 2.2.1
+SDBUS_CPP_VERSION = 2.3.0
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
