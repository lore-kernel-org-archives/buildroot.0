Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6A606A322
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PRb/9EPd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6593981801;
	Sat, 24 Oct 2026 15:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSqRHa_n5D4y; Sat, 24 Oct 2026 15:01:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77067818BE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854065;
	b=qQBHWwsw2yH8tQxdwmUsgL6wUHDD03XnIZFZY62nt4QdhS9FB8ckK9I9snVdrv2hL2OD
	 onZ536Lf6/VZj6OaMERM7sG+l7vHmkPVfm/UNiDZm0cYem1hrhtxVbXWfCiDSjTd/zVZm
	 vvDaaYQgqY361O8b+9xq+IQ3C5kWGphkCGSloejSLT4tCu8a+Z2S/KeWvLoWCvHrQT+8q
	 R9fgoR8R7HEXiN9tiHR5cTFPG18mymZBfiT1CfAQUAslQ9eN8o06YRHYWqV+uTxB/qSpI
	 uH/oUXUAruvs8wwNbzZyFJJBtWj7dUab3x3j1TjOQQBeuPFPruFO/YrmljpjeAqROKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8IQaxeid/fKkgPoHUEq2GGUXhHTuGg8ae0nFhhlQ1RA=;
	b=SOKc1nTsCCrHQkBEuQOkzSXm94EiWIkPKZ+Q2YwVg0u4GQscBnNZzECccyKj3mrzervC
	 PEwT5qQ0CG1HIYt1I8zzN0YTkvOxSOayhq25x+2psRSdfTykNpVd/y+gUdx/Nv89P7EM8
	 9Ag/0lj8/qrYKm+a/GOjZeg9a0ASvsUBA9ill42/iHqqX1Cz88gtcPgiCkWWjV4xbf85W
	 L9nqWsYzOatpBlXD0u1PKQ43huy0V0+OD80FaZKx/AhOi4wRLGaAOtUrwiWcZXAOHrydF
	 lE/wujPeJGxax69MOAL1+xHuaSHVdDDUVLHnUvaIIha9rfIiyTrYkzai+tt0CKQpH+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854065;
	bh=8IQaxeid/fKkgPoHUEq2GGUXhHTuGg8ae0nFhhlQ1RA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PRb/9EPdt0j+7e4qcI1fKOqcaOjlKnXhWAoQ1k08UkHPk/Mj9vKV4VcyrafC6QI8D
	 LSpAbDUpdC9R7RtlYNm/uigaxHNfax70go9bWgqamSfAB5CE5mQPZ5sibJqKGUYLLH
	 P+yR3mbdtkEoHVID4JMJZVHxhERkgXVTUUc9coInCjm/mxdGWldTfGveVkFmCv+Juz
	 p0zp0Ojwi/Yfk3PHFCzq1Mu4u5OCkAFzM7xIPv0dqnPTW7llJP5643ypCIuqnqcqdh
	 Vq0pk/8ih8b4p3eBjTNDHUnzCUiktw7pyX6HyWJ57Vi3+n00aa+qcMHqCR3kb+CAY3
	 hBArVAz9D9wow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77067818BE;
	Sat, 24 Oct 2026 15:01:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E58380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EE93409E7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g55BvvKE2WRT for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C153D40A11
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=YqYHH2iDZNCgbqyy2HhLBvBraFRp8hG8yAHHoJPi2Ige49SbgqRhYpb1GZJ/3ppW9wPK
 LWty+DUbm2lH0uoScBk73sWxuK32S1AcFWTrli5atuiFu9l6mUZI03dNPzh6VWVwsmTen
 WfCmqwUdlycX3ndVoP+ZHNzXk3BOjJPXwJRSwtc/XSmm96vg2M1oXFOVoijFgiWomR8Ea
 4ijYX4yCszieExgt3JqQxoWelzT+O8aJ2X1x1IG4jA2TyqQCPHMQaTqbnJ5S+r4sabWxK
 GXp4dy+BMK7C9wjjzLY7nJ8zCAQjMDr4NnzszjOOSYfqZNLstxvn0cd7sXmDJWy34JQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bx8lDmMkC1+EDvMMA5dy66eDKLMk+72d0Q0PDXSwRI0=;
 b=JYRsIIhKgvf9SzrGfG4s0ZcUv/51PTE6ccMdUddOj7EaDmOQpBlGL0B2fGnp5aDGSUIw
 uchHL5x7BQqU3w3MUYquSALkoJrQXxV70B5ss2Kh/NRjfKkzEIoL1JLCkF7aqlmVJLBlS
 CtXuaNWefk2FIrh2qzmcGo40CqYx0TfN/vxHBR8yCtKFYM7JGN/jOyaf9/4j5EIgR7c+r
 as1GXbZfLPVfsZDNqDWJuj/Dd5hXG4OSLr+H89ayerxlHtx/GKbs5w4W5XM6U6IZpypbF
 hoG61QC7VpXafFxW4Bx+H/B0o0Hpic4eHtXfwuKKZUBgHN+SVD6epSWxFYwUiaZXaWQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C153D40A11
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7AE79C849; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ff6cbfe4bed6639a1826c6b8ce83e7f4b89e58b
X-Git-Newrev: ea249a45e3cb3c26f9f3f3cdcee2b51510b9f5cc
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.C7AE79C849@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pygments: add host variant
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea249a45e3cb3c26f9f3f3cdcee2b51510b9f5cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-rich, needed by the Typer
dependency of host-python-jaraco-text.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-pygments/python-pygments.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 1b14b56d8c..eb7d696f5e 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -14,3 +14,4 @@ PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
 PYTHON_PYGMENTS_SETUP_TYPE = hatch
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
