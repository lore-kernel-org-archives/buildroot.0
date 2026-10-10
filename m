Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5E3CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B31B1409D2;
	Sat, 10 Oct 2026 09:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBcJm5gsB9Z6; Sat, 10 Oct 2026 09:24:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9B226409D8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624287;
	b=VODyLBnkPx7OOtwRc9xbeBh4FeOl5ldDFDi3UN0kO7Bd5OhW+vekJ9CLty6V5NTMBiKw
	 6JHpNdSMzLTQytQwADiacY6G7Exqd+z2uaHVhU4Zh3yNzckEO0CJ+HtkxKtyFyo72ViL2
	 d0yBvF5ow2jY6+1g+pGUD78kt7SnR2SeTP+LqMTb+piR+r44hAu9woxBDA/bEJQY/6beC
	 pvcqY5XZ8InV4dxVyIwkIGc+5DSfE8ns1hFJHCYtviAmaYquypGLgsioDMm3GQK03OP01
	 q1b0URAgt+Hhu9t16FFWZRBjbiQMN0fsTIJyNOkH7atkcBpBUzed/cwZwcDxfJ4Ob1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624287;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OO6PUEnC01Qp7efXAZohXt1osz8CsaThul0hGG2rv2w=;
	b=DUzaCmxNdFWQedFnYOVKtLpt8EucchX0mscBy/450HR2l2Nfg7/3Jht26JZNiYrzZZbi
	 VBfmdCFjtPSsx4aKoid2/elM1koURbao9iTP6CwOcSk6uWHDTxE8bnxKXvL5EZFN/PmOn
	 RQoJZN6EAsJ4xY4oEEO5smDY9tXRN6IywC/ryeY4gXhfOlAZfKZ0ZuV1Mp6hpIrp+JVTh
	 vkcm4guHAiaVLiU5UMEBrIJ6kyD33dSIa+UJYM9yidrkgFZodot4nwdFmqOZwsLJQwV+h
	 G49+87Uj/Rzn6cCDkA2drZ78oMb8fQJnw+yuP6jDX4+zogImgfQ5a9t4mimuOG3ibrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624287;
	bh=OO6PUEnC01Qp7efXAZohXt1osz8CsaThul0hGG2rv2w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GEypNOLigK8oc4iW8M/KO5A43SPGK2io4UPR9Rp56bndzGc0gO/KJ1djJWi8uemf+
	 HsTx7M+kSMTQ7GhNAocmiKXj5DHshRAkFVWl+y/G5Nod9//2h7jdhDBcy7VWo3n8zd
	 +otPw58utLF0iARZD9csh5d9DspKXhRI9aTlLC7e24qyo5aBLuk1A2RH9guTNQZxW7
	 vxGPYYhOJwKmR7Il7BCYoMM+gozyRM7c6pMsyu7kwltK55MiUiKvoWsQ7RDlMmY4Yy
	 D29GEQahqhuLqB8ZG0vhiX8OTwAub9BaQXsC75wNp3gPWzVW6Y4NnqdSBQ1pR1ksNC
	 ATCKGeXgedD2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B226409D8;
	Sat, 10 Oct 2026 09:24:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A02F75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37679400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSw7UFFzTeX1 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E179E40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624283;
 b=H2V1HCeFIHsJyFpgdzs+Cpp+ot5yqFgQluzpgmFivKUygn4llpNJ1guOAP7NZxIqz4+v
 97ug5SVrhA5WOKI0JSX89RA692i717U7yD8U/A+UmV5X1OgzcjAMIjS+Q2I2OZuhMN5wh
 ZlaKaK2X+dUY0ovAEatChAnFF9AiID2Tu0FpnYvNE71CxRKimAPoDP1/EXC0X6GvFQHx1
 bqtbn/5sl13HxdJM0m+r3rD+FqY4VPQJohDPXpG9NREHXCiIjX3tCiEugCQOBBHMUiPA5
 KzRAzrNmL+gIZIenphWnUVBAdnoHwkCIp8Ytmo9ZBbFR4gj9uAofi9ekl8/pRDEePbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624283;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=J8/FdN/WZhqilttr/kzEFIBut/5Qmi2EuQmOZOsbLkQ=;
 b=YbNX4NyNpRAN84u/0bCoQ/pKfmVI0SP3/a2+ceTx6/FtM5J6GJhVulV36BLO+2/J1eBS
 ARPybdCoLGuuFfz8eRP71wLTx+wNSlhRErADhd2IhojL5cYuxj54/hm9Tmyi8T454SP6S
 iH+ZfCyEtYBvwGuj/zvVH/iVPSmB1CMM53tNa7rCJ8siTWfgn38EjBQF8S6o5OIPlJ9RM
 IdIsfgzTryeLftyfRolAvaFBvKaXAaEjIBVxPsdWs6tFmcfATge9YtIjAsdZiYdM7lQtT
 Dl7/Mjh7iGwUGEd7RprptxUSBPYZyS/UOpMXX7WMplYuwzcJKYyl8wBxZB9g2I0OGiQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UCI1nx7S; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E179E40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 427204E411CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B623D6075C;
 Sat, 10 Oct 2026 09:24:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D654911D704A8; 
 Sat, 10 Oct 2026 11:24:36 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:24:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asoEUDGs6sd5tfjV@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-40-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-40-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 39/84] package/luvi: Fix build with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 06:20:20PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
