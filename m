Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123BB606A33F
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HJteMF2m
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE80811C1;
	Wed, 11 Nov 2026 16:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJsgNNdVkkl1; Wed, 11 Nov 2026 16:56:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23022811D9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794416190;
	b=hWyJA4e41FRau8nYtjaUxN56QUN2z4KCz4Ep9pBYbpgx3Pe28eqf9LoZtmkd0u0uIKGR
	 +vmjI+Ybwanl0MRu2Ggy7re9Af13fQQMTPMmWXyxpR4S2d8iOHKNMppAAE0mvmf5GUK2h
	 XL9U5+QGQlpuEsHJq/UOX+q9Y59XqQoCvWuzvxKSVFiyvJLRFi9EN4QgNQjwaPIxu+a+z
	 aMazn9fpHb4h6R40kadUnv/JEVfgMCCMR7gwnvQ4ne8SOlfaItHBwuVbasGWPla+X+mPQ
	 fqS4iNHzclhzflEN2lUkvMVEcX2uW3pGrzfDg9hxkiXb7fpr3ysV0X591CN14OUbOWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794416190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=WRzQkaZ/sD2+ZLkYyUDGBfW3vYz1x8QX18dCfFJUVZE=;
	b=HLaPN/hckn9vMNcv53khB6dcUuwZa/yS+wnWaxwlyqVfGETS0cpSc4g2WxlUsgAVdP/V
	 f/xI7cDQlmKFM7LG6Kpa/kBHWQhTngSghxK7mX3i8GfhXNGCnYrOQsWvJdEjIJPIBj2cH
	 WRTmBT4SPiYMEVwaKDMf6IX34S/VUul6w2gOhMmuk6tc5H+kHKQjKntUmtYtz02s4KFU3
	 PFPD4QQ4h4xHIn6bla5iBy8Qj/guG+KbZIcQPazVluNq2OgHWCxncxdy0L3kmeS079KEV
	 HcFH/LXYKy262c0CUKAIKhPzYf3QenBZbVErsr3HInhBskQUVqec19uKwg9RmrEddUA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794416190;
	bh=WRzQkaZ/sD2+ZLkYyUDGBfW3vYz1x8QX18dCfFJUVZE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HJteMF2mYcnflJvnX5d0qigujkjgPEzTBSW1Rq8gDp4ApyrENQF4XepwmqeIxargG
	 YBMUkxXXqdDchmFTrwxFyt+ron1up55gl+YEDgMSZLkVVBfsNqV7daD6yz30sXnpCA
	 DxHCjAOAyX+B28c8I8nniYXweUoO7nvsp+Jd8XnIrTUycaCFlm2XB9RjmQo52x9mzd
	 iDmpq0iF9lNWsKhqkjMWswp0y6lsj3etdXZEo19o+XVf4kyX+4OqE9roPf8ZRXAN7P
	 z00YtUug87V7SlQ05Jmi9B2UI9v4/KCGo9Vw8LeyQ+Bl+4xrCZycI3CzFDXgcLrNvt
	 S8SYU8rwiR7Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23022811D9;
	Wed, 11 Nov 2026 16:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC6CA335
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E12F0811D9
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2yJRmg6oV11 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 16:56:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B7626811C1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7626811C1
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:56:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 45D732003B4;
 Wed, 11 Nov 2026 17:56:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 11 Nov 2026 17:56:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 17:56:24 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261111151146.2078131-1-yegorslists@googlemail.com>
References: <20261111151146.2078131-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <0bda883841a82f6674b89f703e3e2417@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/foot: bump version to 1.28.0
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 16:11, Yegor Yefremov via buildroot wrote:
> https://codeberg.org/dnkl/foot/src/tag/1.28.0/CHANGELOG.md
> 
> foot now requires xkbcommon >= 1.6.0; Buildroot provides 1.9.2.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
