Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B9C98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 21:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D58840543;
	Sun, 18 Jan 2026 21:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fc6Q5aA3rm2G; Sun, 18 Jan 2026 21:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC9C4403AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768773071;
	bh=iqK7nbRGj5kQcVoxNVxWUWRiqGAeuUAqBbeoYtQ+keE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nbRF4Q6m8j55tIp8zH29IFbTKgITO+BdspUL/P7O96YFqHOVM20jJpVyrU2a7BA5z
	 XRVQuhZTa5SjOFKReRDzrlWHajrlU+P5uoXTe0OyjSngLk0JT488YG/vwmtduEkNOT
	 uRyi1gMIec9W39o1i9iMV35vPjYC9kvx9orwqa+k0Cdr3Y+LVVuDcKHSumzM8czPX+
	 tCs1vFEn+A+TJIaH2a4cnR6eT0iOH2MkzhDE6OjbQgzwkn+DbWpmzTs8ohpTBNaH4I
	 tZjE2NrgJdySk4ANWd9MATtJL2zN6l791CzLrsGz7zBd2gDz8TSC2T0Z7UVV24lfM0
	 P1431R31VJ0EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC9C4403AF;
	Sun, 18 Jan 2026 21:51:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D5D160
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64E8C401B0
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmNWYr4TaK2s for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 21:51:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 643FA40199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 643FA40199
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 643FA40199
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:51:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2AAFA1A2930;
 Sun, 18 Jan 2026 21:51:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD945606E7;
 Sun, 18 Jan 2026 21:51:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A15610B694C6; Sun, 18 Jan 2026 22:51:05 +0100 (CET)
Date: Sun, 18 Jan 2026 22:51:04 +0100
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aW1VgW5jNJI5Gh_6@windsurf>
References: <20260107234505.0810d964@windsurf>
 <20260118213120.69615-1-vjardin@free.fr>
 <20260118213120.69615-2-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118213120.69615-2-vjardin@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768773065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=+4+TT3P6efB5kkq3/JCxQdUVwn5QRmwlT9w5D76ygwQ=;
 b=IXR8VAuCKXpsnoF0AA/UVkSwxIndKWmB2G5c1fygNh/8NEp+7qA6b/MgnW6iwD98kUNueH
 a1NZI3Brntd2rJSmM0VB56rIk8HYXz1mOardrXHYXL1SvwA5lfYURnT2zkwQXWmgHZPGmQ
 JMldjskDWaEjXXkwVkzlsl+Kh3QT2E6PNq0Cw478E+NAmaIHG1Heze7ZwHPJnLdNLhXSEx
 kcDHEQr/c1VXTwRM/uJ7mh/q8BGXhzC7nGT+k2WZzoetOUKYzQ0e+/6SVI1NAclzzgGg4Q
 q4GMcWuIr8m9TUfN7/SAKxvtfwhYs8bJ+IBls6Pvz/88xJ3ph2ZS+/9X74eDEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IXR8VAuC
Subject: Re: [Buildroot] [PATCH v1 1/1] package/sysrepo: fix build on riscv32
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

Hello Vincent,

On Sun, Jan 18, 2026 at 10:31:20PM +0100, Vincent Jardin wrote:

> +# riscv32 glibc doesn't define SYS_futex (only SYS_futex_time64)
> +# Use pthread-based condition variables instead of futex
> +# https://github.com/sysrepo/sysrepo/issues/3346
> +ifeq ($(BR2_RISCV_32),y)
> +SYSREPO_CONF_OPTS += -DSR_COND_IMPL=sr_cond_pthread
> +endif

Thanks for the fix. However, since sysrepo is maintained *and* using a
reasonable build system (CMake), the build system should test the
availability of SYS_futex, and only use it if available, without
requiring the user to know about these "gory" details. After all, this
is what CMakeLists.txt tests are made for. Could you cook something
like this, or check with upstream?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
