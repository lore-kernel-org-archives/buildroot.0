Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B207FCD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 11:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE2C60F29;
	Fri, 15 May 2026 11:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsitmnCQhRYX; Fri, 15 May 2026 11:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF6B61547
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778846219;
	bh=Zdtd4ELkM/mDh/W7ZbmLf9WBgeqYO+Ib4azKpP7+XCU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JukKS7pIdrw76p5nF2eMxWqFZf6/f1mcHRwF0Xuv3PP5U9fPTtHiY12N9FaqOrL9j
	 DZgUhLAzKVIMbR4V6PKc3A4lKEAHl9YuF1pSmOpgvmnukXSo3e2ybPhGc8ORucwGs2
	 qUtzbXs8fLp+XbWt7mUghUOTZaBJHw1ziB0vpDZr3DOrab0kZBfvU+5VgffCCHLNVl
	 rRRiJfedkqV3ex9tm9e15aHfZXpBM+zj6ePSOXGBN08J/yjgP7VoInkcgVH5BpNBH+
	 VjyjF4SwWJqzFLlwCoKL2W/D+ribWQa1iCLbmppHLhd2Vev/Ygnz0ntFfUnss1n18a
	 6IwJNXhbmWyvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF6B61547;
	Fri, 15 May 2026 11:56:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C21042B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 397F1841F8
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wi452NgXtjA8 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 11:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 871B3841F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 871B3841F7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D405F86327; Fri, 15 May 2026 11:56:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:21:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4dd918fab690037739d49c5f2ea2c5ebd8e7b82a
X-Git-Newrev: 2195c46d2d10c4254d328cd791f2455c08791ab2
X-Patchwork-Hint: ignore
Message-Id: <20260515115650.D405F86327@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add package/mesa3d
 for Joseph Kogut
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2195c46d2d10c4254d328cd791f2455c08791ab2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add mesa3d package to the list of files I maintain.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d849fa828a..25a047cb3e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1754,6 +1754,7 @@ F:	package/llama-cpp/
 F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
+F:	package/mesa3d/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
