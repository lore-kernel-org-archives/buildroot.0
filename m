Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10D3C35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 22:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DA8E6100E;
	Wed, 19 Mar 2025 22:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBgFjSU0CRmz; Wed, 19 Mar 2025 22:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E4AA61013
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4AA61013;
	Wed, 19 Mar 2025 22:43:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9510416E
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 22:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FBB880C7E
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 22:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihL4XZKd4lcU for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 22:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 561B0804CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561B0804CA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 561B0804CA
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 22:43:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 42ACEB0051E;
 Wed, 19 Mar 2025 23:43:31 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br015@umbiko.net>,
	Julien Olivain <ju.o@free.fr>
Date: Wed, 19 Mar 2025 23:43:16 +0100
Message-ID: <20250319224316.4185405-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742424213;
 bh=lgOBVgwggVTR60Z9cLurAoa1pGptbwsmrZKmxDkhs2A=;
 h=From:To:Cc:Subject:Date:From;
 b=Zve1ZK0wywPTyImd5VBvb4hrQXOfTJGaM2B9NUK3jRLOlvB6qb/3oKn2/IFvtCAWe
 E5DP1efrsuBXE+WBgRblym15L/4r/9STHy/ZMn3Qh8egyNjcSDMwqxn+Bbbh4olu1V
 T28vEtvOHDcrKcAqeR6Jfk6OZd+jU3JnnAYQGav1xnjx4rIsR/U4pHx48U3o4nl/nr
 lta0CpDCEGU8uv+7v0gqxCrE15UFy1ErWVITB44i88Q/7PCaC3kslFIaRbi5PcCTcS
 UP9nBaNd4HIy4TYHdgzeCycUOhqeQuKFNeNYljWvWSSk5GMnGfeMououw3bem+IBkc
 0VAr/iUCBgLbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zve1ZK0w
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix Config.in symbol typo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] introduced a typo in the Config.in symbol
BR2_HOST_GCC_AT_LEAST_10. This generates check-symbol failures
such as [2].

This commit fixes the issue by fixing the typo.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/25af5a3b3aa3480ee10158e55c280d675430442a
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/9464458162

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 6bf745b30b..7ce0d8b7eb 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -439,5 +439,5 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, host-gcc 10, gcc 12, head
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_12 || \
-		!BR2_THOST_GCC_AT_LEAST_10 || \
+		!BR2_HOST_GCC_AT_LEAST_10 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
