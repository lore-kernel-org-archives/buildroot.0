Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B8C982E6
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10A5460664;
	Sun, 20 Sep 2026 11:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd54m5KpLG9H; Sun, 20 Sep 2026 11:29:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9C34660621
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789903784;
	b=QhHByg34hwEBgVdiNtBmEJHGJvrfzGiORgI+uOu91/zUvgYUjW8HqCnWj+pY8cS85JSM
	 F8iJIvx4z5H4zQGqmfT29aV2SeE61v/i2ZqpjvrFSIY2NaXvmpypXHfbkTJ5pvpFqbLLd
	 HF1ctFHUouimRXW4B2fJV8oT0xN8nUoDlA8IILpbk56fhNo2NmjC0ths6iOJ+4sjJH55t
	 PyLp8SBxuvTraQVZ0RHxFcoTnO5KiXqU0jjpZsG4gztfWaCTgD3+Wc2hbfFdKOwb5G2A5
	 F9TTaL9QHzhk78PNSMjZ04BDvr8ZmBtnOXDCyK+RFMGVTugEunlbltmQoPt/ke28iyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789903784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=62lDElR6ph3ERuG1Wk8i7GPuCUd7E/xEiBwOvmHLQ+4=;
	b=OPu3n62/IWdHgJFHQFjZwoEZ0KyOwBNGHRYXBrHxnkBW17RwNaPUK2BzoP0qO+HKw7lr
	 CBJ1/b9HAcIrkIKzmLFzRpgVkq5X8bQ1bMD9PimEZE4Ay0hE/QIsJgJCEv6C20fiCQQpc
	 1BP8334Y56zNjfykkhZznsnZqd6l0Ha/ZrtxoMkAuhQi6onWX8ty3T4face2ZdmnIi1Q9
	 pvMTVYRFhexFDnem4Y8Opm3gQv0nlBmrHVfI9CKZdFRV3Tj15369DAjLtu3ezNyPwSfmn
	 fnxVv1nscAWBvx2JuVvbjvAvoi0YtDGoHmP/m1IxsRTuS0R1u3dj9IJx7iM0KaAhIuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789903784;
	bh=62lDElR6ph3ERuG1Wk8i7GPuCUd7E/xEiBwOvmHLQ+4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ej+VndmuQ2NCtnEqkODWtQ7tst4OMdLgH2OySHDGtPZpxg18hbi7XZdmYUg+qnTEV
	 7UP/c+MFiJ1pUkwaa55tLnmB8gyUZtUs/e+IjvHQagOdEJ9MnCWDQ9SLH74frcWM9O
	 lx9evd3+7MyCPG85axLHPRAynco6Iv4VsiIEY8MQJxGCJHzKxiWAAkohrrTke8Y20q
	 jTInkGOVxipLO/HQoDoCi5bBZoOPaU8aD0JGex7KWs9IM1n0AMp6eUln8WJjX+H/tX
	 Qb0Lejthvzwnq5o/c5afZumKx7jRvS+de4rvfeJBjNMTGbz3FFcmTErleqj8iPkhHL
	 CBKdeIRfpECcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C34660621;
	Sun, 20 Sep 2026 11:29:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75F0613D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD3640A24
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boGMDER6w4XM for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:29:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0E9CA40664
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789903782;
 b=OS9tCzVmFRxTti70uMHXKWg/hiDneetVju3joiAVqNxtHiWDEQRZUcJxvc1tQYXQsvqu
 hELx3/mD75c4jNURv3zYFw4zH7wIWTaozvE5IQpv1gnx3dHQlegRWHMe0rqW+7ipIO54C
 QeapXHxMU0UKRVfrGIMjPUzs7vIlJwKl/Gp/HHErwuhquAdyH6VL4JTqSr6/ufbb7oHQR
 FKNStgMADlGAbWKd07nGXgj07Wh37wJsODK3QyzCkEHfht7xsfbi5jN8Ff93Yvy3TD7vY
 KNa2z07IceIKzffTt+wC9It+Fx1xi4/oFeX5f4rBzvXNHyZfSP/Kv+ds+Yfslz/c4pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789903782;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=EYMJDQ6u0XFd9AdXUu1+mkKAepAycMGttH0VbovAf0w=;
 b=caQTZAD4qYrxB9IZEWtPPMc6BawTqysUroURN05povfSrVRMxw+24CRxfKpPfhhUyfes
 onwEh0fa0a3aTV/LfiNjNTMWYtE4VW2Nak3L/hOxOP4MzkpDCutL+XFhgC//xclMJKXbC
 YP41CKJyngXkpYIvvTaeyWQcDIdt7akFYmXBSMsuN92tjIW4yu2Setzc9hvD6pU3K68Tt
 bRgvLbjkeqPAgaR0K9dzvftJ+vIvkI/Y1rJ/eyeMVoN8+1O9BaWvU6HIBWhwVYnYVKT/7
 wR2/6TvuDfyKxXvTv0wshF9vfxRGDKU9varYZmSd3H303jZ30hPaZLFPca1HdSCOIlw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RiV9dyuy; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E9CA40664
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:29:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CBB394E4091B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:29:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9A877604C9;
 Sun, 20 Sep 2026 11:29:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50ADA10328160; 
 Sun, 20 Sep 2026 13:29:36 +0200 (CEST)
Date: Sun, 20 Sep 2026 13:29:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joachim Wiberg <troglobit@gmail.com>
Message-ID: <aq_DZi7Y_qC8kT4o@windsurf>
References: <20260920080748.1833904-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920080748.1833904-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mrouted: bump version to 4.7
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

Hello,

On Sun, Sep 20, 2026 at 10:07:48AM +0200, Bernd Kuhls wrote:
> https://github.com/troglobit/mrouted/blob/4.7/ChangeLog.md
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

There was already a patch posted by Joachim a few days ago, doing the
same thing, but mixed with an unrelated fix, and Joachim said he would
submit a v2 that splits the fix and version bump, so I suggest we take
Joachim's patches once they are posted.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
