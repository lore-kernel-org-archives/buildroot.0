Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B62606A328
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hTfOsTp4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC1736081E;
	Wed,  4 Nov 2026 22:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIU6RSppNTCJ; Wed,  4 Nov 2026 22:04:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 066C7607A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829848;
	b=Q0qIvfegcp/89/wkHIfiA++Agbtjz/InHNYd+hYF66Y6buju+TCyYp30UtOBF/WwKVUu
	 5Y/77Si9m5etTu7xEVsuh3rw5ZZLeaQ5xeeEmseI8MCkZNrbsdlleJNn5K4U51kbmzN1h
	 4EbrpClcglFYWqAuh8EwD9pE9t5KreAgRT0Y+E/f2bXNqtcvcPh2ugfptaxbgV77culNi
	 6i9xjfkiMuB+kztf+kDFt3YC1GBDKpw5ZvmmV8ioXs37RgDWUFe0RADFe1dv5/SEpuOG1
	 lburw4HWr2vItpJxaLOL8pOBMBkYBj+rVF8E2nl857zzENvujIzNzndjgqPJLUUzwuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829848;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+g0wmn+JYpdfn+LEVG7kgBc0gMhNRc32Kw+wuvatE7o=;
	b=X+sWDcVgNO867wodTg/WRimefYkroSvfQtIljLKz2fD0F5ZF/ttgeGtSVPOQUDF9GGDs
	 TWICnkWGlcJbCkcHJDQNdteJcV6tz/IcZr++zACHrFq/VYmKekbupNSRv9YxortTQOBQP
	 ZNC37wEg4eZZxmF/QjV1owo2UTPDmqLTFIfDdHv3NjUgno4xYQFDl0UkiznEqwHbKaPNg
	 LlLmh34z967UiKHUTZIaeAnozYX/guPOgQk/tfr2QuKIKQwi5Wl7ZeLTvxEkHloaLTkb8
	 BLhpJNjh19H3keqC60em84NV3VRWohsaQ2tBGLV3iiLSbP375VymQBnDq+J083JdtIA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829848;
	bh=+g0wmn+JYpdfn+LEVG7kgBc0gMhNRc32Kw+wuvatE7o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hTfOsTp4DQEzjsM3dg9iBD7mIL+YGTUR28vtjmGf2R8RD0+TjfbJwdDVH12YQyok3
	 UbztBFs6oBcq+KUUZEYj1r4otssKjYRexwS8m/Z4Ms1IeW11G67su7ze16H0c8cnqB
	 lpzv3lrBAXnfXKNfdahWUHLm27v7UzUQ4RgccL1r+lgHme/x4QEJTjrk9zjxffsoJK
	 mPl39pOAPVNSLnQpm3DgmHOR5BlY9rpBDtDQp+ss4BQOn/TOrjcZxM/WrYRlIJfKyR
	 SfG1Ia/SM1ekK3SxXFp2nWTVV4UAzok2+JspZaNTgySRjDArlhLkmVG4kUSx8Mrtzy
	 ndN9dgl30TaDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 066C7607A3;
	Wed,  4 Nov 2026 22:04:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD350362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD928607A3
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0Amk_WLdIXa for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:04:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2A14605D7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A14605D7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:04:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DC1A04E403FF
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:04:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AD23B5FD65;
 Wed,  4 Nov 2026 22:04:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C6D91032925B; Wed,  4 Nov 2026 23:04:02 +0100 (CET)
Date: Wed, 4 Nov 2026 23:04:01 +0100
To: Joseph Telaak <joseph@telaak.dev>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <auurEHw7GaBuvGwe@windsurf>
References: <20261102224915.69302-1-joseph@telaak.dev>
 <20261102224915.69302-2-joseph@telaak.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102224915.69302-2-joseph@telaak.dev>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/wpewebkit: add missing
 libxkbcommon dependency
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

Hello Joseph,

Sorry for the silly questions, but I'm not super familiar with
wpewebkit.

On Mon, Nov 02, 2026 at 05:49:14PM -0500, Joseph Telaak wrote:
> WPE WebKit always needs libxkbcommon: OptionsWPE.cmake has an
> unconditional find_package(Libxkbcommon 0.4.0 REQUIRED). Today it is
> only pulled in indirectly, through libwpe, which wpebackend-fdo
> selects. That path goes away once wpebackend-fdo is optional, and

When does wpebackend-fdo becomes optional?

This patch doesn't make it optional, and neither does your PATCH 2/2.

> WebKit 2.52 can be built without libwpe at all
> (ENABLE_WPE_LEGACY_API=OFF). The WPE Platform library added by the
> next patch also links libxkbcommon itself.
> 
> Select it and add it to the dependencies directly.
> 
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Overall, is this fixing an actual build issue, or it's for
consistency, and preparation for wpebackend-fdo becoming optional in a
feature version of wpewebkit, which would break the wpewebkit ->
wpebackend-fdo -> libwpe -> libxkbcommon that exists today?

Adrian: review from you appreciated :-)

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
