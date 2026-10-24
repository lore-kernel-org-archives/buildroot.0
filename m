Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D56F606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V/xpiVhH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71FA0406E7;
	Sat, 24 Oct 2026 20:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxvpfsZdcwq6; Sat, 24 Oct 2026 20:56:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5397E406EA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875389;
	b=C6UejX5gEIJCqJ3jRFvJeJrx/K9jIKy4mLIZQ+oHLb5cFn/uLDl8lqvHnlkz33Hlv8EW
	 L3vfo3Nrv6LnIgzUvRXXUiZbDcbU1W3NAZoLOnGb2RM5tK3D/wo/0NxwFiYZMCyhLj9Xa
	 i+oFSx2a54Yagtv3xmoGG0gjEU+apR2DhDhyfqD9upOZvCF9DZZh4LMobwV6Gr5jJQooz
	 zW7H93L4CSRD1wtcOH5GxySEspMc7NQOeK5srO/V2L5tJ9lh9JCAmq6xPHljusEfD1uCW
	 SUjYzpfa9lRpY8UAd2ph6/Lcmb4Ua52C3DSbPmoya6NcERUmTDgThLWPFx6ixTHvRZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uzI7VwineIXgMMPsRko0H3BVG0QgHF1LSleCHQTU8ls=;
	b=RhozLYzj3IFByTD1p4Ci/MZQXfcxNpbclxGs5mNca2FPfQCoO2Y8q8oJHjnkY94SL9wc
	 xWDHb9miLvSxksnyI9kVf4TIeHOUdBwoYPUhiRGxh+yzQSgcVyz/fsgFhDOlc5qeTfkzF
	 MstIWbMD92Cx7l8XE2ozEFeuMI7IZDqj/3Xi3EyoW5GGtEp1pFrCUwrl3pcQ4nbkbpXe0
	 +IhnPS58/F3ylElBU+ZhXu+KO1jrEZlz53MgBD5+5zAYtH4GHEAqZ80SwCjIDLaM0+iqU
	 5lFwqK+iCYkxDdsWh6hxDBrtcevIZ5GUIYIxxZRVmPnt+5cUagXYnH4coZYhASa767Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875389;
	bh=uzI7VwineIXgMMPsRko0H3BVG0QgHF1LSleCHQTU8ls=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V/xpiVhHldDz7xIOXHfARgwi2QI6wtg0RNYgqU20PeiYOTuko4bbbZp5pnPk1OJlV
	 3fHuUyMNQwf06TiVrGQ2c5PhN3y5vtzXtVcR7uOdQaPbwB4Rdh0bpxbLAhq2bZcHU2
	 OPAnn/CLibcep9w8qw7cfWhpHua4aWErsFrTBNNrk4lLvxzKX9jZiqyP3tEyewK9B+
	 8vjy8+A/raUGagamWUiEo+5JD17fU1nXnXp+qTsEK2EC60bAkD1Vt+5EOJdjvaRdO2
	 vz5tPB9BroeD7B2W3ghO/Aw2FlFQ3Vsf0/8KjVc5Tz00cOaJEnmpQwvrhbPjN7ct2p
	 gJyom1+aAVNnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5397E406EA;
	Sat, 24 Oct 2026 20:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FEFC356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91EFD6062A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUraZ-MiZdCX for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:56:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 18016605EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875386;
 b=mEWRkWVqsmX4fUUJOOLlDwJUm3saa8O2lA0BLavCTSjbFNoIGgWUe3qNHt/y5vWyvrUm
 Yu4hxt8zQzjFhUaRwh563zYJD7JJ0KTP6gSN4HJLQHDWca34feHRSmV00HcOWsY66fdJy
 C+XouJWlVO80aekPtbb/JyAs+/4aRDB3ClIZlWyOskJC+AHbx07JjjOwqpLShnvKGyZ81
 F9H51nCYkcVvYNp9C1Vl4fjBzwAsf5TBDibM9LjsAHMNVKRGB+Ooe6+PA9APFKG85oPLv
 jB7gnJjAA8edHP7Ls7L2HDJs+skQPFum83Tz+S7YdCSD4VtuJ00ueqWFHB+VJpETzUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875386;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=CYAEpA70iJR5kB8tHjK+7i9SfVc+RyG5yUw7tRVxsE4=;
 b=V30X5xt+HiPtYn8CpnoNEVXOtmevcvYFUkEYENPBycB1LkQf5InGZDrtPYqJOXki8DnE
 xredcuNQziIBYeAfGpDl9i8s18i7Xib/Yw6LC/Cc6PGK+82+FsCe2M2FI00KhbF/FC/W3
 7K56bUCOOSmWt1z2166RaM00Fcs/BFLbgi3CHIVrZHfF76xV/3+WLYy2U72IP8CiXMnkC
 Fsy7KX2jOa4KUkG4kD7Ps4re3beJby5KJoyQVuV013DPuQoeBAOe3ugBJMzdoZTh0vrFO
 wd/ptdxPcSxSBzYDFq+xCZu9BdPPuj8hRrOkwCyPLWmnVTBOSVTZbiGvqQZPN5Gzszw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KyybutuG; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18016605EB
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C53DE4E412E1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89DB560769;
 Sat, 24 Oct 2026 20:56:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94F3A10328DD2; 
 Sat, 24 Oct 2026 22:56:21 +0200 (CEST)
Date: Sat, 24 Oct 2026 22:56:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at0bce-VW2W7Mj-O@windsurf>
References: <20261024192842.3292701-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024192842.3292701-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 7.2
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

On Sat, Oct 24, 2026 at 09:28:42PM +0200, Bernd Kuhls wrote:
> https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.2
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
