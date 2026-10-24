Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1F5606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QU22jy9S
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A06CF6062D;
	Sat, 24 Oct 2026 21:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBvxJXOTs7Z7; Sat, 24 Oct 2026 21:28:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C3CDE6061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877306;
	b=ftnZ4zwmg/NiWxAVwIgPsVR6XY4aR4dWU82ErDd48wLP84d1Kppk9dilYhc8ar9F6vfn
	 newd/YOZR2QMhbqZhtkfmv1yNSd0OITMu5aLpjcexJ9cADT9ctO4RClPQW8wa5Nn+Y4cR
	 nx4d6rpnAhR45sy+EC6pBwDFXi7fPM80RM8jC51tD+g5trvAy/8TGszR0IDfvqf0zKD7h
	 rDCbZ9r1L8kmu8AD8i/TFPf+jaeWJkdbNwGbmQdGCo0bkcbzxnk7ck7Jhjz0x6lwqa4b3
	 irALcTNpBRmPWW2gGGBa2C6PrNHWWEQBFuBggjE6xGwSg0EzEeo91qTWFYY/a/06RqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877306;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wnGW2Q7CBh4poToy789EMko7XTQyVViEEfSzvhVJSNY=;
	b=aUiatRgRexE43gy2J9zQHG2bWQKMEpYJKwvVak0/+tVl8+hOuOypE8JZ/QioM7xZVBfR
	 /cYAoJJEZMjBRpJP0aPYyfM9zt7pmUcxvhZN9S8Jp41YcqMpo2wRRbdl5q+v+RB5qEcfX
	 BKa7YR5U2V9JlFwLxF9GZvpy4wcbP66IDhvnc9Ao4aewxEiZ5q7d/s++cqwG1T0xwEktk
	 EblZsDcpTnVF7wE+9GW4FK0lnE8jb+AZF4XqeMbomTiRheHKtsJZdgdutEoRMmNaW2+a7
	 lncHONVKrCJg2JYxawuNXYNT7TPU8+lt7rQbpBC1p2VkQrrE+b0+6cFPdaEC818Xb+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877306;
	bh=wnGW2Q7CBh4poToy789EMko7XTQyVViEEfSzvhVJSNY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QU22jy9SfN8Z/rsCSEzmsZ0wrObe7ZNfjrTtLHzPSyY2Y2AHXl93C5xLXQzXzidvH
	 bXxsKfCPuQiz63fq1tHOzKLmIBmRozshbfi2rTS4dQy4fXUKL6zDc46igj/ZyiQCmn
	 RA6WY7Jygf9Frllz7R2js5SI2HWuEWR/4Y/sh62D+mi8di0ugwKOlO0XwXDb0HZA/X
	 /veMuisDPsdtQML/XescLmHqk+NXdwk/9mOzwjkzNQqiXPeRSwP0Joo2w/oBZg46cq
	 Q12gEPBNbWKTgeboUpJxnVrs0iyPTtQ0EG3FmgQJLQxtEwaL+w/M9LAmSxxIAW/sCg
	 qHCvwKAfgMp1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3CDE6061C;
	Sat, 24 Oct 2026 21:28:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FBF82F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 319E840079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5QrMLiIULP0 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:28:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 589734006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877304;
 b=tIXP+ndS6uZfCOIp3f+iXX0JuJthRQpRNgeDK3FyDlD5zsPBh26RolTbZz1TMCyvpkaH
 REwgl9qr3Z2yYHWFphh3kd+WIw9LHFAHf8pgBL85t89XbjfwTFhr5tGjMOgrLosHVwfz1
 yugmthnv1fU6j3fFu8e9DeEpu1lxTk9VCj+As7xm5c+SvNY+MSnGHWJZQ1XNepurwzqnn
 5wfEMHPSVmcKy7Qi7+FoBOEdNP+u2EJasKfUH4wm2TZZnMLv/HqiVRF71NYNd0GDjD1kK
 9g0Iud8z6fyA1NAL7mnO8jrrbIuN5W6tIZsxMANoQY4CzQ7cG7abLWVFtyWvnWUo84g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877304;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=DSol0bAw0DaJVyHdWmWkVQz4IQ4F0pbZ/Aqu7Ejkw5Q=;
 b=VRLdyoWJO3U/gkiNz2e7boVxoQxcrA2mrikxTtD55Di44VuVgDSPmdXvx9gx8mUOWAcS
 sEKKomrV7Chw3ZC3vadUDJVlvcbKoc16MJ9z/kPA911dM8a9q0s2Za2CO5gxNvi1blSG5
 gu8yKfVfnjN4b9E3aVPbWysTzaD1xAhwZx+0TRPpzLFSHBerW9Vf7ck2TM/YtXveDmLN6
 CjF6Dm6ahc6gc9p5I22h5IAwTRRRgcplaIt8BlrUa3lbJz8qfNXVAhe8GyWSj48XLj21B
 V0SOjebRyvZ5bSk0GHWe8WYWnFHwbOz4rNMZTBsjJivOirdaUmlyA3TgEm2MYs5PbUw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sUHTLv6q; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 589734006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:28:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9D0741A131E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:28:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6BB9360769;
 Sat, 24 Oct 2026 21:28:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 72C9710328FE8; 
 Sat, 24 Oct 2026 23:28:21 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:28:20 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
Message-ID: <at0i71Dctycht-zl@windsurf>
References: <20261024141008.1967095-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024141008.1967095-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/librdkafka: bump to v2.16.0
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

On Sat, Oct 24, 2026 at 04:10:08PM +0200, Thomas Devoogdt wrote:
> News: https://github.com/confluentinc/librdkafka/releases#release-v2.16.0
> 
> Dropped 0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch,
> fix merged in https://github.com/confluentinc/librdkafka/pull/5136.
> 
> Refreshed 0001-CMakeLists.txt-allow-compilation-without-C-support.patch
> (upstream: https://github.com/confluentinc/librdkafka/pull/5311).
> 
> Added 0002-Guard-fenv.h-usage-behind-HAVE_FENV-5650.patch, as fenv.h is
> not available on uClibc toolchains without FENV support, which broke the
> build since v2.16.0:
>   fatal error: fenv.h: No such file or directory
> Reported in https://github.com/confluentinc/librdkafka/issues/5650,
> fix proposed in https://github.com/confluentinc/librdkafka/pull/5651.
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
