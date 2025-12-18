Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714A7D6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 458E56121B;
	Thu, 18 Dec 2025 16:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h__UFkyrH_Mh; Thu, 18 Dec 2025 16:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2753461209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075729;
	bh=E+wpsSMRRaIP/WPRfIrnAOROz/nal7jLXGeQsVvXpO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y0pXf1OBUTCVee5oEwvltiZFIwVnn5HVzt+JrN+2yWyFGJJw/ynklbZRV2YwrEkKl
	 uaDwO9q2tsLwadRWVxPQogLzxQ7r2mP0aK0BFQTbra5oGQ4SKdb0oap8n7fTXxEiuV
	 K9mIluFAb/BNHVuyeDhZfLpxgtHy+c6OgTGex8R3YUzsb8+0HO5+MPkwQphrWlxQTt
	 klkKXum/jS5Obp1GdhkrWjrtKOrFC1pESuf2hXAEWZRaFPfhqHogD9jMgtFQ/svxAg
	 yW/BK8TwYQQu4Zzw9OmTPw+JOJmj6G4reCYIWLmHY7qh0ewLXeRnNRko07F8MDxlvH
	 wBBWnAnVWj/SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2753461209;
	Thu, 18 Dec 2025 16:35:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F79B361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C3983DBA
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lm_3-TShnn2X for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD0E83DE4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FD0E83DE4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E78E8229C; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:01:49 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9d38383aefea46774faf59fcaae6f28d0c834a2c
X-Git-Newrev: e81d65de87f710d711fb204e2af4ac07d26feb20
X-Patchwork-Hint: ignore
Message-Id: <20251218163508.1E78E8229C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/grpc: remove
 BUILD_CSHARP_EXT option
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e81d65de87f710d711fb204e2af4ac07d26feb20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

the CSharp Extension was removed in grcp 1.47.0 [0] and the option in
the CMakeLists was dropped in 1.58.0 [1], which means that it is no
longer relevant since Buildroot commit
91d1207de0b3cda9b9722f7ca09131cde7c14bd9, which bumped grpc from
1.51.1 to 1.66.1.

So remove this option for host-grpc as well.

Fixes:
  CMake Warning:
    Manually-specified variables were not used by the project:

      gRPC_BUILD_CSHARP_EXT

[0] https://github.com/grpc/grpc/releases/tag/v1.47.0
[1] https://github.com/grpc/grpc/commit/3a2bd221ef1166ae7d7bba3f700ff92ce3df5e86

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e513d6a5fdf6b87eff10f759535ccc7abcef7a73)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/grpc/grpc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 39be4f583f..d8681f33ce 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -75,7 +75,6 @@ HOST_GRPC_CONF_OPTS = \
 	-DgRPC_SSL_PROVIDER=none \
 	-DgRPC_ZLIB_PROVIDER=none \
 	-DgRPC_BUILD_CODEGEN=OFF \
-	-DgRPC_BUILD_CSHARP_EXT=OFF \
 	-DgRPC_BUILD_PLUGIN_SUPPORT_ONLY=ON \
 	-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
