Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE705C982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F98811F5;
	Fri, 18 Sep 2026 07:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DC3HERKeEjYS; Fri, 18 Sep 2026 07:34:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D01EC811F3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789716856;
	b=WHIFxV4FTItQChCqQTfjMUlB3AsPvyh5JkFxm6TUlw++ndPJPyrLyWp2olZBg8lnQPfU
	 PAW+tDvx5NF9mrtuG0195itHsyV7CjsOjLv+n0La227GywSff9PesTvNT1sOoatUdQwS5
	 dChfO6jQ2K6I+nWe6t6eVeWw5ciUY6qYebBS0a/4mRVEqn25Ecoit6WeQ1araHKfdyBv1
	 LxxejPKQykgbflew9/dCgzBQ130lNTdoSRbByNCp4QP3b0eMMqPEdhR3pUSwP2X962flC
	 JyWtphBYjKy2ojT650Yq5jxL18ZaVAtyIyl03u3AjvsaVhJQlZXE6qQHe9ZHcAgA5HQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789716856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CgrKWVqCz+H7ncbDi9zkXx81tZj2BLaEvunKqDJ25rk=;
	b=gJkWPB1wIun9beFUi6kxDq4TOJsf8qW7A82VLptiWftBC41U77E0oRNSK3qSrvxfBrOl
	 IJ6I+rkHu1k/dC1KDD9Ijb5TYKR+/X5OGKPhvtPXiBTN4pUVxAUsiDGfPx1wbYY1Bj7e7
	 KRpniN4KyUDhyielzIiCSBsXAlrbtuSy7RsLYKI8+hCbMeuyvKEv2FMS3+MlwYJtSy02+
	 v7kYtbYutQc77DTup0wWxYJ9DWsqGxbQx1RkZ+u2q4X+jNk8jaPBR7l1HojeI2NpZpHw0
	 5Gq0pEq2NlUINsDU6wPMbP9gzOPsCCQqFszO1VF8sr9Kact7cjWEKoAmwXiroo5Raew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789716856;
	bh=CgrKWVqCz+H7ncbDi9zkXx81tZj2BLaEvunKqDJ25rk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lO+luTdhAKqSQMQWhx3aLS5BGNWX+2r8veDQKrYnXsn4A2e2tjUmvZjXSsI2NH/y+
	 AkJgVutYTkmL350diWPnn8tncmKMM2rS1U3HlIZGLAVkc0Zz1p5lW1WcPzIGEP0+3P
	 N+GZ3b3RPowXDMLBJNCK+Agc0hElSAJ5DpeU7qmlrJTTB5SqTnuob7Mk/FbvLqeDbX
	 /HvHNw5HaKwnp2rgt843hTjWq+Xpd2uwJ+lMB8d+Xp51irE6Q1ROfSkG+csOkudheS
	 zqhPgFe7Ze0b37WVQWIFFYix/LDyecso4ITqvR3Ln6EJmhVKB+m9Oub5jEAYG0FA1s
	 a18oIa8kl53lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01EC811F3;
	Fri, 18 Sep 2026 07:34:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3B36362
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A2BD60BCD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZu3fkQ1mhRx for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:34:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1851260BC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789716854;
 b=YQvw7BV3aZHZpPO6/zODmwjo7ZHB6dUetFTYRevnkfa2TxHt/tasUbxsrmCvC55v5kK2
 ieRBiWzD0236hIrEzRwlQPn9UmlhxFhmvs84azF1qSQWkDdlfV3CRBLgUKrMz9RUzsLO4
 iRoSvcaNCdsF5UyWkAk40JS1pVTKs0movnEawEyr6XmCOgtEQOf9A2U9iHfXx4otMYBrJ
 hJT22h9huuOKPB76QuOPf7AP/LacfGW1/VWxu1lF4MnCP5jOUDuEiJHqIvHCwWYpq1zBG
 udB6abD/4zDKIQL0+VdzZcRYNHsJeLOb3Wujll0xrl3zPCpc1QZOFYbrex3P7XUvF0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789716854;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=c1siwXSRNfrHB0HaehF3HY7X9vypK2qLBrj/uex49Xg=;
 b=JhVIhmBcFvro2+mcrs4ZjQJURECkE7RrLdGpWSfmKaDWdtKNqJC5dyO0Pb49WY+f4vJw
 /tNHHOkF7oS6yZ3FazdW8hq4uI8uzIkjtUzNq71EC9qKgnOkEjI41cABKH55tr5w+yx9a
 sYARqD0FnNFjBKCF0KskZIf1oiGrZCjI7HMrleUiaLZ7+PJtUMA6pfO8jW3PdQ2PzPwm2
 5P4l3gsVPF2BGwg6CXDfy7Tb9RTCOraOD1uDsy/+CPXrvWeYsaGLnJ2L2KPKWrQQfwPGI
 Q3y69GpirsFjqEjwioJOdRU4mznXdkL1tYFgxYW+Ni9oeB6AQjdPqCr57acJQZgYIog==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=R7BrnGvI; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1851260BC4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:34:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8BD324E40832;
 Fri, 18 Sep 2026 07:34:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5F612606CA;
 Fri, 18 Sep 2026 07:34:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F43911C7B021; 
 Fri, 18 Sep 2026 09:34:08 +0200 (CEST)
Date: Fri, 18 Sep 2026 09:34:07 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Gregory Dymarek <gregd72002@gmail.com>
Message-ID: <aqzpa2k27ntuibPX@windsurf>
References: <20260917192951.948194-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917192951.948194-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libsrtp: bump to 2.8.0
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

On Thu, Sep 17, 2026 at 09:29:51PM +0200, Thomas Devoogdt wrote:
> https://github.com/cisco/libsrtp/releases/tag/v2.8.0
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

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
