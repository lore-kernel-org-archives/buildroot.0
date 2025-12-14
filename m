Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3887BD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629FB60D99;
	Sun, 14 Dec 2025 17:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ne2nVFEWxjOH; Sun, 14 Dec 2025 17:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A11A760D8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765731849;
	bh=csNmKyfXk9B7b+2bA4iVeYziqmOnbk3rFnl5BnAnXyc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jknhq2zmEhZfZyA35BlD34tifLWPn2qSyDDjAwtADSdWnX9zEcj0PJZks1iPKRfCW
	 eEJDPdmhnR0fibre/JaoyYtgaSoez6lfeqJ1kWrlNZaO7vDZN6xPafyqtsIblw2ohi
	 hBUuc0r8ygijNEiiStHvkRYvuWWMbuc76C5sq8I7v9+qb370Jq8kSx2Glm9XK9zwG4
	 ZTxl50Xled2H4fPYznIjZD0QvRIDC26gwq/rpigNhs3uZHtMmdeUyDxeFeZhqnZAEZ
	 IFxoBjeHS3M6Bbuy3tw/rI9okv8AoUxFsyvIjW4uQkqJzaSmq4XGFA8beK33ky4C8B
	 jjqXJ7SNfffTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11A760D8C;
	Sun, 14 Dec 2025 17:04:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C4C42C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D2F3813A4
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VF23Sy88eKWb for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD448101D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD448101D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8943F86E66; Sun, 14 Dec 2025 17:04:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:03:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6567407ff163dfd7ab2ffe40e1576dea8c16581
X-Git-Newrev: e513d6a5fdf6b87eff10f759535ccc7abcef7a73
X-Patchwork-Hint: ignore
Message-Id: <20251214170406.8943F86E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: remove BUILD_CSHARP_EXT
 option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e513d6a5fdf6b87eff10f759535ccc7abcef7a73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
