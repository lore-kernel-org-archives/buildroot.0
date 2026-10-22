Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB03606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YuwiopRb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 009CA608E9;
	Thu, 22 Oct 2026 21:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0ZSkxNBVsiS; Thu, 22 Oct 2026 21:29:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 97119608DF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704589;
	b=GBFD9OEz327EIUverecXx9Gtky9PfxoYQ5E6WeaGLbQ3GC5OOW8sPbmsTf8mFQEPuYUg
	 4loPHuinqt51t0mKTTgHNfoLemR5gdOyrN3LBOw1u9Xvg7oqH0P3YGdZyXBfRPxQOeuYC
	 1tsWk7DVY0rva/sQB9LfvHzoN8nt4wPSH0EOJ22msNX7aqfhdjyJ8zSD7f0wa8+hQjLuI
	 6cU8fyuB9P7c5PhjcE79Yo+Fu37RhJ0oxljUUfqe6BAazxCqHnrLU9t8F/lpRjRMZS00n
	 yWZ+hf5iPHj5QcVaoFiFI1aqb9Q+FnlooWD6GRkNQ9D8x5/k3EsDPbOUzkkiEhlWHEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704589;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NhK7AcFnnvlKesC6ukPRfLS9VXzz4RY85mukiHJjQCY=;
	b=nE6cZPkX9ORzuwyVvtjejMjlAwaKNeFwhqxL+DIXWNDeDsLAeSsOCgDlgNLpLQOFmKw+
	 Lyj5BLQdalQdwV8RP8/rjsXBzYiXTit+sRRnjeZj89pIcxh+p//ZwvDq+iI6JB98grtM+
	 duE7HZj5fiWKVNkZhEHgNLAd75NWjDcGZuK1voHeomLdPjw7trA2YrGPv9NuGyO/MXvO8
	 lJ8Mampwlvh5xzuH9yQ6ogZEURHZwcoFgkVRwHIT+8AQedga0dXFZWqWApS8HS7+qLXNp
	 QdvoJiLB/yEp6DcGIUGDW3l4oCTWWxoVJGBi/SU9rQIXPP2eqoS3NvdNcbQN1iJz0Hw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704589;
	bh=NhK7AcFnnvlKesC6ukPRfLS9VXzz4RY85mukiHJjQCY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YuwiopRbHVEvL2zngjdXik2urDe/JcHlhDpRn6MK2dbuvgrwSx6E5MGkSpWETiSQv
	 ZB3JFbQ5IilojpwEA6T/JOHXDebprYzR77vKk0PNshl9mqMKxbzOajBcBvnAAKl+mc
	 BGlPy3lnA6XrYVaXD33ikcJ0Rm9jam+cSJ/AGuI8dOhzzBYYggCF6z2bRdxcBf0B6s
	 T5A4yec0ecn+IaDqGnnDjOkh2gxEejTcwqJp006F18rywpn7XPiogHKxDNJvg7rBzx
	 jqMslcqInFKY7CP3OmMZT+wjZUppwnlfFtFHLAvWNPq5IgS0wv45jFawJqP/UD2CgI
	 SYfyb+p6KwJew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97119608DF;
	Thu, 22 Oct 2026 21:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 426703AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 141C840A15
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6rj6sU3ASXP for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:29:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A7F2640A1C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704587;
 b=JamJh4Kh3knN6gk46RCcwZQSxvTbbghhivmQpUv9FA4YneSOmbtTr1LklYFy2EUWmpBJ
 soFWZ6CJtPIdhCN/D9PYyW6QhTGobWXu2+zTe71cZzh2jSIq+eSmTfUJrGuYrfl2L19rD
 TKOS27hv+HK6tBOY+lHAbxqfZVeItvlEzIWDS+WJNR/KC2ygqq0NftRKpEqI1KfV07r3R
 2N7PJNEZsu5LoFk73LOBmQIEo0iymublnFtQtTwTVdsCcNPE1487SaEUvMXNUrOJ76pop
 2bCbnFdeYFeumsjDd2jqwSJrN6QhSVJ4RHBiZ+c/JMugrrd/qqJU9bqePOX7fcu3IFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704587;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=98/nzHPCiM9xqF3YZzhkHqtNX/bwETUVAdaUjSmwk8s=;
 b=CKnkr0kCZvNXsFhqJNoTGvxRooUqwVM5TzKy7zNfYFJeYsvwZ1qnTkAxOf+kHSIG25Rf
 h27VGy1EjxioqPpPAQSFRQKIU1kcsmdz1D57epeRmnd+6u6Ame/gCuu0ViraaCaksglTG
 06d7tckhyV2Ig0AtUEeWoX50VBwUUTt+4458s/G+Gwy32ZqVblvKOZFGQwTOBmZFNGwBz
 vFdqGD4qWgDr/tSUvsK9UmBxx0wDmbW8JTPNEwst0ZHHtUdh1KI2c+TSIQCvv/wQaJx5z
 X226oeyIAO7UIqBmhTfSqFCzKWSCKOKX5WMFlJYKIaPzHCVm2GwsLMYcpzMT5TKhZBA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zdbi46xn; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7F2640A1C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:29:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3941AC51457;
 Thu, 22 Oct 2026 21:30:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 87FE060763;
 Thu, 22 Oct 2026 21:29:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A98C610328501; 
 Thu, 22 Oct 2026 23:29:35 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:29:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Message-ID: <atqAOrUudYz7F19R@windsurf>
References: <20261004125343.3633363-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004125343.3633363-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/{opencv4,
 opencv4-contrib}: bump version to 4.14.0
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 04, 2026 at 02:53:43PM +0200, Bernd Kuhls wrote:
> https://github.com/opencv/opencv/releases/tag/4.14.0
> https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4140
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
