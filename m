Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB9CCA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 835B1413B8;
	Sat,  3 Oct 2026 12:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nwavn19IkFnW; Sat,  3 Oct 2026 12:53:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B607F412B0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032014;
	b=dUOqn4Ow9yPXdqKkhmkSKYXzIhq08kVx7UiIylgcjJiYdFChZanLao4KxPj7DnxKuJy/
	 uOPEBFrztAD5YIKtFMW1tXUm5Xu1sdg/jj3FGp84LyPxSYDqcnzGR2ErBz25hJNyb13kQ
	 EQki7imgWGzms8F5SlLjR13hjx2Aa9BGruM/RZZm9tKNRbIUbR42QFHpYK7MMUYuQZ98e
	 GatofoKxEwIzOJDg0HiBjKS3H4qkJ78GVV2B32PuWLxc4wir3UEvTarvKFbTkRrA8Jn4n
	 KmJZlBdROvoVE2xrEIDBkTWVXTjo0Yke222sP3w1LRHpsQAwhoyl3vsdY4Qzz2nhHQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032014;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IpXJ0+xIszt2nV0UR/tN9783AqDSwdJC3hfOJbenOf4=;
	b=FT3G0HTXDxUGUHVwho2rQCu5pbsuHS0k+mVsA6uH+iYH3b5HWSWlMH+zw1fcv0by5GqV
	 tTWZmzC5cEhxEVB19R+x189tLye+niTd7B5sILAs4ZUC28tbnSGMsSs8h6WE8uGplCPyh
	 7L+r65IGGRPYam/TjyRfTr4Hgw4XsPy/V+aJeWNyzuIa5fHPviOpwaq3yHNud2QKyTzWu
	 ST6r5+jZlbpRV4D5fJRElppNVG7+rQlijNSGhLSBE9tsWeBMx9bcgb8Di7xkPx7AOLKAZ
	 uTlZZYjDl4Bubgj2kubElcs6sBG8MI6IThkAo0hPB3pzYW5CcTw+g681MQiQe7YRLbQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032014;
	bh=IpXJ0+xIszt2nV0UR/tN9783AqDSwdJC3hfOJbenOf4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QWIYN0tkUwI5FtkgICCO2+QEmUSu1bBZpCTj17XCazLuMA5MH4qweQsjhp78uqor9
	 ur41QazspNEh98YXsk5nsUjgskk4wjtd4ASQ/zaSlNjOosYRTx5oBdKE9XAA/zLef2
	 k/5hJNxz8+sHpQ5WlAg1AmMuo8XYJdgTRcQ2C4Iyysg6nTUIzE9oig0py5RCqU5E9m
	 j5R0ukUKJK2HznC7uX/u73QzIgsiInw2Do7wX9I5qcDLUbxZt6nuMaPSwAso/rUQ8Q
	 rnX+xl5k+W/UmnsbAzn7LkOKeudhcp8JpBsIpuwGEuCq2CepwS8FkMgbaMv0IeFTdg
	 v/GY2uzj8FwYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B607F412B0;
	Sat,  3 Oct 2026 12:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A3801A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3073840064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7W9h21jjwtWF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:53:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 17EF440063
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032012;
 b=YpEgX/IKgNsbAlfABzuwtdggfbvV8MwKS/dywIwv2MXamfvwc9u1Qq5NGSsvff+1N/MI
 aPFtZdEZPKcF2t7tc/QQd4npwoDMXv0OMGcr80HlNvDRmkKw6xPNgi3fLzfa8Xc+Gq3+B
 vKM5LKMStackEhRHi42ndhk0WDOsnAIvkkSUYkEYITR0IKRMIt1EnRQzkTQa3bGki5fCF
 k0dA8D8Tufq+vdlI0SM9W0HVEVCSLO4C8a0A7mN7hj3Ev5Q+7PdQcZ31xApS7J0M1yayP
 Dr8yvXdOiXL8OtJZ8Am6ZGRnoBpgop3QABQfq5qkuumo9RcdCRrUvJpMn+vwoOiosKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032012;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Wi67lXPV+ITus/TpAv7FlXyXthcB2EyNBIq2/qFv8Lw=;
 b=WzThpcU4NDQY0k4stM363Au4IVAwkd4Y9A6hlaljEfRzI/iJaqH58nqgOYAujjb6ipof
 H7pLzTV3EoGJFLazduic6V+j8jlgTF+3SUm0WVlrCHbVgYGdluoJW3BdqoFXCwqRihZ8P
 2BcqJHFCmtLhZnzvwJO0Ge/B/1ccyn5gB1xpBW0Xw1zliob4GG7FmzyvJfZWSn3xkMKyi
 NNzfv0SQZfVS9KmgdBwl5agHPSZxEHSDJ1zVGqay72cADM4HsRuCSr8UZF19OOrytZsKE
 TM+ArujFJokX+Yq90C9FYQOAG0N34SydSuMvIQlPuX33VvNwsMo6ofTn6VF+rvB/FKQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lO39bZ67; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17EF440063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2AE914E41129;
 Sat,  3 Oct 2026 12:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 004ED604FF;
 Sat,  3 Oct 2026 12:53:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10D3010328318; 
 Sat,  3 Oct 2026 14:53:27 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:53:27 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Daniel Crowe <daniel.crowe@maxmine.com.au>
Message-ID: <asD6xBgFYyCIH-50@windsurf>
References: <20261003084453.545653-25-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-25-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyproj: bump to version
 3.8.0
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

On Sat, Oct 03, 2026 at 02:44:10AM -0600, James Hilliard wrote:
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
