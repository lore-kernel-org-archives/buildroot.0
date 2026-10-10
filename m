Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACCACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2220640949;
	Sat, 10 Oct 2026 12:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbbpeeMbgueQ; Sat, 10 Oct 2026 12:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C61F340786
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634091;
	b=BJQKoRBFAdTZFjZNrfCyPq8goGpXt/Eb2+GFy3r002n0+1QwpqZogNnz1U/n3nJXwwvC
	 6GTnA2FdwSZIeL9I//GmtcVFmSmLQwo0vqT6co3r38QYR9P3NWCgKHECo4nbMMK6vURtK
	 MuvpK4dUP9MmrW/0wcIO60ErWPUa2DRkb06Q6LhV7yfo/5XiGBqWHehqqGnYREbBA/BbY
	 5tR/9cSoTpYTVMipHt/meBcm83cLNzw4NhHcKlODZfqmGh5DE/rvdeDRtyvJgu0hjVpE7
	 V0ildATP1AxG/p15IxNWpWyZAOsZLP8wH9AuYMS+3bFXAbhKyFW/zDeyMjK8eyh1gqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xv7RcW/BC6znP9LlxzMdd80WgnYuwrfJCxJwxRenEV0=;
	b=nODkT5jwB4Nk7xVJC0RW2O/5k+CyHMwiCZq8rAxcMRu4EP8wN1c5MaGCe8+SBVmzXAm3
	 BqMLTlO6yPJ4+9aXFsodofbCrscp2Jbqsj1mqwx/g4hJ3KFI/cqxbtK9oq8c0odJWWbYW
	 7p7Fck+1lz1HgzfIbzsrQzEJNNvWZZzF6wm0Jz1VDowd4GIqPiQEU23LR/Ms6NHiYJyOq
	 +b88rfnuPuePhH/6TjzqB/ZY2wkOM0weYO7Qkr8TjWy406cnuFLYtAPKxXn1PY9OzP5B2
	 TQpIJGd3ccKT8/wZsv8xvr6PRPLRLEgENZVia0gW1odXHeNfrYCaMwE9LrB40EXFarA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634091;
	bh=xv7RcW/BC6znP9LlxzMdd80WgnYuwrfJCxJwxRenEV0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iHXhtEPRb0yxcMy/83H6DWG1kri305w03PLWezNydMH0chkwU0b9dNFEqUQ+VfUqF
	 Pi/0SueyKGRWsNnhyJhnQXeIoi3hZfeml91/ImAntwDKbQk6kdHPuAWe0NpfB7diFO
	 BAV/MC7vPRNfrQ+ROUfhG+dVO/QUQXSzd14FWinNgOmfod+ywBBBWHldIN0kfrf8l5
	 j9MmJgLLXuxCG9+YFgPCIoXzwL1ljmoTuBjPVkqnG3pv8G2rpOcM0wJWLCbMfX+3ZH
	 9REb0676zJdZ9JP0Wq1PVTP1vwgnBLUKVHO8qp2XcT2ft8vzs1fUCaTJ2bneH9HDKA
	 cofNkaF8ijCmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C61F340786;
	Sat, 10 Oct 2026 12:08:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A740B156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 995CC81194
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDd3pKL9HcOe for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:08:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 12B4A8116A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634088;
 b=GAxRG/6q4nJm9Mi5p632VjcVljClyhVQhKEz8qqrsobvNAwepFZ2Dnn+cllIqs2HBRMT
 2q0hhJgJyt5Q0SgPv9CpJQXyvs702YXpUFuqFTPBvS+hkrk7BcYZ7o0nH6NT21ekvdFTX
 hve6w79FtNQIrU85qTiL+Uamg5fDoLWYa3Wwe5XNeVoWWTojO9E+cDHZ+iL2hoDe/Mvh4
 NUyXsfAuP1Hro20cymMLEp2vDYaBOEo7nJxjN5GAdWNq59QsOL9LMf8o1vSaFGSFryvGU
 9yhOETL951qJUr02xlrINHZEMskNM1HTLrxQAbyioC8wrJb3U52IHnRj/wFvpsxgYwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634088;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=GJ+S/2ZWmGAeAqKIoSdhV2JsdDvn7ca5eyg+32hnCSU=;
 b=A8St5+7NZ4kRKqeVj6zTUsARJFDzilJ78rUISclh5L4p6Oy7yyD7ZSiCbR2I3K48LAQx
 fyVh3bvogXkWRJoX34cjSbbfftwFeB7mrQWZxrDA+v5baxVepZWmaJVKBC9LSveKq7hzJ
 QBptQyeuX6K1lOz+VDBQtZ/MHg3PuQcqbxtbJ7wXiQXi3/jOLUq02QpJhJe4WcWzYoQQx
 ECB+RehxnO9F2caYA+5vER+BTPL+Yqsqqvm2x+dB3NGnVP04qu+QEOkBLNDgx4ge7KhOo
 CdKH635Ia6lMziXD5kJU7aKSIAvn1pF9hcKf8csPhdxs4BUdVLN/a4gCS94ZPGoSVtg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KunzZZ4q; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12B4A8116A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:08:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F37FF1A1171
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:08:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFE846075C;
 Sat, 10 Oct 2026 12:08:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8EAF311D700D1; 
 Sat, 10 Oct 2026 14:08:03 +0200 (CEST)
Date: Sat, 10 Oct 2026 14:08:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>
Message-ID: <asoqnh4KL00bkR_d@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-54-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-54-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 53/84] package/trousers: Fix build with
 OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 06:20:34PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: No=E9 Rubinstein <noe.rubinstein@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
