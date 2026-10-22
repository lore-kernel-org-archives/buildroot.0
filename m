Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424E8606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c1GrgWQA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14DB8812D1;
	Thu, 22 Oct 2026 21:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXk5ZmM79h54; Thu, 22 Oct 2026 21:57:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCE9081316
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792706272;
	b=qbFXOGck/YL/tAsRVIQeMtY/ZDGeJAnFFvLaHOevlpQOK7QZ2UypYUY3KqIafHMlh9jz
	 PY/WdmN9EUX1eVTu5W2RMe8oNLoWJuHZ02YZb+wuDOB4mBCvsXt49Y1OZICTsfbuf8vhd
	 oOymNOGohiDjju/IvDYuQ8/afHO9UI58GaN2KUmuygxxXNurhakxK49w/3OIcpQ2G+Nhz
	 M6xq8gCUpfFNTgTcLI4PnO4u2a+O4KlN7EscBwQ3qd4yVIDt3YaI/Qls7CL+UnNgUCivd
	 e+bqv/GJE04AtsErxXh0wFS7o79SI8qUDLyjkfFcLDTGbo2r5q+BbHMXm0cZF1Hkxig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792706272;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lm1e7M5BC+eQzz1K5OewePLC5zipLhRq/87gniaFpnE=;
	b=FJAPk71cv0X2I8I9sbjEwHFUaMSJ1PB1sEFAjZ2W905GqGXrLyQ9rcYMksy8xAvzgJrR
	 sBKBXkrhh2khv8Cq0LwCkjT76j0FoJqxJ2Xyxp5op/Qd+D71O3/YOX/EeNnL1ssElwr0p
	 RG0PGge+ljVjEgfRoDZu14KrIY3ofSnVI/QqsK1Ljp2TQB4GD8NY/TMrcATAsYTLZRfOH
	 Q8YbnEThFkp+7EuvglGFFYrH/02JJ77Jk4zYOI7Bx1UT6A7iwbubWVw0w/NQvzXqu3Z2Y
	 1yJD0+t6dmsCLJeIvum1U2bvRrF41+3XE/rbqinAu2IZOLzgcbbg6Slak7ketFAPY7A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792706272;
	bh=lm1e7M5BC+eQzz1K5OewePLC5zipLhRq/87gniaFpnE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c1GrgWQAq/d4fg/PROniwdSv3EP+PDM0LtoS5SoBy5UWn7ASOYx497HJnepF7g9v8
	 VtPHEvg8Quci0bTm2jEtUUPCGBsxmkxPdVMNq6bGviEKIMbiIDCF9LyCt84IYKi8wc
	 rsXGF2gz6Y5YNxkq6Az4syvDr/WshbyYvmdl19sCyawP53rDp3HpqxdqpkZ53oa/ES
	 t7ffrmjEz54pn+t+PkNL32B4fTRpFMAWTvQOThkLQTwu1KrhGcB46Vw0GUFHdwmNjb
	 k9vABeLWl2vP7usH3YkcxvLVO74jzU93ay7JY6Kdcnm+vg6HpWGbOwy6AU7sToYqgZ
	 Wcq0+HQRIWFVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE9081316;
	Thu, 22 Oct 2026 21:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 337FE3A7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 194B7608AA
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPPn5QvkQe_p for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:57:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD59B60848
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792706270;
 b=tf9qN/ztKbqTfSHS6crrC2NXlTlZC7TDRTb2Q0Hgbkpl4STKC4SDWbCK3x2QEck61r98
 zfaY/j/om/Nw7H98OW+tk3X1k+0AoC0EJW4u/XUGYU3/gx3gq9FibzN8Cb525pgje+gp3
 1EyzIaEg+/NByY1Vq8XpDmKpQD+V838pCkcDOPbQZddYIDNpEPhlnRIKGlgaX060VnEnJ
 tTLRC44yd5cWCqQqPg5vJem0xOsfoqd6IEoVjO/P7UAwnRuwKsl85U0Fym064F3iPch/8
 mVRDvz8f4b6SPvD4iexBSOzdPZL5YGmPJMoBsuPRKz813Co4itcniX+e88gO3Zmy0rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792706270;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=/jCxkbQnPBHf6WLweHcEcs0TfPTmCMdIigJAuLagDGI=;
 b=W0cd0nJh/8qsQEfrimtafVmsyd63yQXjsR8Jt5cjC4bcmQI/u+3Upfksm+cNM+tG/oxi
 vJE72rbS13lqnn3zZS/FsRC1AAuGhB2JH+BO5RBo+nN1g0exdqe8Aa4ghUcWwp3MOt22f
 aBPOmseu+6hZqIp8fWOuOroqLhwk93E9XXtxBmu4teZjTLXDp5iWSxkTjc83+4fwiQp+6
 8peHg7DOQi/dIkmtd/AF5toBfjm2diIcXXe5h6ZEyL2IFXZPgCt6V2iB74l3STg3o1rqn
 yYptm1nPmbKGlFgDTDwg4RGSLjNPIX3Lo3gioa9esdTnULwDdyfKCrtW1dOGj3rROYw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=H+DS+D8p; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD59B60848
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:57:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 02E6F4E412BE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:57:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B35A860763;
 Thu, 22 Oct 2026 21:57:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A79B9103281B0; 
 Thu, 22 Oct 2026 23:57:40 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:57:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
Message-ID: <atqG0C-2YlUtOGtd@windsurf>
References: <20261021211141.2759992-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021211141.2759992-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 1/1] package/sdl3: fix X11 dependencies
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

On Wed, Oct 21, 2026 at 11:11:41PM +0200, Bernd Kuhls wrote:
> Add handling for optional X11 dependencies to fix configure errors like:
> 
> CMake Error at cmake/macros.cmake:433 (message):
>   Couldn't find dependency package for XCURSOR.  Please install the needed
>   packages or configure with -DSDL_X11_XCURSOR=OFF
> 
> Please note that SDL3 only checks for these dependencies when X11
> support is enabled so we do not need to add =OFF options to the else-
> clause -DSDL_X11=OFF:
> https://github.com/libsdl-org/SDL/blob/release-3.4.12/cmake/sdlchecks.cmake#L325
> 
> The problem exists since the package was added with buildroot commit
> 2dd13e328f118363165b47258429604a5ffd3b41 so a backport to the 2026.08.x
> branch should be considered.
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
