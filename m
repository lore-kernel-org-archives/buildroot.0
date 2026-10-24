Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18BE606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mL5hFMTa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB0D81179;
	Sat, 24 Oct 2026 21:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Hi48nyc2cGG; Sat, 24 Oct 2026 21:32:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A1CFB81167
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877523;
	b=Er4KQkqSIxbUpxhHvC2LJ0D4EYZFwPXIQNCqvjwwQXyI14MvwDVL6r+SpzAfUII4uvfk
	 l/W9JV9xmoLWX/48VvJ5MX4DGGVpWFt7DW5Y9G3dcT0tfvylKYqMzvBH+t0AogcsPTRaT
	 IkpvNmS0GGvowWkl2ZBhQx3eYI6uf4Sh+FuiLqHCEc0WYI3ducmkw2x/+dmP9Kbdd4Qgr
	 baVoLwbpiCkHwAmo3BUKdOyHYZIUuCmlSReafMZyNMZearlQ8i9hL+Q6BhKd6czWm0sIE
	 EtObUgoDWBTMf7nL76aJdN+0XMi5/gnOLg3J36PFwQw6KOIz0YHKwDiWeIF3ypIJiSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877523;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3L+uIIKg6OSCKFV6GlPJ2Tq+ch3HS2V0tmq9NPt9FW8=;
	b=n4WdLj06er/vkrOgt8NKj6uOE3U0OYqhrJtn2sOAo8fb40xWvSHoU7LUaiU0ednxXKLR
	 M+pNkf8y2TYxFlaXXdZk+ShrmWsatob2MPdCYgpTbvFfl3MDtgZji/YCtmuz/3lp68I5H
	 3euGavERSfEuDUMKZOLLrKpU5yxT29qPxujusqhjo3IQ4nWg5RwLLEgak9ejmOqqa8hFu
	 JP1awuIP9zwtRIwPiqzCcHaWCaCN2cEik2tmK/WpVGU5gBndItrF/XGSlg1l5jH44D99b
	 vRM6gP2u98Mb8kfR1zjn3H/ge0YZl94oDRi9rGA8pypp41wfrOiSB71532zmeCaqM9w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877523;
	bh=3L+uIIKg6OSCKFV6GlPJ2Tq+ch3HS2V0tmq9NPt9FW8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mL5hFMTada2dt+VhxUFeHaoGjQJpcOr9ze8Pmf+3e5T1+POW8oAINO91vCbEHlAeO
	 GBux/Fk/1rTM6yVthpQ+gXHIfRxeKwwAWi6p3loVh9qr3KdCIdjNfG1ybBdnawQb1k
	 CgoTf9uflJeoqHUUc/fMPwDDUt/TW/c1fl+b0qmW/z+s9li+c9CyoOTMf9O1JWyMht
	 sxjq+QLFw5gXxhqHCFN4mJH6OonUg41J4mFCRgKpAcB+yegwqprKPona6SoJ4v4Slz
	 KsGQj01TSL6shY6gnBBSb23jElyR7JegwlWzlLJrm1lfRxBIHAMp8ry6ERJJdzzjgF
	 OaNcp0sqhUlnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1CFB81167;
	Sat, 24 Oct 2026 21:32:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6213D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 326CE81167
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-bVxxTsTZ2x for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:32:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 36BCE80D88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877521;
 b=e5hzZ2nO5tojeyuOyOCbb+GnujGE2etyh4J+/BdNbasE4pMgtzknJxeiP4G4V+u6i3L3
 5rHf9s5unG4MGs4/rZRbVqN8TmcqSbXtY+7ota7wut/FJLvdp54VhilmP1MrCiNwD7Cj6
 eITpFi00n4WrkG4YDm+mfE1Mps2B4/rfSrxX4ZXH4gUG1l8UiZKwCZkEKBtZxh4QHmF9z
 pNh0SK85D/W7GbgryncOrvcRfwuHHzZJPiP6Vfx9+s1Rd6DjSWJ7Qwq+Sh0S8knli0NHq
 YbH4KZle9EW5q+TXyjqQdMzedzCiV13kflyTIZF2PM3/Jshy4cDugZMsPdDxW6acIxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877521;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=TrfoMhTH9slHjFsIQMq+2aSTX6WGtbjyJfCjnS7XJCI=;
 b=hTGNWL8Ep8D0X0icLkZkqIunIblcKPHZCrswQekjdZ6e6rJWsQ2DXRUyawQH0SEwKRYo
 zikUDMBg2DqFCKLwfehZRjH8vRi4ZCPEHQ5dJYIq+HWeFUNuW3sx+i5sU6glbXXUiUvxn
 NoMoUZkSwtDowznWFBWSD2deBIfal6WTmY2I4J5CdXTv+zP0hfflGYmDvx1Nph/MrWfMS
 NJEBLJJqbnNVpd/yotYmWz6LVZ0szIG/Ty0fH8j41xwjDr81FhsjS2TQNCoEoA+Utujm2
 qkLfOhTcXWQD6KSgJq/10Rx4f/Jcx+sPZX5pWhQJGPDY803Y9g99RaS2s7xswFjxflQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OYDVRv6O; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36BCE80D88
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0E035C6344F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A726B60769;
 Sat, 24 Oct 2026 21:31:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 330DD10328FE8; 
 Sat, 24 Oct 2026 23:31:57 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:31:56 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <at0jxIhshzRKT43e@windsurf>
References: <20261024075628.3205436-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024075628.3205436-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/jimtcl: install pkg-config file
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 09:56:26AM +0200, Yegor Yefremov wrote:
> Install jimtcl.pc to staging, so that packages can use pkg-config to
> find jimtcl. This is especially needed for static linking, as jimtcl
> lists the libraries it links against (e.g. openssl and zlib) in
> Libs.private.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Series applied, thanks!

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
