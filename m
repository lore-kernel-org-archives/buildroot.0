Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3482606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Rwt5FWcD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82A7360B30;
	Fri, 30 Oct 2026 15:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 036NJb3SHi67; Fri, 30 Oct 2026 15:27:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A161160B1B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374043;
	b=TTfs8JaJbnKn+liq2qIi17x6g8wXumSxOIKIfoFUDolRSfKbR5Inydw3AqmLJ+dEs9kd
	 9ho/RP5Fv1NXy8W+o1ToZEeNZU1dEnRIJ4zC8KYo5BJ0/YYEbnNYTFgXE3AAwVZbNRcXY
	 dn/6GjrzggorqJAZAgbxweNe+uDMAuSCyJbYnqOS24znsxUbAnbx89PSF43ayJxewYX8o
	 lhOwHL4EPRfbGYZCWiwRN0ZOlFI9cIJG08wEnljHXlBlmzNc+nzTjYNkJtp9Pa3KN7D5S
	 2ihBzlbJiebVhaSh9df2CuB3UoJ9dKOX7/xzS1aEnJLDNCTxVvJ4oaM6LSThTYB3SYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374043;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SUCczLuO7XwO+MvNUcDmXPlO/+zLwuc1Y2/OF72ZSlE=;
	b=BIgZWA0UK3NUtrUHYPaqmN4ePOLKh9yvr4zNtd429woikU3Ab9yHTzEWAZ4YP7Li66mZ
	 rMiR8jlbL0Y5AwHwnqTgZYuR17OvJNia1yvVGlBVgBNBbgGY10XKd57284MuDZrODlnMQ
	 GaK7564xUZbeXC/typ16e1fKoiTTWj+oWF0gzJzaoZDqB7ncwbtjFrTTmCLrTHH0q+W75
	 JYGcQ6qi/cc4sCUwuctVqmNU0GIf/uh3cTaKmllrfknUNXfkj+4lO8fILNso9QhrT2dYY
	 6wejE0/jRtBmorq5EG5ZbvA1JkjB9WOig2D2W9TA61fpoXpc7GZEJRTp8jkK5gerDyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374043;
	bh=SUCczLuO7XwO+MvNUcDmXPlO/+zLwuc1Y2/OF72ZSlE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rwt5FWcDz+dTRwXInY+BZvkenmTmObqWE3ka69OcR179YJOzrL+5HhjbhTt4A5pen
	 g5yu33up4BeUfli/bBOdOG4U7yY6kAnm8f12BYO1jm2e1+jc9QwMmKvpGhIUHXBdQ/
	 +1fhwLHYLe8uQsIxdZxIwMoFUZe9WoS9IkRaWS8wWObvLm2Gb25Z/gMUBaFYhPkAv8
	 m9NzCG8AHjNkVHceKqgYyns3cYCGMSuHJbZwO9lRwx7FjCVzPgDjiWWAKoH3R9RF66
	 0v3NECYOrD1QqY6rnwCAFU6z+WOz2MA3cVPXrSLM1wmSXc1no9y3NN/iIVHnDVy8YM
	 InK2Dlo5L1Ulw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A161160B1B;
	Fri, 30 Oct 2026 15:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27ED3D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E31C40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqPe3isCnynP for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C078540211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374022;
 b=LQEvjUgGjrTm/oEc1rwCsqrR7c17HM2WPvrH/x6C1USY5vV9GOQvbvasHn5hUTd+Rt6A
 Bf+miC519xDbdImP8T47cD+OUVBaFKSpJeJ3dyHNTLxTS+16tghSDLx8g7Smsom7SHyZ+
 Xx+hjCkm+CEOqDVUVUQacoV0+nMWQt8FED2QDizelaqLOGywBtib9IqjI1dP+yYUPwcoE
 46CQ8s1BD8ppA+N27UqB9EqXsqNIIZXT2mXySyMJPhABnVYTm2nrRTejKLJ8RJBD7G503
 fbs7tPmgf3LtYBRSZiFp3MZRqiQ4eoggaQVQ7qlZKBVXwiVTTP3eKEqGc7rwS5jJbKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374022;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=mBrAbeuIct1/MM5WR9Pp6NhVPpoLIzVWqglsstilHaQ=;
 b=q4ueYiSLVJYqt6KQsd1O/d0RWb7fs+dORN5g1YFGQVlbNj3Az5JvoJWMG/eWA0cw5nr6
 f+nDQRBYy18yZYehjqOSELntA3YtotInV7r2LbUgGLtq9lOPIQukvKu2UA9FfDiJrNi/T
 int8F1Ndxkss5HcJa9DGiUw2uu01MzlfoHMQpQ3qvA20kD4l+MU4fFUjRLqpoOXAOUK80
 3Opipt0W0d/543oEOsyycGF+7C0wv2MNE33sMvxMvh5/MihbaR7S1H9FewAxJH16lyVY7
 kFX8Szx/ng2cK8FYL9xfCrvu9whaSGUBsSfB5K3Tm5Scx+U7g3C4ZdHXARq52mPpKTw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ifd92v+v; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C078540211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:01 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so8798195e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374019; x=1793978819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mBrAbeuIct1/MM5WR9Pp6NhVPpoLIzVWqglsstilHaQ=;
 b=xfClpBM5RV01NjBZAzVONIoWBvELFIoLg0bbvb/1x9BWX+ebZ+id6F3OqafcEK2fT7
 eNJABwcLoyUrabvrdPPXWyA3LYu5mlKfbqnN5rZpT5zCjFYCGpTSDiD9LsHlgRC86z4f
 37ITxxE4QUxbWQH2E8ldDwYt9bg505hg2OR8B6w36qMGPcRnsBX+/Okjp2HwTt2wcsdY
 RmI3qMM5WBg1xrDk9dZAiY3U+O8VC7EekqBcuLjKpV4gxXTDOxJEkhMJwihotT1BGAtk
 I6cX5Wy2kDdDnjgrwkHhrUSxtXUkw3apgfGCVJCSNlbL7jojvpRdyhMEEOqAsv7yCk9Z
 wE0A==
