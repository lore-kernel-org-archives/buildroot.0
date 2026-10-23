Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20B9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N5mWM6Wn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D67381280;
	Fri, 23 Oct 2026 19:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4wTiM00E6Ua; Fri, 23 Oct 2026 19:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9B138121F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792783415;
	b=YBTR4FusVAd4RsCBNhj9f5agBR5gMPSHcp5nNke40GMpcojPJ6vv7eSvq/bYBeTByFdV
	 Jq0WymzLqhsqojwl1LJwrbGuueiLtsRlVnoaE6XCHV7odg44ToskXDi5EH/tYzDSghrB2
	 UM01CymT4ug5RhW/zXRzaYCoZaWOtqfZ6q2lZttPM7YVLovj8a/8WJOArL0Ey6plw9fPH
	 IuxonECN0VIEj3VGPAiJMF8HieQ+Az+kZznnfoGJxWc8HEXgLUShp8P6T7rcxnCsUDxZD
	 jfUizlKYQxT5PC6ib+1+C3UORvtpTfQsdbKVfDqQcS5FKj56+OKteVOU8kfMvfZ7PDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792783415;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hSa6/UZrLQfDUZ7rL3YfruSoJTu2mO7jh3Jj+o+JtmY=;
	b=JTp5L9nE8RuNFASsCjCOF3hVvuAcpVr4GS7CF4mXD7Xmg8O2cQ4X7JA8VfczzKvHOmb4
	 lOTVHL8E7xrOokOibZJ9tLPI04VF3SaJcfP0XsqhYNCQrD4h045s+gosaZ7ymSLGF89BW
	 4UpbAbDy/LAm9uyQgvMM9ShgkvEFcLNp2ubfk0yZArl86txvVDxfLXf63hqoFRGNxT+95
	 IvRrL3bDv2hciuAdC5gX5Ki7wisLqc9/1BsFhz0oWmISyRyS1I+v8u6RwALPPQVvhpnAr
	 qgrrjwjSxkIjdk6FMFABWPXvS6SX2Pl0ng7gOriXKLqojeZsXrvvCQh9u1PJDIqjY2Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792783415;
	bh=hSa6/UZrLQfDUZ7rL3YfruSoJTu2mO7jh3Jj+o+JtmY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N5mWM6WnetXOnV7ic2yhcS3YIn1QNnKjOYpf0bzBnRqQ0QMb6DhVVvT+WDyqshE5t
	 WIY8WneDAriau6wBW1bNZJzJqGp0I3BFVQixf190/U++iA/9AlH7djmw/FeM5VRfLf
	 uRfYusSJQSL+wivp73baRo2QK2nj3v1I/mOBGVBfNI0RYs49TbrqROdskDlItskkQW
	 Nxeh7JdeITfSEOiyhsW2P9ZBJ9UpibH+sdaamgMoP3e6rfZlUzAoxjeoQogug8WUYU
	 A+1aGAMnFjxyDFW4HtCsY6cCruUW3eJ8jGjhjQ4SVe8Vj5J0HmGbDQGJpF0oH9BMIl
	 Xz0USzAVo2yMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B138121F;
	Fri, 23 Oct 2026 19:23:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B45E1388
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A67018121F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20bkY0QeXPj2 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 19:23:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 59AAE8121A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792783413;
 b=epFuo3vKwQG412xRcABVe40E+ag5/yKpN6xBZVZFTnAv1XX3rLYw09n/rDDvsUwdjvPZ
 Jnol05ZXJPNTpEWcxlCMvWD3/7DRNtHVmfezdHNKm6Z1AmX3yUS0e0nS1xYEcHL5KesY4
 6hDq183XPClBuyZ6myDaLXSJ17hApkSNvlma17Nao/QB1Hdx+4kArKZt5T14yMjgG1OJv
 ryjVJrDLkCPMz6RZC/wjJ2q8ljiNU2czpNKkDmQ8MSQpn5Kv3xbmiUfZNhL09/qIk00JK
 2e2gjRkqtm/QVBgKhpN2uFejg9Fpcr3a0IbkIwL+RUIw/cvfraucIxdm3FAFJabBPfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792783413;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=dI+ZEDsIThwM0srPUhFFAcwzZVxeLK2ixRSzZLgncyc=;
 b=qdnFYqzCMMAjnfrmnBLGptQocfDfmwVhAuXEzJ2y9CGrzsma5yrPLomAR+5Sr8qrFRFs
 xhAK367M63yrkxNrU255W25kgTXxBnBXU+CHRXsmmPF/xssFbdEjqqfKPoKwcWkUe+INk
 lUcdux7uGrUsOKJ2pYbmODhW4RPTwrNIMJNJpasRkAbjrZE/nBAuG1n9awDGnrVPFb4KL
 ezdrSK5C6kpwsVzRvwzJn+zRlrdpPhvCV82hEyeQ2gBvqpaNAgYLet/+BPbuI2OJZcvgf
 TMtnyfCk7MpIOXgxhRIxg8AJsBoTrZ6cgI1eramr3PLkWylj9Hr8HnWEqatihDY/euA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BLZe18Xq; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59AAE8121A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:23:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2230019F576;
 Fri, 23 Oct 2026 21:23:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 21:23:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 21:23:25 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>, Thomas
 Perale <thomas.perale@mind.be>, Marcin Bis <marcin@bis.org.pl>
In-Reply-To: <20261023184306.2419659-1-yegorslists@googlemail.com>
References: <20261023184306.2419659-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c12555e0e24cd7906a8b60adf9d470c0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/bluez5_utils{,
 -headers}: bump to version 5.87
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:43, Yegor Yefremov via buildroot wrote:
> Besides bug fixes in GATT, BAP, BASS, AVRCP, PBAP and MCP, this release
> adds support for libical 4.0 [1]: libical 4 no longer pulls
> libicalvcal into the libical.pc link flags, so obexd needs to use
> libicalvcal.pc to link.
> 
> ChangeLog:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog?h=5.87
> 
> [1] 
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e60d07255327db3fc4e3a28d7fcc792cd42c34d0
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
