Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254EAC88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E473A80CF8;
	Sun, 13 Sep 2026 19:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixb6a2Fg42Ka; Sun, 13 Sep 2026 19:35:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEF0F80CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328158;
	b=TQvwKnaA0QqOlSoDOBT3sSCD3LC6zaUsBQuW7wsRC2eyhSbpmsyBf1jFq/vsQwMR+9JK
	 R91cF5USEyFxV8zTzXFLk36Dk3GcnKK44u5kOL9BafPQNlpDvQs4x64VGnZJRc734cV7x
	 j30/nICm7gQU6YslxwU29K5cRinuOEeyz9MR3WPQypXiV3PTYUziiUANSh84PCSNuu410
	 awqNMS+u/hOahFdTnse4ZJjhLSlvvHdvuXY4WJkTSogztVjKtAmwERlJb9aZENkY1CNXn
	 FZm1GlshtZRl8HVcouSTN5EJI0r5hkiJz6xLwzrKw3BwcBfcefo6KiTd+nT5J8DffEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328158;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lMJBAg9Id76ycGuFL1JctU4vETpYt2zJY8ApXSOC7n0=;
	b=Qh62/pJu7VczCnOtZ6zOXavojDNCxNPLrGGY8TDEn6AwmW2u0WZS9Ct8PeYRgq/uUnCS
	 cccZbn+s9MdSfgN1yGMhegkGDw8bj/jt/Z06ZHSD1qdxyuGiExmfu0QW1B8HMvy83MshD
	 UL2ZRuEZtEV5eIi/o3w7dXjfAz7i2ZBKZdDLQ3zvuH+Vy9W2LfCsy5ATBzhovHD3a3vXk
	 3G5v0hp0fCDuSysxQRC/MzQnLW++7MOWqpQL8C5heADbopW5yAFZy2esI/kxusmnj1/O3
	 BZ93LkXJKGqe6187A5OhZqFgEpdQl8XoLDsDmcNXimEIWPJyCmNEtDlZBOojTnBh3FQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328158;
	bh=lMJBAg9Id76ycGuFL1JctU4vETpYt2zJY8ApXSOC7n0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eVtSQq4i8BEfwvIb8GiNNFxkNxTkZwQYWrGC9r1fO1NB74YD+hfYt/jGAcLYeD23l
	 5CNoDn7jxwwca5Gw6bC7LHeC5oiCogCmIdydeU1SQBsi7XlqgUMw3ftxY2SL0kOVHp
	 cYVd8QQN819kUo8EH2jNkG9lfniVRF7E7PyR0jXr5mo2T6Jxl65fKNZtCsiKjC+XYt
	 ajjZrij4jzB0fkrb+q3klJ66PRVAEqWErf8MjPiri6O529Ss6EV1gu8RDxIEz3p2p7
	 d9KK8CRezdXXLgwHqdzIdT+RB2dk5xN4U/JtU+wJgXk3IW8WBTRJ/J/Wn4zA+Zppmi
	 y3mkTiMIrmSoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEF0F80CEE;
	Sun, 13 Sep 2026 19:35:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 582A3224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4958F40063
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRwoX4Rbt5mE for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:35:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 579FE40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328156;
 b=FuiXHKeEzCh5SC8mXIJdBgv14uZ7wUuhwZ+8qy4umSAmGK97czAWVMJ5vrZ1F5UCDvLL
 DG4iJHEg3abmdtUDWERWtEpnhjADmHOZnroX4EPpXLztfLWVsopP1Cmf+W2oj09tPLwdA
 5pmYpRnA0v3bzYS0wET3VKLCF3ZG3ZhEokgWw5bFubqqiwLgUUSvziEKYpQfJ8+wdvBwA
 EXZtHw8k946fx1/ImUogEJ/1m+lMyh85Db+VC//9J8PDYNChft2AEGUy+SxM1ziP+asaq
 h3ad3zXxlt96KX0S1c6+co/6FdpzsMSfOKPC2o5k5t8NTEqFfPdxj2E3DFyZk6NqdhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328156;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=ZSd3V5prFnVNk5gKYeSO8zGzpDto0l68CkA6JEqdm+Y=;
 b=qS71pRR7HhmTdK4DbtqthuSRusa867mVE0QIgjkw9JY8jKT1u3Syerii7PSa0jVUf30r
 iYugQOSHZF1ZyprI4X0m8ZFaTcQ1EYwg/SqGfgDacrqoZWhlXm6ToP2qo+beb9Gh+ZtE+
 h8jCNDnvuRzWg8lFBbEiIh3yqbnuBaOhHrGEWgDt81dRC7Eq3Ybrir4ItoxdOPH6jpU8C
 euqi2TKEd3i3PUsnruTP2jffX/1J0y22P9ecFiN5oAZGG/eUoGYJLb/flmPw1DzRYP7yt
 igmkDdZKNvoTcZHCW9LGhg/1yR5m9bF3Bb49qh419i+EErM2HHpFOw+ZUJXVAc+RfJw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Mmn0k9oJ; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 579FE40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EDDDF60128;
 Sun, 13 Sep 2026 21:35:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 21:35:51 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 21:35:51 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Kamel Bouhara <kamel.bouhara@gmail.com>
In-Reply-To: <20260913162831.1675846-1-thomas.petazzoni@bootlin.com>
References: <20260913162831.1675846-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <fc2c9573eadf382a6cf41b5598e5f4f6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/usbguard: fix gcc version
 dependency after libabseil-cpp bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/09/2026 18:28, Thomas Petazzoni via buildroot wrote:
> In commit
> 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump
> to version 20260817.0"), libabseil-cpp was bumped, which required the
> gcc >= 8.x dependency to be upgraded to a gcc >= 10.x dependency. This
> was properly done in package/protobuf as part of this commit, as
> protobuf is a reverse dependency of libabseil-cpp.
> 
> However, usbguard, which is a reverse dependency of protobuf, was
> forgotten, and it no longer carries the correct gcc dependency.
> 
> This commit fixes this issue.
> 
> Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c 
> ("package/libabseil-cpp: bump to version 20260817.0")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