X-Gm-Message-State: AFq9FYLUKnFOGclC5oJUwu6LW9t+AxtnOq3Oyf3Sv5pwqurcyVb1vzI0
 OatSKN10ypecWPuWzZ1HBbS7J954TwvuQonvYNasoTAY3g7GX80VJGK6oL+pqQ8A54rSNRDMxjC
 cKKasjHw=
X-Gm-Gg: AYBFou2N1o0Ab9xmTEpnXV1WDNAqOnYWDnhgey65hs3jAKpAGZeiazZzg+Kj3HQ+nSB
 mslHCTdjHvf2tNJOKz+KeEaGOdxJbIYto0yRcIJcuxpPzM30S6/uIx3px8sDbnQqbDMn2mYzEYw
 +3h4E+kWog9ca0QepW3y5LjJb6LWymql76YdKhDTgCv90a+cyXpGZuv82WqkAeUtO2ElRjNedus
 BEDIaPON7rkbdz1CMcB6DEKHPR34K2c0yEBmHL+dfLekTaYmok15YstfVQCrlPaDP9I4lWngq+b
 QbAnB4alnxob+zinLnVcT1w4RgFlMrzIxbgATEHhAdVKWy9lvWTzma2U96VruRqzjvQi9Fq+tEv
 NLTXzb6TazXxEYnTEBt+wdcCt4m7H17OjceeOEJdDycsx8lbHzR8rK0fa2+9qz7Ro9jze5VDjU2
 Ww1LcY4G8NLbCXHIJDf2swQD8YDo9GZ4/4r3s8j/i+jbrNt2rHkgk5PIBbCgp5IDldAetRsLocZ
 NWnhweOPEnSn50Lg4LW6CPescj4fZPYRBByRQ8d+XBi/R2zuGdWtX5YlIFy0htcdXWEOb4aKTFC
 Q2YHpWXHBR9w2/lWVxeUCpRbObNIQxJtBrTHpZ2OVePr8wbN/FlguGQDI2k9KNS8UNwHLMLH
X-Received: by 2002:a05:600c:4e44:b0:4a1:7bd4:d07d with SMTP id
 5b1f17b1804b1-4ac1932a2d5mr58753905e9.34.1793374019590; 
 Fri, 30 Oct 2026 08:26:59 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ab61d8b9f4sm104237825e9.12.2026.10.30.08.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:58 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:56 +0100
Message-ID: <20261030152658.1906475-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019193044.900785-3-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/fmlib: add warning about the
 need for NXP kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Building fmlib, either on PowerPC or ARM64 against an upstream kernel
> will fail to build as the kernel modules include fm_ioctls.h, which
> doesn't exist upstream. fmlib will only build with NXP-provided Linux
> kernel sources. This commit mentions this in the Config.in help text.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/fmlib/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
> index 459d5bf102..17ab47ec08 100644
> --- a/package/fmlib/Config.in
> +++ b/package/fmlib/Config.in
> @@ -13,6 +13,9 @@ config BR2_PACKAGE_FMLIB
>  	  configure driver parameters and PCD (parse - classify -
>  	  distribute) rules.
>  
> +	  This package builds kernel modules that need header files
> +	  only available in NXP-provided Linux kernel sources.
> +
>  	  https://github.com/nxp-qoriq/fmlib
>  
>  if BR2_PACKAGE_FMLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
