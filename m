Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40EEC982D6
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 15:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 703BF60B14;
	Thu, 17 Sep 2026 15:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcGaZN1a589S; Thu, 17 Sep 2026 15:11:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8905A607CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789657910;
	b=nLHPWeA0WkgP/5/sT/OMwkWlQDYKDVn3bs70ovVtKjefiOkstCUWOSXr6z5orWWRlfXa
	 BSUOcr1DaTZQWj/ghvVpZGfvzkOenTON1V4+wukzdi5fot1SZ2pgJA0t+AULuyKH7yK4v
	 QlgvJ9lSwtR24JLFQyjfo8hOnho0Xi/+KjsXdRuEbJGUQY54UyDrV1JuS+rAzlWQcqCsl
	 vaeW8UtTwa0CayVbby8n7yb4MyPyHn7+gCuuIAQnfzDX7i0lWs53zwTJSbVnfSPcB3bMx
	 YZA8mtDs8MBaguHNN6tct1aslzDbbYronex9Dj03JK+v+bsvBXvRd/vcAPYjd/MZD6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789657910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JsnfX6dVDbHysUzLOE7ulLEmUoaz4YztF7ELpiItcfA=;
	b=DDgR6J/NbZYZJ+7oKrBfpmn0eTAYhtlqgpN4hQR+whMxWDSwUfc6rBnanEvGCkOYzOhC
	 CXtT+O1LpIPOHpe35NQOWNF/uBbCxIYGe1Cj6yiOXjL5JPvgztWbIUuJ72I1uYSKTpLJB
	 sS/4hLOHLFoPqdutCvx9Xm2iK8pBLI5V24uLorLf5oVXWWSrdAWRCWFFNLIi8nP+LDXLc
	 hlJza0M+crZxWlhdUhog/EV7lbHEf/jKig+XzdvUy83baPqH11r3VAQDk8ev9598s3rA4
	 rb09+82FGPoZ8MyETbBYPMIa6NomZtMboy04XIJJDVRbJl47GBXbu0UFA5MdMbnPhZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789657910;
	bh=JsnfX6dVDbHysUzLOE7ulLEmUoaz4YztF7ELpiItcfA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V2QcUYzSY+8o3e1IACwyMC8FmkNQ3RrnRbKUN2bsthvTD3ZhxCuFm6y9jNyM3jB8F
	 IrdeudH7lxPbhPI7USELcMwx+ZhetuZVh1ACHiv9H7yCSXeD7xAWPz/rri0SSzEEqx
	 LeTUZgH2qxzLKxHIwTIGcDeSIZPapbnjnL1nPq1SQE8qO2wtXBH7SuhxvWBlfe0E23
	 LwcicdkkotwS+7N9S7LIJ7k64A0yS6psLTm4p0ST8wF4yDhR2JFh0ovhZE+6hSNyIs
	 K7YtV8z/g4v9S5QOK00tSROiRB/C2SH7HPTvcXl8c3+kE7XpQ01POGnTYJKUGQtYUu
	 E+qkEwerQNVlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8905A607CE;
	Thu, 17 Sep 2026 15:11:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C1EE37A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A03B40357
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGdPfnyFo513 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 15:11:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0C4944007D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789657908;
 b=bh/i8iYzDsCzdSMDYDy/3UlmYp/0DXNFZKtQW6WtEM7O1EET9I00JqCny0pZKyQKnpUn
 oP55fK6hSNE9Om5AXfvBJnz7vK3OCB6HWEtvaTtyqe2uJKMwCCaIDm8nKiWj6N6eWsMiN
 I0h+YtnxlsIXXXfrgsupejqSsWwvU/WYq/HjWF/SbO7Aeb/Jlm0t3XTl7Xj1lTO6uaf7B
 Q8BzAgNrotgjnab6XAdyyJF0JOoVy0y3A6HRDSOnW228r3nuPA6erlcDcaeGUVjfZu2vh
 0MmJC2G4QBdCbCk0q0l1KZ8Z7IqPSsmUCO8p6vDLpzj9OxXXN3cv+P42/nj8LZl5IRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789657908;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=kaKlV/2JjiorTDg/rQ9AhLsh5TUcaVUpOX88OCALW8g=;
 b=CpLOO8pcLA05BAStN1Izf50GcvevZHSv67VBCpOrHwDgNOj021VeGKoTdSy8XKGfJd/8
 vFdYJEqRTqIQ42SecZtAvd7eoDYqpyzNIxr/R6FXqPVFynsV+WLRXRkUOpqUPF5QI3ajG
 Ra03cLIhNBhViyK1giqtvVLTXFCCykQKs1hS0P4b016yAxViTv2gujF2duAl8JyCnXMCQ
 UekJ8HDaQNYk9pCwal+MwkpPZs9Y4mieNQmPVu8sh9SO2S2hAhAFk9krsZnP5wHBuwA2O
 sN85H9SCuhXmaBO6qDeXHTVCDc6Jjmhh0D8e5PniwcKUNEfmRCdxOhz/Voo8pH5X98Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="OU/CEPMP"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C4944007D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:11:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2FBF54E407A9
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:11:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0345A5FAA3;
 Thu, 17 Sep 2026 15:11:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2866C11C7B083; 
 Thu, 17 Sep 2026 17:11:40 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:11:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <aqwDJzFyf92zC1sr@windsurf>
References: <20260917133205.2732394-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917133205.2732394-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: Fix build with CMake
 4.4
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

On Thu, Sep 17, 2026 at 03:32:05PM +0200, Bernd Kuhls wrote:
> Buildroot commit 526f8b43edb7ac1dbf9b86afc183a95b389a7bab bumped CMake
> from 4.3.4 to 4.4.0 causing a configure error with this package:
> 
> CMake Error at Source/cmake/WebKitMacros.cmake:311 (if):
>   if given arguments:
> 
>     "(" "NOT" "_linked_into" ")" "OR" "(" "WTF" "STREQUAL" ")" "OR" "("
>  "NOT" "IN_LIST" "LLIntSettingsExtractor_FRAMEWORKS" ")"
> 
>   Unknown arguments specified
> Call Stack (most recent call first):
>   Source/cmake/WebKitMacros.cmake:393 (_WEBKIT_TARGET_LINK_FRAMEWORK)
>   Source/JavaScriptCore/CMakeLists.txt:409 (WEBKIT_EXECUTABLE)
> 
> The error can be reproduced with this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_FORCE_HOST_BUILD=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_WPEWEBKIT=y
> BR2_PACKAGE_WPEWEBKIT_SANDBOX=y
> BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y
> BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM=y
> BR2_PACKAGE_WPEWEBKIT_WEBDRIVER=y
> 
> To fix the problem we add an upstream commit.
> 
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
