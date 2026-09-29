Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED591CA5FA1
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 07:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E03240561;
	Tue, 29 Sep 2026 07:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rn9-USZHADz; Tue, 29 Sep 2026 07:20:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 899D640558
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790666446;
	b=K63bO3iOeQRxzIYqtCBDNl4ScEHFoTYrZH3mkTqbd6V/nULWbMfIHjZ0aNoA1/8efsue
	 C2taATQRUm4niV7I8FWdu+/29/82SmLk4YiP8OHgjXH4oH9LNdbI9aOmrSKXo+EjbwAOo
	 9208tqwKobV0EMVNERRJd46FNN+Pi6NMONdUe2wlkwV+zEmR6Y7RjVKiH5fD5pUq4iyed
	 AjV75JNYpLt2SAcW82nWaT8aRsqMiI5W+c0IoRhqJCculnydMwuU2aaFY/y/KCgpC2qNm
	 Ii8Syi98vB0NU7YYzSehRd5rtLcNOm0z4/VJQyRLJoj0IOaoCjS8uFSY8CcAe35FeCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790666446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=F877voE63Qku2xCstDFMGT827ABdK0g094Yj/oS0cmk=;
	b=k0goTVvJsTLeJe9e17OU4Tqyw2ifFMn/MF+2WCBg1jM9HQUmCx+DlwI4kjpH54c67Dp7
	 PHwULcm5letyfLTZYiEEvkum/G/tlUX8YJ/aRIo1wLDSohgVjGjmcMBzpzJ5/gmC5/Tt7
	 AeEdbwSRj0b5Km69pRrz+MItbd6XiVbAT4WNO53QLFpIXc9W1BdQfU37sBCdEmtZNZGlS
	 Y1GgN1SP83W2FVzTNyDJKI70DeSf5uBpaOONRFwV8J+NLpK9Pj1+b/eZC74nyJR3uQsiJ
	 /jf3hJiUYnIdzhoGkNVrFDjAiE45aVJtZoV46fzModYPKsefyuZkeboWfc0XjS0p/jQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790666446;
	bh=F877voE63Qku2xCstDFMGT827ABdK0g094Yj/oS0cmk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=P9EfwXDg6qHMnSKEwGmoikTzg81s9LH5v47RU+BjfWWPojxuq4xHh5fv6WoBVFUMY
	 HGVu8d0neJdpCTyuGmWkBpUJQFx/fI0jglxtC4E0WxTq2SShXRqd6qtbu0jSMIIsql
	 TE/PmQqnYiUylRF6QQDIw8VZypWp9/Hd635R6dzRsfWpFdYlLNWj/CVIn0tlYg6u+L
	 TXWprHDaBfPj5tGta5+YD4K5ampDLuO3qSDYJTx3dk1foppDzZYpvz8NE+LM6z/OwX
	 uxQAl9vEtAo78Ri3vao4sBPfgPDRbg1W6LxMMiC1BT2kasjaRsxdHyhhmTs7RCIBx4
	 4d7SyME82tZpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899D640558;
	Tue, 29 Sep 2026 07:20:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B1443D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 07:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CCB940558
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 07:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrHdJ4MjaeTe for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 07:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A686440557
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790666443;
 b=eLGV268+B8nEXEabC97RRCjcdsgTQ3Zd3LfJKj7ZNkjzSK5E3Ly//CmpJY2GIodRJamg
 fa9LT2gJQ5WGy0b9bOil3emEC8u9Sxsp9Xv8obJTiHJTte5m4ICHpBca1pTZXQL8FFC/z
 O66o8XR+qE13JdzXak5E9jV2mrPS4SfcdgqUmOPsybmcAne7Az/m4D6HDQxzasEsMODtX
 EXSIFgN4P75EApkPamJs3w3/PuUTsaqsEaC5/6SMk186V/Y59QD/tEc2ZI50M+RvjhlkH
 +VeJIQSqIniBftTXYYQSBlNwLjaitzfQd4XFjFt0uJ7LAnqjazB4+x+Zuk+QSvI/vEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790666443;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=hfPDKxdP2acN+x+bQn9PXCr2Fo/Mie4Npatvb8fSa60=;
 b=mnHLyvGqteZw1epdvsa9NQQ76TFkqUeAhcTwC8y2cE/fhuzAgf0+VCHQqTSKVQYXmsRx
 0k+5Dm3gOcOUqq2/rpLTUsUnUskDjC0P6RPFbuS5EprXRdQJ0LrRSnF1B8a64plYp3xo0
 vJbvbHh7CXJnrhU6KgF+Aall0LOqtApb9lnfL4yqur3LnS6Iutn/EJEzRu9bilfi/ZRoA
 Ge+J/UJT+wCjK5pVCEaa2fUGmV32FjAgJ+4VFaJnpkQmqX6YlbT+3vEFvkZnVUIVTZ098
 dJCUDF4V04qKqLA6ofU5tL3m7ZCv92lNE+TBMcJxcslllUtOkw+LxmWf08NkexVOOMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hNO007vz; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A686440557
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 07:20:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3084B4E410B7
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 07:20:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0490F601BD
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 07:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57B0510329776
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 09:20:37 +0200 (CEST)
Date: Tue, 29 Sep 2026 09:20:37 +0200
To: buildroot@buildroot.org
Message-ID: <artmvg5cCyPmvUAE@windsurf>
References: <20260929063446.008B990004@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929063446.008B990004@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [git commit] support/testing: bubblewrap: new
 runtime test
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

On Tue, Sep 29, 2026 at 08:35:41AM +0200, Thomas Petazzoni via buildroot wrote:
> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ad0796f2b40eb8dadc43e95dd1d56708b191375
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

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
