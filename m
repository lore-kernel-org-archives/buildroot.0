Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA70D2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 21:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D43B608DF;
	Thu,  4 Dec 2025 21:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crUV60T-E_RX; Thu,  4 Dec 2025 21:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52B460876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764883146;
	bh=NlzRCVIQDGyqA1Yj7e293TDh7mqw/OcU9ncgs0hyqsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LvXcalKk/UufTdRkoW9/tUeMkgXiPpXCtn1aNzNDvqDqo5TotLuqVz66y02Dkgz0D
	 q3+ahoS2qt8vXcxAXWWV5hCCoxV31qjBMlF5kpkhZ/8ockdAwyFu/YWR0a0jKs18yZ
	 1VaqMjYR1OAu1ykR9CI/dQghqIUv8Ov+mYCcxkHXTbcYcATQ+5IAhNaZkusFvewho6
	 J0BLXTQF3ieFhmMc4o7+53J0IWIfNQgoIZbMUSRoer/n2sL+UJVU57u0KdukA/N34q
	 QVq0yqNhykscOdoueovek17evCiIBMlbwo7wjmosTMFzhw+Olsz1XvQDPSz66+kYMu
	 0PJZ0In+Kh6rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D52B460876;
	Thu,  4 Dec 2025 21:19:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 853FE1A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82679608A6
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjsa3bGDvjJf for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 21:19:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D516D60876
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D516D60876
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:19:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C57108653E; Thu,  4 Dec 2025 21:19:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 21:47:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7437415a56fdb054b77b5a7f1944d9728aaf75d
X-Git-Newrev: 150bb46a0483736aebf44b6026ffa621049c01ad
X-Patchwork-Hint: ignore
Message-Id: <20251204211904.C57108653E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/llama-cpp: bump
 version to b7271
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

commit: https://git.buildroot.net/buildroot/commit/?id=150bb46a0483736aebf44b6026ffa621049c01ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://github.com/ggml-org/llama.cpp/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llama-cpp/llama-cpp.hash | 2 +-
 package/llama-cpp/llama-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
index 81ddf4508f..765025f180 100644
--- a/package/llama-cpp/llama-cpp.hash
+++ b/package/llama-cpp/llama-cpp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c108fadd61d34da6ff2cfdf085821ff03a45acde2245d9eeeba9358482b305c3  b6865.tar.gz
+sha256  b2c4c89b6282c4ddc7c9c00c79af77d84811b6092aa47838a194e8a2981fa104  b7271.tar.gz
 # License
 sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
index 7554d80a1e..5112022656 100644
--- a/package/llama-cpp/llama-cpp.mk
+++ b/package/llama-cpp/llama-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLAMA_CPP_VERSION = b6865
+LLAMA_CPP_VERSION = b7271
 LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
 LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
 LLAMA_CPP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
