Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F55606A31E
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LFEWc7Dw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D12281753;
	Sat, 24 Oct 2026 15:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlQF9LpMnPv1; Sat, 24 Oct 2026 15:00:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7605C816D6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854057;
	b=nOQilnPSH+cPl/eMuA1c4cNrRctnRErsHGtulvL+s+sVtdRtS4XEg6uvMncYic3uW3mO
	 Pb9GGLeusY7y/vWDayRc09BjsUDkLXAs5DmJ4strq9EB+vc2gstoqhOB7bBvIXriw71Km
	 A7Mym8DTwJwTx2RK2YgMn45xcc8Cj4+7I4W+BROLtbPLIoSftX++bP/CCZ9gtGZ6U7TDg
	 TcXL99+55fPkJ26qwo7mtOaKutSe92QrJ404vX9uxDagsCttQzejJle3Li7F2FaEeo6Ng
	 /nLIkWc6kSSOK+GDantXbcRhf4XGEFgcLqxwZszbfw67jBm5Wsy+SVM8Mc6YvKVMdjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854057;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=by73UUX2FnhXx0nnu53j0ytlMGKnMO7iFOKUPhf2lf4=;
	b=Wj71qPJO4ekcL4OVLO9p82YtS2qL/uZ/TIOoD74lIFg5tk3RLLkr5EM1oqfUFQqYK7tg
	 z+w1gY++aLnYxa9n7o+Uz2cyzkoUQ/Yzw5ofJwk2JkqTsyNrW4DFXHN0mRvxO9KSIY9db
	 rIryA94F8ArUbQUHelrCbvU8GapdAKZLysvyhosyr2iZHB+Yq73sULZbzxKl0mUTZXWM6
	 p74OqJYh2DLzgExaxbRofW0gpqEmTpjXpXEy1yzhvLS6q4YGK11B1+Jaak0LVcDgfyZJv
	 KDHLFFY830RAsAIXkqEmxluFYtyU5cWcrGgBWQmg2lAdhELywWrI9zVJyULtDOuVYTg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854057;
	bh=by73UUX2FnhXx0nnu53j0ytlMGKnMO7iFOKUPhf2lf4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LFEWc7Dw7iidQozcwoLdVesaYSGGfhU80L/jiOGnZ32yGxTiYfXKt4jolCQWqW0C+
	 SAfBWVpu2xEZvBSW2BvmHsWvYxOM89rmWW44JzHzVU2qTVkGJXN+/lpdTf2BM2Viso
	 3+72zJesYok8Hvf8Frhluvg+I5TSVcTpW5gNRqZWSONMPWdrZBNJZ6xGu6XQS6D8eT
	 Yrv2eC6YeRO4viZz4m/3YuqQR7KMEPvEyh4LkcYzWStEucQ+/EMZXNUFlEmnxdcxdx
	 QTCRBvWRD/PwUzVavG4FkmBfdtXXo5rs0Sv/BCZSJBZlBUC6K+TFBkrgpHBvrTYRno
	 +0zC5hvBLPb4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7605C816D6;
	Sat, 24 Oct 2026 15:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 644F9D32
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A6E040A37
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfKx5aQdKjf8 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A86D140A04
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=NyI8q7lMs7tP9RpWWZ6jhhlh30g3HwGRTa78WawwmFr4ZdNU6+Qizokst8ognyq7DLSn
 MU62jr+tDmG0kGufSqwBHkhP1PZ2ZiZlCcPEivWO7KVuzX5uXrPx4S9FY2BWsqyeNX0pe
 hewk2SoRil0IKTVpBpq/cmcghUkifXvXtF9tTzYJioy1wpWI2kZPVDiQ7qzSntYE/+IVt
 4U6WEiDEUnwj+KeDUuJ/v0R7RGq0UFlpv61bG5qQvceX5p/bloI1KASqASyXjmJIna36c
 v4REejFXmiIik8AMfhMnecYRt+6RHsl5cOWwSKc9qpANS8Yce8Xqw/GX9wY5+GaFDbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2BQcDyZq7t3lCGMA7Cqk65j0b/8gLiSUFi+xg6D97W8=;
 b=SHpnICAASjeT+eYbGNgniNTWrSKH6iZ6ZC8ZPYfvHIx78psYz9uZD0QfQaE4R/TY8W2e
 G/oKIKq+5gUgW7NDAZ2qmcrNwGbJNSbOtjCOGAxki+cAsk6k1btTFAteYte5j4d/uqeKi
 njyYGZZl1/aXt7wAv5zz6c4gVxtP2OXn/AY9BbXNSocqqqMkw5EsvdHUSUD4nNDcM8RGp
 IyhAi5+6ceMq1VSFKCr4kDsYvZwWuxMBVbXr/Scz93dOqLVUl29RUKbdA33T4bonTKMZx
 xTK+CBs92+tqTGAqrVgTSHkjbia2P/EM6M/RRZwJocBvLxkA43NGBTzA2zHrtek3OvQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A86D140A04
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD8AB9C84C; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5212231bb57a096121dd1250fa880e2d8de0247
X-Git-Newrev: 22989f4fd1529e4d343d66f111d19b2a93091ef6
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.AD8AB9C84C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mdurl: add host variant
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22989f4fd1529e4d343d66f111d19b2a93091ef6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-markdown-it-py, needed by the
Typer dependency of host-python-jaraco-text.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-mdurl/python-mdurl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-mdurl/python-mdurl.mk b/package/python-mdurl/python-mdurl.mk
index c6ed397438..7d4c0e993b 100644
--- a/package/python-mdurl/python-mdurl.mk
+++ b/package/python-mdurl/python-mdurl.mk
@@ -12,3 +12,4 @@ PYTHON_MDURL_LICENSE = MIT
 PYTHON_MDURL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
