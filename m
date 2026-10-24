Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04302606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jTBS0FeO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE5578175E;
	Sat, 24 Oct 2026 15:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxWi1kxgaz_A; Sat, 24 Oct 2026 15:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C0485819F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854073;
	b=m6LeptqNbczAPxIUEU7DHu4XewnsvKVjdtwvdacPOlTR4X3XGI/fy4YWMoWcZjmHW35E
	 V1C5af3jht0u+5pDyl4pY1je4oNZdLUUGcqEQ282WSV5ZfDH/CVYGJmQ54HCd5lyr5kS5
	 Ntp8XIG1O1y92CHPPF84UIcaHh/yjZmMmvYBXoltGCqv/SXLPyQB4Rj9efhCFYt3FTH/x
	 f8HsPZRmqqe8TFZsMmA6J/9EU6e/DgmJ5GWYfYxXlyNouoLgjEtKyIQ5FeCAtGbqMrkTz
	 uZS1/wuqoQRF+v52z3CkuEmGCKxMayr8UtrrMo0m2JG5yMLroISMF1ZjQOSYKGrR7hw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dPYhezdVqUkwSJKTfiq6Uw+E5kEFTK7BKbMiNsY8re8=;
	b=jdAI0sY4gdMIG5iq6XbuGbTftnbUCvI+KmQMdn/t9ygvgQ+6B/cG++NtCQ/ZL16b2g4e
	 EpK03v2fITiHchHKPrPxdSlXIc2K6yp9NNvxkKU+MrYlaDzzN71rn/1poikjdsPKquwHD
	 41z3C41HGgXthImfmLir8WJ6mUAgHNYV5bGcxBpAtC5JaiRtGaacYYIjnbVixyibB4ZI8
	 5FHlfmTy4v7c380HUDAvuMnQA+zjQGcyddY0QGckok3hcCHWOEWDIYy4//8zvOvg+5AgJ
	 0AhAr07qeheNeGXsswvRyXjcCmajXuDR8dDcnWSmDs+mIvXmyVO9GMQcHqADkEhh75w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854073;
	bh=dPYhezdVqUkwSJKTfiq6Uw+E5kEFTK7BKbMiNsY8re8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jTBS0FeONUbNny7KG0v9VXRGmLNyaZI8S3sgW2tkWENN2FXrtCG7xN2ANDRyBIqQe
	 yOvqp9aNBy1nvOi5CqMzZa1y4gubzu9fFwbYi4uecEsNj6telh+xk79prp7G/yZhtD
	 ePdiJfLIwMRj3VJT02/epvRYzElR3gfBV/U1NPsxEhgAUqtRkoTVSuMpvtkzbnbBj+
	 cfZYy3Bj6l5dOurRnsWNDQ9lSQT9VQyckE/0rSojjcPypMPQHgCJUIJWrOnsld0qs8
	 EJxa8h4EwaehdD4FkBzfsPhigDwcAiIJe98pRXWJxLI66ZFJKkcDy1xWHP2p1qEBPd
	 o1SzuXM9F8Csg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0485819F5;
	Sat, 24 Oct 2026 15:01:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F16533AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF750409E7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpoE1ACrFP3B for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CF60640A16
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=myfu80lxA3i5MI+f65wvb8iPAPhe0TfqZBLv4x2mztn2UE1enzlkmWwfX6DYxlKk8pgP
 npJHd5CXPSSKPTUcElXfWYWn6cB7xSx0pO5EnxhAzmeoi/YvdE8N4sfGMWy1JcVgpsNtw
 bDp8KzpQPWCIE0VPg30BKEF8or90TNO3lCt97Yr0jdpl9vZExPnl7YvzsLYYbE2jDL22F
 jifKuFi7OMZBPkyNwmyWb4Fq6PFbTad9MmxNZCNRsqrB3cqo7Ycz6O0AbpyUhSD+gTarh
 QaJsMfTe79UrZ60ANQfArBiQms7dcr2TKZxKxtGIXOspBt9G2f0/Io6cRpJimR+qyQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=51MjeZPSDmwHAqMwI7tgAQaLyctzvvTpi7t+zyID8kA=;
 b=rZnd1884iFKR8Xsat8fAGR1FSRWPIX8ehI6DzPpAQhi0sRCof4wOkDk/TAK1gRmPL6Q5
 Um2xSGDuEIKNE7cBt1ePbn0XV0BsfNuTrBf/en0w9DXTq8z6BfpBrwJGNmY87d63C2cyI
 S/PcSPyKQrK3OwZpf83rvGUmwoJ3eljQWk7tVTV9bKcKLA54lPocftFU+OUfFQGRl678o
 XAq1lLbui7WN+tZYuKRFM97E9uIkXRKSulI1z9/tfqmqI3kSLMw722Al9oV2quMTTcDzk
 RqjZvLMEY42fWSzi/vL2gxQ5ptnUVibjmmq+GZvhKPgtsg3wLwfNayjT/QUl8ZYTqyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF60640A16
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3A4A9C84A; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea249a45e3cb3c26f9f3f3cdcee2b51510b9f5cc
X-Git-Newrev: b6684c8f9bd21a6dcb951d26617564014a9d7c9d
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.D3A4A9C84A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rich: add host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6684c8f9bd21a6dcb951d26617564014a9d7c9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-typer and include its markdown-it-py
and pygments runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-rich/python-rich.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
index cb98d0ff3e..61582a55e8 100644
--- a/package/python-rich/python-rich.mk
+++ b/package/python-rich/python-rich.mk
@@ -10,5 +10,7 @@ PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c
 PYTHON_RICH_SETUP_TYPE = poetry
 PYTHON_RICH_LICENSE = MIT
 PYTHON_RICH_LICENSE_FILES = LICENSE
+HOST_PYTHON_RICH_DEPENDENCIES = host-python-markdown-it-py host-python-pygments
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
