Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC70606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D97qP0/x
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 586A160A41;
	Sat, 24 Oct 2026 10:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPh9n3hYAh11; Sat, 24 Oct 2026 10:36:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EF7860688
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838161;
	b=sYoSw8UXWZn8yipo9FZ6rh770OYks+Wnu+z2XVXTOFgJvaRg+CePYECPBChQtYJM0SGz
	 aqQh4+D3GTHwIHHgkjk0dqf8iOpY165KvvWcXuGU1x1A/bpO6ABEX7JfuA7SNLDM2Ti4G
	 96PJkQ5PZYIu1m++MFA4WMo5vhQ2LdIhmelEroCwyeC219HZOZTRAW4MQVMk7hq3LW6n1
	 o5d7yFuMuIZk0NbPcGWIu0sKBd3QgEr4ay9Qj3ELm85hR9MP0Z/7sFfU7uL0CK0NlMIfh
	 sFYEDYMARoI1dHNqBYgBl9YjoQ09h+cbVc/VH9NcpGZKLUfQzqyoN9ziwyrK4N/Wuxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=C49gnY7s8JMg8DNejyEDbzrP8X+0RNBsRxWFr1WBRBmN2Lrje51uPIkby5VHyv1N34ba
	 auKvc1XHufSF3EeQGwrj5yQ1UQMQFWUYGWWeHd7vr2jobzkerYzahY+2TswnIr9s4FnHw
	 By2fHwPyGiIUM9+wa98avG8HSUvNM9EC3ImXnVnOJBmum0DPXKNl3reDLDAuhQzKl0VUK
	 YhdeKEdf+cj2DR4EgLxyiqC0UPcOMTX015G8BCU1AaLOZsjzmVv7dkS7yqUE1z1Wwoww5
	 2lnhAQbrJE0mMawcqkScTAeJxyaBZp4Myo89ARn5MntKE/zNKF8pDSTb1bohea2BD+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838161;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D97qP0/xizn97VsRreStE5oYkqHQZDepesztAzDPYRigmEdu+IYQBcsBgIOYMx/2M
	 ANnAG5zVzpyKkurF5ydgxeYkD6hp76YrQeQNoiO/1Pu/fgbQ0gDTnjwYWHKfOt6Zp2
	 tcTLpioD1sE/YZTDUMvTvcoQQRKHJ4QGYid2Eq+s+UCvUO/3Aaqw97WJzhf6+E6V/E
	 hUJdv0IDQutGYZ3fd6mqxO1A38pEfwwSRfNnHXKFk6nYpdN0fVYraSfdokc2Oxc6es
	 rCDmnnS8duHaAKbGJAg9vOAUosigyDnyuHNuVAL/w+VQDmrEOulC67yfXtYZQSWJiK
	 4nhIXyrd6Snrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EF7860688;
	Sat, 24 Oct 2026 10:36:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B2C6380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28D9F8169F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OUo1rvQDkTi for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:35:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80AE7811A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792838159;
 b=A3ijIx4SQRqYzQ196eFPlaP1yXQt/NjVOLyibLk4a/LZzm+gMPAzMOW5drnwVb3m8b8d
 ShTChhFsu3oaig9tGU0fyiopT9kuW3vR0MIpQzgt8tvv+d1buIzwztqovAFFiX74mRmeO
 wRGSgulZWqnDGQVsX5/v90dlZk18lcJ33/0E8/Fm5e3PCy5/4CsWHjS9ZGLsOL3WLknGa
 NxcYDGfNZnWre9ybm65pKSDiHBIW81UxhzjYMgWV0yNeYkdIYWrc+UqHoQF2UlBVkh0Bv
 Uu85XQ32wn9qxXTQnvX11epSONvitr7gaH4UBTjuE5ZhCQdbosQ0zTooQdjuiOpx6bQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792838159;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=tAiZvc1MNCCVYjvT+dAzpnsK/Nv9yLMYeM57lNyhZwpVhV2zLex6Caj4RlwEM9vOhhsU
 ySiDKsu52Yx1hOws2kiSTC8J9c9eR4fQsv67vCpNKzMA51KcwZKWNxj3oTalyFi0d0bO8
 H8ZYlV5W1XH09QoHqhnQGvoAOFN9T885brVzknzRLqvUebNd5cf/pQhLaiT1bNkHCZJVX
 pTkj0DkWXzS2GlHeqjBFsu8wtgF7hRcBdPi9UhiP2PKK9cWg21BamIVpFTrNSPulj5i4+
 x8wRTUkgBM55GRFR7klRAwHmcVYbv3DtAKtHhBie/CdT01/3bJErmcrjzr9X+ZeiSfA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g1eigB15; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80AE7811A2
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 46F60780503;
 Sat, 24 Oct 2026 12:35:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 12:35:55 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 12:35:55 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20261023181818.920329-20-james.hilliard1@gmail.com>
References: <20261023181818.920329-20-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <f78a7ea11d54ae101f69b0cb70377a82@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-s3transfer: bump to version
 0.19.3
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
