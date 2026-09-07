Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B743C79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 20:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB9D140526;
	Mon,  7 Sep 2026 20:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCcYDuVAxcrz; Mon,  7 Sep 2026 20:00:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 29A9840518
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788811247;
	b=blu31ZQDhs637G7RbMWldlzcwUiSEr5A7OETk9FoynXkn566kFwjNNoDfZQHNK/GkLjF
	 Dwe8PxREi+0Xm3iIDyB3IcEd5kiLoQwkPJs9u3xQhtoZgZGcSX728Jy2RfimF65yR+Ve1
	 H70cg0DiHRu2Q2yNPvn0YjMd/9Lqh0YdENbFZ2kePL/dapv4d28RGnH0axkrsZj2m0ycg
	 vg6HFFtHIhYOqAPyAnu3VvmssFT8V9kR0aUI8IZ+HbiCrWXthpIfUQ4wXa+rtnmbBPKHF
	 y+fih9mQoQrpfkxgDRsVYouLfkLMFNv7pykHn4OmBaxHx875O+j7+7htQvNNu/io5bA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788811247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=yt/fpU4qZeij+7WsJm0dDwRkLKApwcP43ppyFfVw8d8=;
	b=USybfbsK+7uDYKuNrmhpHMcuirkUFjgSxBEUj8YtQL92L3qJi2j0gwlGC5kF02dAWTu1
	 7WDGAAKW+LMBjjyhvaJ/RCCeW8hf07zzREnKUCfrlstpmmdpGrLhpc+i8YkzPyK1uaLVb
	 Ed0LVuVkhkwSPo9aG5//e3T3A0p1xKZHhRG1/jKCVSF8VLZbm0CdKPttaz2MlafKd923m
	 wgTiVV5g+UT3xew2ddw/tiPYcO44UuAOADJquPlI5Pvm/URFIoRklIzDJsjiLbIB2OvhR
	 ZLQ42g8iMAyXhF0Gab0xe9mTxAS4OX5mj6fTGulOYZC9k2JsbL4t3htVNA/rGUxC7cQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788811247;
	bh=yt/fpU4qZeij+7WsJm0dDwRkLKApwcP43ppyFfVw8d8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U2MYsuv0v1Uyx72XhgsbhpnFEaZaHe6dO4HfWdpKjlbcWFlPW/6CkpuJIrETTOPv/
	 SHaL7JxZftIXU5DPnojowiIMpNX5SkL7XFT/D34R4+IpqD2GlYabWC+olhST3Kcjz5
	 mrL+5pvw9nCfPiDuK5iokQU7PDOg3UMzuHDuAmnAXxlaIy25EgBGHieNYEdNRHXDui
	 G6+uiALrloXA/Yi6VZ/YGZvu+QtEHpkXn/kXeNxu9xqj5ayun4H6tmt5PfwKCzLgt7
	 t9J6wGcg8DCT1k9/+SsOwT13jUyqAJOpc84IZnrqXXX5Ktcml+eQ5QTVS0sFJxZcUV
	 mzUAf8aXA8rdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A9840518;
	Mon,  7 Sep 2026 20:00:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CFB6230
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 20:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A7E780994
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 20:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8beYkwkK2sJ for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 20:00:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7B99280987
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788811245;
 b=DsRvd+eKsDCZMInjxInI3itt/OXtnP9DBDVrW2feseyp09uXZ+l1AyPjdSXhUE23wsvk
 umHTuyqGGQ8h6jqQtrhLIFmKV8g6KH4Gu0/+b7LfDUAljLq+u6UMQC6iGnwGLJJLiRo8C
 6ovkqyYHVkYNcBZbwVQxTYJyAs6k2k1LeSDVcowZPhJl9jbvwAQ7aBTWXuxARq0TRPRAv
 EFXps72eCIEP5b43y+vwd+jHL9I6G3UyBUNGJhC921djhTf7Lx6kCdBOy+GVBHQ0uPn1F
 Qgva49miOnHKZriZH7OrhBG9yntnYdC7i8Ubr8PZ3Q5PW6Off6RLnAM9JUP6I/OQFCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788811245;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=9FPSlNSb04w6Sa96oaFhB4l0tHFiTc4CAtGXou2CIGc=;
 b=Oiu3XX+laIH0ZUnjwwgvS/fjC3NUQsaCt2T5vCZ+Cga9EvyYNUL+eQxYyTPyI2IJL/ya
 u+sRHgCoMYGkfsjQAvZ7CN6K5ajK5xh1RcllfmGW2fHS3EGEPXDpKF0xb5EG/426RreMU
 WXLyKyfDDgTUg1k5CbCO+68/grvOlQk9q3YR+Ut5CDB82daI+PNOtUpiBGikrS2Hs48/M
 ekVoEEU1A36CXSs+Mbvk0cGGROZOv2MNQEpf+ymaz/7q/hgRngMjoiDh9LC//QzMJGZY8
 xwO1YB+5AMf9+IADtfGHWXE/LwIRBTNORhsAO3OFvpfJH6RMMK+8XmfwP/dTQzl0JPQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tjw0xWh0; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B99280987
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 20:00:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BFEFB13F88D;
 Mon,  7 Sep 2026 22:00:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Sep 2026 22:00:40 +0200
MIME-Version: 1.0
Date: Mon, 07 Sep 2026 22:00:40 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260907184335.667975-1-shirokovalexs@gmail.com>
References: <20260907184335.667975-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <10746aba3a8a1f987264e47c96b6addc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.60.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/09/2026 20:43, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.60.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
