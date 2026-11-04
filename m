Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0AC606A842
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ly306+7G
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A070060834;
	Wed,  4 Nov 2026 22:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pr_w9kW1NWg5; Wed,  4 Nov 2026 22:33:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF58A6081E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793831579;
	b=J6H6QIGMvoqhjXoRTG9vfUQiFE5RkLlBr8SBMCEx9mQNQ3rCOAq0/YA75hyrk7q6LqC0
	 q9iLMvvM1wiqTm9CqgzEc4ococ2B2D/y8mJK7pi0IsJABmsRba/E0oRHP/9lkmOYwX9vY
	 o4dIV6wIrtrj9DcX9+zToluX7Rlqx77xpYXQYWSPOPtnmb0rzSeze/WMvRIRDVQgAqQTU
	 +Jj0ETCfYtG6DWSHG6vR/AIyr8L/jchKfEAEvq7KJ2VMKRXdRtPTwiCB9kZDDxjsrbmAQ
	 BmpHWqQAB48HhMmNPiB5Zju6LiAKNLiswn+iRIQcW6K6B9r9CMocWDE+3fBYJ0wgFGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793831579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xezsTaXszLd7BwdbyZcStGt3l8+k6cpMghDbU6sYxXY=;
	b=kONQUvSIwWGyDiz/U+MjNVczajklXCAcDpNQh0tcJS1HQJrIA5DHdu4D0iNY+5q8n+vE
	 KaFqvw07HK/St6NGMvIcNuQYjSTEJmwvh9REH1mNcOHOmUjqP/rzHdnIrDD8fWh38q06l
	 XopbjijivaK2Sdh2rZhMSSvkHiDw+K+tfzNTYmHgYSiblGprwMWab4Zsm7zIlP3cGAG1a
	 gwrGsU54shWW/wtX3KQ7uZ/JkjjqblL5SYIf47ckW+glMvDs6gZ2OFq2Fk/p2oq95b7WW
	 +rsX+GEX2RmG81n0/fgwMw3Iym3DvbAJurGU/7HAw/kI+MK0iYFP/oTkGKZU+5t+PJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793831579;
	bh=xezsTaXszLd7BwdbyZcStGt3l8+k6cpMghDbU6sYxXY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ly306+7GaZ1VTsIr2A6fQN3kkMJq9yqIEHu2G3I3wQh40J1aDQNzMeMBB/SYkrAvp
	 4zJlPv73KBrblrlsuYMwjKjyb4V1TvSz+PAefMzGKEJAGykQTLLTQIuP1W72Ss1/bi
	 Y5FID9mVJD0resE2fVEgaGLOzrKw//AQul8q1uncq76KD3Oz18aoyhCNyxBQqRB4rE
	 4V6VtyZBpJJdddRgV1ftMZF4YCTSd9oEDon6tm89hw2pMh170+4IlePTOdR/fgjodY
	 6zuPZgq+iCNgCIeKV3+gsmHZynWrgxtaBDiuHoriiPXQBWbNwnEsG3AW5OgbcLj8DM
	 OeLtCweJjTPhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF58A6081E;
	Wed,  4 Nov 2026 22:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F1AD3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75589811AA
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmKl3Xot3FBX for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:32:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDF2B81188
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF2B81188
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE3A19DEF6; Wed,  4 Nov 2026 22:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:30:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5536ea54c0cf3726efcb0e83fef846546fee9bba
X-Git-Newrev: 169eb3eeeafafb7dc5d98f5631a3ccedb17cbf0a
X-Patchwork-Hint: ignore
Message-Id: <20261104223126.DE3A19DEF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Jesse Van Gavere from
 qt6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/169eb3eeeafafb7dc5d98f5631a3ccedb17cbf0a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Jesse asked to be removed from the qt6 package, his only entry.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ce992a683..1f86c777c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1663,9 +1663,6 @@ N:	Jesse Taube <Mr.Bossman075@gmail.com>
 F:	board/freescale/imxrt1050evk/
 F:	configs/imxrt1050-evk_defconfig
 
-N:	Jesse Van Gavere <jesseevg@gmail.com>
-F:	package/qt6/
-
 N:	Jianhui Zhao <zhaojh329@gmail.com>
 F:	package/libuhttpd/
 F:	package/rtty/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
