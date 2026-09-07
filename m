Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2221C79F9E
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 06:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C2580A7A;
	Mon,  7 Sep 2026 06:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-YUQERY2pwl; Mon,  7 Sep 2026 06:03:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CEC0880998
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788760986;
	b=k6fsPCXzR/rsdmTg8YiETZj4fgM/S/nGh+i5w7yXay2ZUoTGIDAAyJtD8UiECdCtQjVh
	 3/7zBo5U/FyEhNM8oL+WrWVSXB5m1RpO6F1n24CEcqJqQ6FD4MhZnvv2h3m3VEwJV3S3t
	 Ho4ceoHhsgwbJ7RNCgwl8AXl3zz7gYFjiKhOL/GZB6BMLQwTMZckUdBdQtfo2vivPOfEQ
	 oswPi7oRXEUmkaUB4hJ+psz1oxw8cvina3UwvyS3i1R9EoicugU4HMf/iXEfD1YGKjVyN
	 kJcfnD8DpPTaGPQXc5p0zvkexEBrCoRUH9ufKqUxr2JtrC3FyRpp+GX1qzXuWRMfNtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788760986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=g9q+bvphjA+UN/w7gQg37uPRBEaDkBuFdsR5+CiKwwo=;
	b=WWQllDp4TawT1ov1aomlCLU8QJPuHPA7u6QnqovMIM3oEf8K5yjchDBzcvByRONIwa7h
	 ZroNcFlPdYfgN6Pz03FaiAqLcGz7gCPq0qM2cE+sBCQuvMk6//Bg8SrZXtKxznM1Qksc6
	 KLDsQQ4Kg819kP9h6kE0EzcTyglous04IEQAPlSf/FhOKcKmFMZcODJwqlGiehsCENpS8
	 Iil9Pu2WiH+pWPemEX9XyyT4tp9d6ov+TROrrOKil7RAFBRWQRVa2XsY6DAIAy5k+hdvS
	 GVwBsu+6hM4DhNwSeuvbfGvoCzGDZRDwuP6Orozc8PuuAZ2CQip1JkKZRTof93FOjzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788760986;
	bh=g9q+bvphjA+UN/w7gQg37uPRBEaDkBuFdsR5+CiKwwo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KnN4g4Wd3cNc4o9jIiYSh9FElbMJLJAuzGs35gTAFbI4/Cn2BZU2tvTUWAdirWhzg
	 6uD/Mg0X7LrutXI5EQwabeLtQyiif7v28Sg07N5htJ25NO0wgntN3VXXCc3EbxRRbA
	 NnTm8RKOC3SssrS8zxoAHoNnCvzQKy3Q5ICUu7+K8wRcS6G2AFk3LEimfjnLvtYb2N
	 k5n3b+DodP38I2oSp6ovLohoq+W3stO+ATWJa7bkKmJ/sDOQzpkW5Wc15Xiku/gyj9
	 KwJH5ZTXGXxDSd4jp8ecEz5tWbLrbj1i4nMBmIf7FmjAw17lNmT2igw2eFIgdUqTF+
	 isrlojiinkCsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEC0880998;
	Mon,  7 Sep 2026 06:03:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E88242C7
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE6BF808A6
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTJjK_Fhs_ed for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 06:03:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B17D280998
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788760983;
 b=tJs63RWhmiJO+GJ2VlQcaWj8qg+BYIQzyxXIGnq2NuO7NOkh8lFDkrp02rzLTJkZlLxr
 dmru/zVhnXlioy76W0SMhPJZuHtmKNoglOw1lvLMjnfV2TGDnBd+bcBL+5Fvvi6ZPdnqn
 qgLgx+BXh+N6k4tMXwZsiIq51oSawo6JOVCggyD37QlhqSwFZwq1zAZHbs1/b8m4eFJak
 1RiaGftfylFnNnkuBJD7DdGMQzvxk8mk5hc7WNLQsE5NY9lPO2nEUGsl2gre44j8ze8+8
 IBRXz07SfEBhZUCy/uV26dYAD4cXS56eBKWFWOHmMJsi4OxvWJjQSe3vbBTY5rOhrFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788760983;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=kTfa6aOs42l5nZmGyjGSEbBBIXxPhzOTzFLOlXeUvFI=;
 b=ih/sa7JxVPxOVeFFYmKzoR3ClrwWsPUrS0cDk/sYBl6TI4OIPrt761zbZmU/BCOWNx4S
 2zfKkDvhW1lZ8ObBLbV1jDByZ0rL4VvfgYE4Lw/yTxKLTT9XHwDpX6TfPFcD/43q621l2
 FshSU5EBiVWHpVaOEXck2GapTVxEkSsn+k9jCq0evfnpQIR4qfIzeAmjStVfSZC968FZk
 JFWTHyO8Q5sFbRFszcx817WZiVVZ9kfuKFWNCi4Z9L8WjfAkHtttgQAtgM+19fZSN2K0X
 Wd8pKfqT3ORdDLKYJrwS3Yc2keOabbvKU07naH2cKmIP+h9EqCkdxSgI4XeSWhg2JSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=djUUkrXs; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B17D280998
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:03:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 11C384E4155B;
 Mon,  7 Sep 2026 06:02:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D1C6560383;
 Mon,  7 Sep 2026 06:02:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A764111C7A0B9; 
 Mon,  7 Sep 2026 08:02:53 +0200 (CEST)
Date: Mon, 7 Sep 2026 08:02:52 +0200
To: Joseph Kogut <joseph@anodize.com>
Cc: buildroot@buildroot.org, joseph.kogut@gmail.com
Message-ID: <ap5TbdrtlWJCSkSM@windsurf>
References: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
 <20260818-passt-20260728-v1-2-aa8bc1ce2c5a@anodize.com>
 <ap3Xvv4F7Mgi3mve@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ap3Xvv4F7Mgi3mve@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/passt: bump to version
 2026_07_28.f8df3f1
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

Hello Joseph,

On Sun, Sep 06, 2026 at 11:15:48PM +0200, Thomas Petazzoni wrote:

> Note that I didn't try _before_ the bump, so I am not 100% sure the
> build issue is caused by the bump.

I tried before the bump, with the same toolchain and it builds
fine. So it's really the version bump that is causing the build
regression.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
