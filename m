Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0DAD6E2B2
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A20611E6;
	Thu, 18 Dec 2025 16:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePe-KU-NqkLT; Thu, 18 Dec 2025 16:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A8EB611E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076253;
	bh=mdmTsJJUoXlZ5B8z62KwyARRbEnnzJLsM3EYOcfp0vM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qPm3jaGAzRzi1BIPsL8ahO0zeakAM5DK3N3IUcma3q73M5ods3nMxVrEY0Fv/iJLR
	 5vkxVKWWRF1T+sA/8sPVnavq6ypowHlQRaQOnc4e8hjx1mUJaeEbvZsw+xii0WsS65
	 NeCtnGd4IAZjq6Ch1BnJ5EVoHy/ulDv/8fgr+tWLeM+uKV+cUpy6HJ5Y48HOr8nDvC
	 S100f8WCEYW+5OjemXIGfaMOKX0KgHK8JdoOXeYP+HZYZHpKjgmJkWfaXn9PU+U9rK
	 pWyurvnUBPnVppamve6YHQzS1twfT9Z0wKFLyooFYQMCXb1rBb03MaYU5gQYxeOkMR
	 lv56bS682qKTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A8EB611E8;
	Thu, 18 Dec 2025 16:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 031C21A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD6164105D
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4ljQc2n4nPx for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE29E41090
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE29E41090
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC368873D5; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:01:51 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6425628a87527f99a73d0e1b892b5553b8bd9c1d
X-Git-Newrev: 6aad76c4c4f00e11471444a1eff40ded7f42fb07
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.DC368873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/grpc: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=6aad76c4c4f00e11471444a1eff40ded7f42fb07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
