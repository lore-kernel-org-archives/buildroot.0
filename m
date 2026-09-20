Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B4BC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9444C40B54;
	Sun, 20 Sep 2026 12:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVAp96KxsSrS; Sun, 20 Sep 2026 12:24:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C92E740B49
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907073;
	b=qLcVccispvasen0aHjdK+Ap0PBhT+Pj//pbaXxsiPzmjZ+JrvuOYjeiwvnOoxiE+gNdh
	 zVi97oUGJm2WJrJ3DEsJBTc32uRCGm8koZUx8E9PirYgoqwr64dIzbOPy7uhcxF/VZ/MI
	 BLCZ662/UDJUp5hoSD+wI6wiMRWbDmph0/d66paN/1BY3Kfta6isCAOyOJYFnvG56Vma5
	 vJGWN+CstLJjBbLLhn8lFNoyG3qfaaI5r5J5qx0hOsQ+EcG5Hiu/F8iwZ7srqsbcSYP5I
	 02c5mMxXCoZNrhrmpY+c7OqoYrMzlRwlbot32CJMSp3W18IAZXVUgZKesBw4fcuZTNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wHk3ZNI5Ezovu+uDGG5p+W48KsvIN5WSO2CS+C3m5jk=;
	b=f/ohexQ5fO06hfOAqhZvnNCxsGD7ujqErXhZbeEk/6M2vXQ526o/j7jSUXYvziFCG1rn
	 fJRd2aFKHAUeL7THZXSFyoHTBO2pn+IllYUyFkpg+unbJfF8m0fO1X3w7+Qyfi4O5CFgc
	 ziqKSSr8eNii1dCJf7fdF0S07H84WIaH7DIM+A59r379co/kAdo62dwxlF8b8ZW5ES6PH
	 Wyn4jWj3lLvt+MsCMmmqL/JrKxd9/Tq2cNTXWrkAclw6NDysDEI0otpMLSXcNbQ5GiUKF
	 T8yQxDrBXiVAB6rbxdPbapyacocNbhk1ERlGcTXlz/iuajfl8LPThi0Su8/Y57RsJ5Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907073;
	bh=wHk3ZNI5Ezovu+uDGG5p+W48KsvIN5WSO2CS+C3m5jk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jp5XtNY5JWXn5hcQp/1hHu5AkuofmPSvJ1uAitF+OillrgVDRNdD6Ljn2L+Ypxbhu
	 ZR4t1kq8qlOIw87iByj/aNlKJvcH5d/4q4+GygTKT3q5zsVvVmlnYbRkymbXlCiC77
	 L3pkAxsjuVf8bVVkZ/ds1BFnLUY2eQ/RBjWpiT9uPEu9H2gEflFMY+RsMU4j+npAxl
	 SjV8IXeGIkQUABN7JIaRsd+wtH3/tP1yCoDr9Ox7wu8lwwFptueu9q8DIfOiYKuJyp
	 Z4faXoyzxCh9KE86oTB2s0GjcRRpErmlpdIoeb6XZLS0qRYnf9riSsvPfKy45+Nsp+
	 yIpzB0BbSvtrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92E740B49;
	Sun, 20 Sep 2026 12:24:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CAF837A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49CC980F01
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8RUnO_idueY for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:24:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 056C980F00
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907071;
 b=L6S2BFggYY9KPc1YmRgWvTjFKwU0y0T7HpLXVhOg+Fjp7IitAjjDa6I2dOnyLPfUZGIv
 3iKFMbL+Ufj2exyIjdiXe7TAbq/3DMLD+ssbdb/foqqdysOgj1kPa0+G6hVEhicbPrMCC
 JpRMVCzH5ScayYPrWc+K121dnbRxM68DtM/cHKC+XNeCFsfsWo1xG9NZXfMRwmSThy3m/
 +qdEMK2wTJkONp3eqs4sxVBl/ObvYbioobeD37jI4tBXjruGZzYf+l4FfgiDbvt/pBeMH
 y9KpOtSA+yvBPrD3biFKVnqwpuj1Pcae0FQmIC3iXtjeiv7CuXddjIG2ot6K791fqkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907071;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Yatl+voLXevks57SjHPBZyDEM70kC9lkA5iW4JC1AVI=;
 b=UeGq0k2vTgYQEIy7NzsnSxJx8r4qEdu1HcKmw352m+LTF7ZpjB5FeDTcBQQv45yKHxQN
 lSsqkavIORQ3HxaOi/UdNUPFVYYyPo25Yhbqi3X/zj8AWrXMnFSYtqX35uBZKi/qH+eVt
 v77ZeI3carjHyEIIchLH4wR1Ou872hFk8dOYzKSQi/iZEVtNPAZg5YScdTXVUMxKDdO5D
 KlDY6oOi0t/unC55VUm/1fKRdjvk2ZJCpYh0vS37FWXJv0/TjPSgCmP+fvEgcMoPjU4Ue
 RUJS8MqWRfmt/LMI1JV49E1wAWTp99ImAKUOTYgXnUs4qlbaScgy0HfmmmUFyVLW4Tw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GMGyWOey; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 056C980F00
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:24:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EC64E1A0981;
 Sun, 20 Sep 2026 12:24:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9DC9604C9;
 Sun, 20 Sep 2026 12:24:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9FFC5103282B0; 
 Sun, 20 Sep 2026 14:24:27 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:24:26 +0200
To: Wei Dai <daiwei@sunkaisens.com>
Cc: buildroot@buildroot.org, 
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>
Message-ID: <aq_QdoeQzO0Ubdva@windsurf>
References: <20260920074056.1320014-1-daiwei@sunkaisens.com>
 <20260920074056.1320014-3-daiwei@sunkaisens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920074056.1320014-3-daiwei@sunkaisens.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] package/strongswan: add systemd support
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

On Sun, Sep 20, 2026 at 03:40:56PM +0800, Wei Dai wrote:
> When systemd is enabled, configure strongswan with --enable-systemd
> and add the systemd dependency. This builds the charon-systemd IKE
> daemon, which is designed for native systemd integration (using the
> systemd libraries) and is managed by systemd through a service file,
> with configuration handled by the swanctl backend.
> 
> Pass --disable-systemd when systemd is not selected to keep the
> build deterministic.
> 
> Signed-off-by: Wei Dai <daiwei@sunkaisens.com>

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
