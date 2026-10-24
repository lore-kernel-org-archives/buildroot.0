Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94298606A31F
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s7FIQMez
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D91760688;
	Sat, 24 Oct 2026 10:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1evpEPMxPJj; Sat, 24 Oct 2026 10:34:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D3D760639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838055;
	b=fpi2Kb6Z4vzbXSWYDVYvekNf10zMUVc6yf/IKfnVHs32UkmGIvKkrZ1zksY6miEJqsp/
	 LHF18nmDVrkQJTJXR4pQBVQ9YJ82U+d8QgO+WDFfaqHQmvUfE+VeP11xvG33Ba4YggV4r
	 ermLmMvRc7QUap+eeh1TKTayuFuLy5F/HlCTP1vYYskdn5mwfqoCFnG7xzrM2F1AkUvRb
	 FPZidtw2Vsm2p5C4M3LXiMlEZIrs1F5LD46WefwMZRwgBKjw96qRIkcS5Bm5u57hVjnTz
	 TTajWj06QLpDqaVDUiOg1hVU8yE0dXtC2SF3NYd1lttyusHXxs6r7RzQX8vjZnO7sdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838055;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=XUzwWwRe7/hEQRdD3ZsiME0KO0hFcC0CTybT7pnxvCM68Hp59fl4C8cjnakxqnusTwHv
	 LMMNEsIWuwJ/feFy2Oew2cVJg2vNZwHi6KGIcE3juFHZocHUIi2SOg7X1MEfmC0uU/CAc
	 Numkvzv4q7sPHA7QjhwAJxqE4vOpq4xslKBaoh+ZT7xs2yqNsKBBLbsbUHrxb7q8zpXC+
	 7Ag9m7JYkzyZeN82sbFxX0BOLT4xAqlGOpAt49vx+2H345nHZFFyOuR+abM3M9AS8XiGg
	 /RG6SildlkiSluYgNIJMjiR8wfIuDaHq3sEgknCgVaVTIGO4LJYqPgktg/824JLxcVg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838055;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s7FIQMezHrp4meAhZOkh8cCcUOsnznGkkCovKc9ih+mvQdkdNo2ox/nUxCtytcfjH
	 dtjmNwE57GRMZYnCQNUa2b38Als5UkSta1ZMIGzYITBu/izYnRyNxSt8dBf/2Hu/Qa
	 imipXpKQ9FmEPM8UgYmR2qvHLPHMqNKfGHZiD+kADs0UPCeIv5yB2thFR+Ym+FLSW0
	 zbmmlD0xNVvoCc/Q1Uc1dC1B1tkO5f/KvQimm5emnt1UOzxnocIxOyxNMcwgxsaDcB
	 ldu2JsotAlqGrY0BOoU7TDL3FpS5csKKjYhXmHiLMKC6taJcy/jWfFoqbKlzHLr/6w
	 6/nXEow8oopig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D3D760639;
	Sat, 24 Oct 2026 10:34:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D25C2356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B84944091F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKuozXcWJ2vr for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:34:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EBA3840763
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792838053;
 b=Q1k/Mo5bNRnnUYgO0KMRMEAGjsM+g0sqkCSe0UxwIOgCu4vrMFTYymrwfZi/Yh8+2F5p
 3ddAhCqST8PSjBGkNLYdOK3BQlvKBYiVN07WHq8ta6NoeEDOzmHr0leXlPrNOcvbiuItQ
 t6nIv/MPCF9GYNovKCZ1Axvq2V/4Yf1DTCtGoS2MXBfMWS6Q3lXKt79MmIpkva/gIK/vG
 rwEVPYej4KHmRph8jBI322mJtqdIlmxKakZB+Q4le6bdCnKBiRoN/eLFRJj0mvJfXSowo
 GKMIp5b+JLmKn1Dr4Ko4b47u+GFGUd+KVdCOH6PvPi0E7JBbrhetXA3py6/c2lAx6oQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792838053;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=liVI0cke/bSXhVfX7N6g20mmXWQp1WJN9jBE7mAUMrfAbV0RNEMntVKBVHTzD/RxRNXP
 Mgir+imC0cwkhMTaqxbpNHt+Yyl+mYFHSviHZoFCiyJkLyvjqHSvhxLDndE2GJ7r3Sd0i
 J9/luTv9SeyFydS3dwKEYImYU3tjbJVhtyxfSRFUy1aDCNZfhgL7w8YlMZtCZV057dObk
 PfppUK04D7oY+WrdCLGcmZfmts2RIwqOpTyN6iQ/9GGsrXgfztOTzuIQN/csRD3sMn//d
 xij1p3eYMf2YqV9ZFnz579+T6FyLAuwYC24GsZuddrBM9eeB4f7XCRHXSTHJLLRXjkg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WegSE18b; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBA3840763
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4AFAF13F899;
 Sat, 24 Oct 2026 12:34:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 12:34:08 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 12:34:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>
In-Reply-To: <20261023181818.920329-13-james.hilliard1@gmail.com>
References: <20261023181818.920329-13-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <2eac277cb7999a8268955c6505c835d6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-markdown: bump to version
 3.11.2
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
