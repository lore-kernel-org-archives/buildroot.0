Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1719CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C76680D83;
	Sun,  4 Oct 2026 16:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zx2Ia97bsDYO; Sun,  4 Oct 2026 16:01:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B795880D1B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129677;
	b=io1V6d+vrA4VdAPuO0QIeYTqVpEJXsJ0kHo7HBz3pwOpcS3gFop1MHMY8K33ozN9j0Mo
	 QCFIrZ8vCOQqyuAvSYWtsorNi53Ohnzic66azKm8fEixQHUnazrmZBRpIKTNOAlwvXnWj
	 jwdvxrafNL6TsVabk8FsqFZd6JjeOL2moHxSsU8ZywyTINAfKx0C5XOkOmUolco1JPAuH
	 5M4Ds/cBU84uinY0Z3HcyVXPiEnzHTFMghe2YYqLMDApENE5ne5srRI9PbBfCb4kdX0YY
	 aWLEQ+hJyjqkPJyeyJXgc+EzN/ZjbXagBlRg0m7qHgJULalj3fh3u973hh2tfRoHPDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129677;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=S/bSBFHakgbfTbtaGbRDDbZWK/RHodZee72wzREzoyc=;
	b=VPIuajM5K8Yun1SDT7al3Ps/jy3sJ78ngR1cUvu4+R/zGmEcD8r5/Rcx985SBp7vxwCq
	 8lYtqrazrHTfRvPlLctFP14ThHP1eQO7kjWa7XlvWM4uN0gq8sZ/ILPiazWAt58MpMWo8
	 69RI8CZFYooI9foLcXa+5w61a5vGQMdkgraaxC5kI2fBN46HEWCigFa9MQWwdA34+5NJ7
	 lk+t8kFtQEyEqvjchEJXZE7T4TlIlDMcXQ/+ilqVwQ3m4+SY6a3SM7AdzHKtV3RFq34Da
	 0HTp7AH2yI2fV0TZOpbU9/vY78caDd+rDEEmjA1TJVIjOYWbzy74d0gby35oGe9dVnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129677;
	bh=S/bSBFHakgbfTbtaGbRDDbZWK/RHodZee72wzREzoyc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EUMSSsrD8Oamx2H7NaC/O4oDocHYi0AZnKAnEvrP+VdcVwcUkJppFHfXAJjUVYob5
	 OlyMkhcyjYufX/Ii0/xoH/BaDPaLjLu0qgNspppQL+I8KJCeATfUk7S36fGVZiaCKZ
	 h3lFfjp3QdJfm0k02M06T9CHtaN3xdc51cHhQusrw04P1+6Futa6WTyjL8LmvzRSiP
	 hMfryK/p89laU+1vf+F4F4j19Ns0fBmPQ99QJxAeBw+I+c7QtgQcidJeeI3Xh0C2ZI
	 zH7DYe8UVwuBH25SaenkAJ4cVrWhBDFPzZBQRjVmY6UdL4V6cF/XljqTTZ84VF75KE
	 JULYarTXY6EVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B795880D1B;
	Sun,  4 Oct 2026 16:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 837782E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69A6C405A4
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBN1ZsUjysaR for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:01:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 904104059E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129674;
 b=DQSgq8NRCzmL/ukbXdYTWVtR3DAvLUngy1tdJHX4lDZ3nqerPThSoL4iF81XUPsx66Oo
 kE1fnVSqSeZmIzaBt2Vi61sppBgSRHrxrcnn+pVET6k4bds/3ptagL4Wdj+dcR5c8JxdF
 dTgZB1MW+fD17TJGituU32XnGPSyRxLYD03wOuY7bEspqWWCzIBqyxf94NUKzeT8fmPKx
 5d82PgGc0A7FqrST4CSonlz5DkTgN+XNw2hEqNnFaWW6JD9F4LdxaiASHxK7zuHUPh5Sz
 hB2Cfg/iyMRnB/yvkW50AaOwDZzuyVAJAd/8MawMuljzLTjUXZpWbUCyhUgLmBHbXQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129674;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=njXeghyGo2OXdvSvBYN/Kga2n/OJpWXfWfsI0Sg34Gs=;
 b=rQPOhLSknj7LIUKUWn7Rvr2xUi9mlpVHtfZSXtMXMOL0LEF5kjzu1flV9XO3egBTCh5V
 oU9U/RcyPDbvNOpgZ+3wSR6IfdizwPaNb8M3BkpMH+aqYC9iFi+we7zx1mE58JiCV7ppy
 hfjS12vfCkRDOHAAXjPOiFwRB3miwC0sNjkvmV6aMFKNUgX9A7N9S4/YkC88tUq2/JShc
 cVVp4NYMoIFYLur+TPin4u7Wp5XmKZVpkeQD4Zw7jsLcqBjD9/SEGQ/RPNwuBWLpXR+Py
 CJYpv0XsPGZnYRGai0Ntm9OXqjAYdHWVed5TFA4Yx+9PnqUbeg5gETi+/QvHQEuObXA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zFOqTvQ1; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 904104059E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 741CD1A1133;
 Sun,  4 Oct 2026 16:01:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 469E1604FE;
 Sun,  4 Oct 2026 16:01:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 445C7103281F4; 
 Sun,  4 Oct 2026 18:01:11 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:01:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ4QouJ26g-JrQD@windsurf>
References: <20261003210833.735937-7-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-7-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jaraco-context: bump to
 version 6.1.2
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

On Sat, Oct 03, 2026 at 03:07:57PM -0600, James Hilliard wrote:
> Update license hash due to the copyright year inserted by
> coherent.licensed:
> https://github.com/coherent-oss/coherent.licensed/commit/3b3a6b658d63ddde59499f8ff45b505abea3eb9f
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
