Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE18606A31A
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hjWMzOkj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A192360718;
	Mon, 19 Oct 2026 16:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9iK2U6q0KCC; Mon, 19 Oct 2026 16:58:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2CCB56068B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792429091;
	b=H0RCsVuZq9Y20T6VDzYTydZPKH6qjMIdtnsnlBRvqfjgLuZxbNSkI8GZmlk8f6Xfdk5x
	 oAwt2+tTyJQD7OyUQNFKO7MO8Z13Vpettxa0WwuCDr4G2hRKbYi+bQKWIkhKkGbivIRcF
	 Xgp4EzaI6draRnlP+FZrqb0d5U7X0b1q17LrHUsTh5tl8LyDqDcenfJEnx7egdUSYHg/o
	 wjPEEXDo6iiifvgdWZB2D31sZf377OZUjaA8S6wKKQ8O97hwYCFZloFM/1RHRfgXG9Q/4
	 cP1VnEOTO/2+7VGLszffVDQP2EDrHAxk9idQzJFR5KlSofMCglud3YFQq91YrjZ4RWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792429091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KIMzT7a+wOh61CjpkXPg5Wv4KF/8DXoPULMtTZgO+EM=;
	b=Jo2TUj9zuPuUMqhvDou6o89QdVHnwc1ZxZXaOAakHuIfX2cGUvm908FDVDNV3SaQhZz8
	 DsM/dF2aAfACdxIaWFND48n5l9AkbnkW6IYOmCEttePkp0+eU0j7994UWk8Nc7w+E9v37
	 5NWyu+RPsoTmnC/jRandfAPqxXqwKNoPR+GiBGiEkX+vnHayCmQst5Z0v4kJgDoC7X5Gg
	 BU9iA3KEnzS9aC4zHE24PSBJ1chtvwuf0MLSOisIdXkT7Q5WD39eAzadwcRtW4iN5LovE
	 axN0WYq9aHovI4U0fP9XvxAp+TMAUm+iBN8TTj8vy24un8hc/HjovKC3pTy+RQmgRUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792429091;
	bh=KIMzT7a+wOh61CjpkXPg5Wv4KF/8DXoPULMtTZgO+EM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hjWMzOkjeiOGc5hqkg7F1EQRB0LkKh3uPiEc74wh71gg3V4J0pKdCMImh81KUvksW
	 FXKoL9MQ8tZ73h0EoWNp9CqchItP53D7/6HZh+XAwNg0I3z910oVqh1pRNk1h3ARZC
	 BpaOYcF2Bii3XkQrBqdmz2hVkkwvOkl2Pb1z0N1S9CSYTs523nULGj08zQ8S46fzNk
	 yfzz3XMPMO3AgZZEG8YgcDIG03F0Z4LXBhrBcRpwScytMuF5+tfXPZeUWILQ7Ue7Gt
	 S1rOSWvrd1eYB2QjPdt4zyDI21Osaw8+J3uAc8edt1mSFKUxzA8I1xC+F3HbJxu+9u
	 8aS/Hh7C+lvRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CCB56068B;
	Mon, 19 Oct 2026 16:58:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A441279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2000380E45
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjpnqPlNggKu for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 16:58:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9258880E44
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792429087;
 b=iK8PK+uvcZuDWU+QRaICRE1GqaT8LWntCqt4Oc1G1R//4x8xaUkwiInSmyQulVC23BHD
 udA8C8FftFQY8S5iVOgpHDzoC/7ND8Sa/NAx56rApGPcmVwKbWh23VYlDbMIabJxlvBcU
 eNmSjyVJbsVLTYzuA8qUYEvkY6Ubb45vRedoB7WtGF70kgUu5bLoITXGwC02axg6gx1wa
 VFoIfDBu8FQ9qDIUa4uAjBpc8aIcV0jpbXTxW+Pdg+Kco9qPeu2chdIk5rQTAgXQJqeo4
 Y1pPCjQYyd468XR/igQPpqJaeoyTJ6dv7qniDRJCb9PUp4+eCPz/vYmMxVa6KVGX7Bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792429087;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=8e+GmqBdW/W9VRvHFRzC8LDN61oKxQmmC3RdnWV4Wss=;
 b=GkWsyU1m5W5iv5KU1h52VBJ622u1Tmap6WYp5QT7S8+ZM6TuNaimNMcAxyTJ+WeF4rOD
 ngCjfrOhKvs5A3kuX8BA+p3mawqTOPSjI6RpiSl+5kG3WL5V64sJhjnavvHLaBLgDzO/C
 XmUknygaPqoP29SnZhrVoDCuTM7Qidh6Ff9LhSEu6wxolCFd6hDpWwcYSX0JPamZnGlNG
 i/tIZNa/D+YMSwQZUVbDoIrGKHzCaZgQTqxfgls7Mh5XQj0zcqaMFhNDPRrC2VMvRl+Mp
 EU6+/P5FQd53o9IFg/ZPjlaZ6/F9bhxfUKy79PnQciUaS6Svb2snlvGpfKOtpijvYPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dmHjW9R+; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9258880E44
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:58:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BF294C5CD5B;
 Mon, 19 Oct 2026 16:59:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7678460582;
 Mon, 19 Oct 2026 16:58:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C71910328CE7; 
 Mon, 19 Oct 2026 18:58:00 +0200 (CEST)
Date: Mon, 19 Oct 2026 18:58:00 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <atZMFLJ5dncS58_w@windsurf>
References: <20261019153216.917663-1-titouan.christophe@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019153216.917663-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: fix hash for LGPLv2.1
 license
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

On Mon, Oct 19, 2026 at 05:32:16PM +0200, Titouan Christophe via buildroot wrote:
> The LGPL v2.1 license file was edit in upstream commit 4225417da2 [1],
> which is included in ffmpeg 7.0, and Buildroot commit b68bde5643 [2]
> bumped to that version, which made ffmpeg-legal-info fail.
> 
> Fixes: b68bde564339e96397929b45c04d137bb65df43e
> 
> [1] 4225417da2 ("all: apply linter fixes")
>     https://github.com/FFmpeg/FFmpeg/commit/4225417da25e45ec807d44430fd8cc004402df02
> [2] b68bde5643 ("package/ffmpeg: bump version to 7.0.3")
>     https://gitlab.com/buildroot.org/buildroot/-/commit/b68bde564339e96397929b45c04d137bb65df43e
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

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
