Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53681606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bXy1uMcz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23F94404D0;
	Tue, 27 Oct 2026 16:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YijIsYuWFCd5; Tue, 27 Oct 2026 16:06:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5BFD5407E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117170;
	b=PTv2z5YpLLHgRyeCiJq3IqM93VMNgsQcIuxZmAZwdlsdkCry4tmuo0hBOcOjRZk1+Fid
	 nQHhp7Gweddy2Unk577ez1roub69v/SMVYpwCF6NT0uu86n8LZY2O7X57QVAoht6hezTc
	 3vQtWF+U6qoKowy0XVenqkzcTCDADdS2LogPRQLcTJz/4MAz8P8JwpSWx5MgZCsYyVNcO
	 +gc7/CFAF9Jw1kq6P4/DArWkQIKsaQE+wKCfSzAJs6PTYvfy08R6Ozn+f2MZbl5ZJIlJL
	 owepHg2vEnHKjLiB4G3NIyfHPtIt4YCKw2DChmqgPrg05A0UapzOV7W41V1v06ELOdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bwNuJPVv2ln6eghtBGh3oaKXirp1MeLFTLEz3+fa1Ms=;
	b=G66olDTcvUv9kD3GvAsbd/dLRyk41wlloYFvfFgUB7xbtDg2QomEGcPzv9cj+YJpPMBt
	 1o7D8mWSooFyqKMtFzgZGcm5scD8fsGYQNjLRRRNY/+BZ6oghaslZXvhmUEbtfZ4XvhPh
	 E932abAoKaitZnajcKe8Hp7ruByVueFDM7Z3B/Xm5sHldALbYrr4g9HOEtEwPK3j3vaZZ
	 BRbbjnIot3fbpRYH1KI7MpQz8AKyq/1b1mjS2fRGZfmo64K5WOtN1MRpQTGamwTvPMGk5
	 plb7jAcPaq4Ycg1SoSp8F/xBkfYc3vCNSPBYZISo5u0LCwufHLtOKN2HqWkZTiS8Vdw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117170;
	bh=bwNuJPVv2ln6eghtBGh3oaKXirp1MeLFTLEz3+fa1Ms=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bXy1uMczC8XqE6U/9F1Zd1RDlesDzyS/yGSUIBHUojp7M30g0ELGYybSdhnBYpu5f
	 S+U56IlzS+c0iFJMpE9UeA/ncwSxzwJN8wucjKvJtsBq/+xZMlK7yDSq2dZPj7OVq5
	 c5zvua8dzCNDxEIuQSIIOkBXFEJo7xsVDL5lPf0+p7TK7JsdhHnCEJhMSi6/pKX2dK
	 EJC1RIG6v8MiZfHYWDU6EKqwcZAn/3B/gKkAA35IF3nrxWn7ziY4Xx0idap5A51oiP
	 dlyBw4iNr3kb6ZjGVT2PFTRYoBGWgox4lq1MCdV2rjb26KHEtxbIOSq/6Jmd5naZ5S
	 YPUoaf9tCo1bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BFD5407E5;
	Tue, 27 Oct 2026 16:06:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C09EF72
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1BEC400E9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb1WNFCbC9mQ for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2DB2340076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117166;
 b=o6OYYk8bwqf/6UYsFzVc9ITZuajf3K9sNks6Or+fEueeZUGwSmQK4VmRaQAKb6Fmb9TV
 dYrRPLWEG83f+Cyj2MH4/OxJWZ0buupH3ZmCRFkq1ZRfhZyEFmDVjiVblbABnhX/oAe60
 oHwNvvD6YPvdF4opgDN+PD5byxfeJEoV+BItblVFkG0L4WIMfiRUdT+5jtzV+RBn+64qh
 pRS6Sy6+q75Ltaqz3iubQVi6cjWH1hLI9CuUAjGG7b9BYxdwByzqpXvLiGuaz5EDTDLuK
 lwT360IndjHgm+UrVW0S+LyfN8/f3wKpY1cz9cZygFEIQguR/t2GBQFZFQq/qj3SIoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117166;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=SqSIIMLYMXzNk30+btwPeGDbs3GUbgG8KDhdZVgCYYM=;
 b=fybabFrEP3QqzscB+qV/CJkxmtyhPLmE/Avvz2O9mTvM0hG3CMztenRHnyNlx/4PuiDl
 ZCEHyxt6NdRlZQf4u50lGmq8m40qxd0V9tLqgnDw7rxldU23HP+Os1O8QrSG4XYAtACMK
 T9p8SIl7NfBMQjn0xDV7jORhY5Ppck3PnNIDcjOBzQmhBhETyp6WB5m4gsiydyEo+veGX
 IIxL5cbgny2h9aV1SJK0RTnY5ZziOI7FDTwF6kULyp4YL5oLDC8/L0GddCQtk3PwDhmBe
 L2x8mbzixcZ5y3liCZHJUXYBUuFCHhV6IFvIoN0C4hhJou3yi3zzLCOQyNQhPRlaIUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=myFn3H0u; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DB2340076
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:06:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 72C71C79AB6
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:07:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DE02B603BD;
 Tue, 27 Oct 2026 16:06:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7F691032909B; Tue, 27 Oct 2026 17:05:57 +0100 (CET)
Date: Tue, 27 Oct 2026 17:05:56 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <auDL4GXkBJFVrazH@windsurf>
References: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
 <20261027145351.1527631-2-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027145351.1527631-2-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: fix build failure
 using gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 03:53:50PM +0100, Giulio Benetti wrote:
> Starting with gcc 14, several C diagnostics which were previously warnings are
> errors by default. In particular, -Wincompatible-pointer-types was
> changed to a permanent error by GCC commit:
> r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
> ("c: Turn -Wincompatible-pointer-types into a permerror").
> So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

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
