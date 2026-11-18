Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F048606A339
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kWsG95QH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826CD60708;
	Wed, 18 Nov 2026 18:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgHAAK8dHLRG; Wed, 18 Nov 2026 18:21:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E7E38606BA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795026111;
	b=eviPn232hlIE/7VEbeS/0JIVv0JXImEP3UVhWNK+Y5AFFYRSihWctH9Dcr/ePIz/JDEl
	 1VbpDnDx0GqvZXWH5j3uXyqSwTdWJxG7P3Hi4mfq7wtVrOLUz4NSuVngHCQ3ZIrYw2kBw
	 a7PAES+P1ba3kXcbsYiEiEr+szjDOZ6NCyLTOO+TavttZtdo8OrwMQnrP24JgmHkuYM4P
	 c6PEExDxyHixVfy2h1geYFbIBfOVz+XSkzUKCvq5plh0s6a9eIZ6lrStUsYdWx2A4hXq9
	 1mM5NS2p0ZnU8wc0L27m14U+Gt2tBEaLerQlE/523tdIG/6yToygb364NGmAmDJSOMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795026111;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fqGG3CCYOabCudlo+Oz5CvtJIggAe3uhEY2wXSeeiYY=;
	b=n3ZeTvWlatOBDA+GypsPrf4KfI7ij4oAOVdsi0/aqlyqNhA+b54naLQ5H6oRc9jTooHM
	 3wkNYd2vpfN8XvNWp9oSCQlSye1gu4V9hAV3aIsXpHbxk/mhH+h1lz+Qj5aR/mdFfZFdY
	 CtrwWtXd9s2bC4wxZ/JzTuyLKExeUlMMdb7OJBBYSWKqCgfRxvB+Hn95Thvzpjf0bx7bS
	 A5Kz5NnuZYBY4v4PT3kt+Tx4sMKVVfP6DjjsyDd5g/9A6jkWVRTfNGc3XcZisIXjiccRu
	 FV/bbPUK/2OqMcb1/f9pg8IYZs0ueidgTbnciZRgRAOCvOp3JVINB16xnRrbGomId0g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795026111;
	bh=fqGG3CCYOabCudlo+Oz5CvtJIggAe3uhEY2wXSeeiYY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kWsG95QHt4Hrs6BPI7EgQnpv/PrFj0oixeNabrD35nnVsGEGsInQShKk3xBVVzcQy
	 +epfWzO0krI3awj39Zrqucvfr9BuHWnpiBiivkmCkqJVMHA2JwE7kknWSPgC8ZfYDA
	 0EkOa8k5iMRfB/SszaRslaaYiEQrn67df6Zg/MACAl431qhzDkI4jMK1NUH4eTbD6N
	 j1UZ4/Bm4lZAABc7XgLVRp0/09uKnuUkFNMb1cDGi0lXyq2WnTgbnU2HeD8B4YXYVa
	 W97BIBTlHhRnoHHkUocNTjsOPd0jq6NZAME20+csigh6l4APmFS7n2LgLs66h0fn8s
	 A1dytV61FtCDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E38606BA;
	Wed, 18 Nov 2026 18:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DED6113C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC87240822
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lb7SNd6OpKau for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41DAC4081C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41DAC4081C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:21:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 19D80B00579;
 Wed, 18 Nov 2026 19:21:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 19:21:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 19:21:43 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261118101402.108660-1-troglobit@gmail.com>
References: <20261118101402.108660-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <16203f206cba164644b197984390d5e9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/mg: bump to v4.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 11:14, Joachim Wiberg wrote:
> Since v4.5, configure checks for wctype.h and mg falls back to its own
> character table for word boundaries when the header is missing.  That
> makes the wchar dependency added in 600ce3a71e82 ("package/mg: needs a
> toolchain with wchar support") unnecessary, so drop it.
> 
> Release notes at:
> 
> - https://github.com/troglobit/mg/releases/tag/v4.5
> - https://github.com/troglobit/mg/releases/tag/v4.6
> - https://github.com/troglobit/mg/releases/tag/v4.7
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
