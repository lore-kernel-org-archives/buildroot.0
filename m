Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9F606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G/l2J7Ja
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E593F8135D;
	Fri, 20 Nov 2026 09:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xf7_nkjX1Dvf; Fri, 20 Nov 2026 09:59:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 08D6480E6F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168747;
	b=ECnTjOUBL78/f4JLBuDvrmndaEKmd/hcHGxqpLK+aJti9+JdpmDDJwVtrcZpG5+5KnMZ
	 swaibEGaaX50EhzL6j6wZQ9bqYcqJ3N7EtPeUMtLmxlBe5OaxVnP3lrTlIt/szOJZzTHv
	 EqhrxL3IroDvYpi4/4/xknO4kPux4nbgB6NBMyAS2cvUG/6iJwKXm7uL9/+KcAQ/qjFgg
	 X6xaMTfyKeBaZZOY59BmFRCoV9bCOmsbn3rsL18kHWQd+wk4SBlWtXKGIoUJ34HfiIW9/
	 pelYwLm35JZP9U9piPOh5Z32xF3LP7ZHXdSKCp8K7c03/RZCDhGT9QuFCJa3v0Q1hMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hJDjij94fMSKd5evK1mRsQQetaTKtplBGO4QKn7SJzY=;
	b=k7sRlChZCdF+80ovxO8CuhseQyxme0v0zSajgmDcdNdJEXJ68+B2hb4MGrHqVhLKu6st
	 Hq6cXfRkwqHc0jyGB0tQ7kixOmQFzf/lf5fPcLZhZpGRSORAfO7Q+HtOhIwC2CjDrllKp
	 0KQe5ACNe7WjhNVRvUe1L5ZTr0ksDP64N+s4SYhUhTAbP/hjzwkc6PjkV76Z5Sa/znNxf
	 13+LE+jyo80/eTyPe7h5yk+fGSt47IoDEOGXkjB0ZycqQNHGbwTsdh/frztLSJjhx3wKX
	 x1hkuKiQLWiBZ+BMDxiqJ6mXse2EIzTNp/ykVnT+hGL2ycfzVt1Mw7kyw1OqH/0ee6w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168747;
	bh=hJDjij94fMSKd5evK1mRsQQetaTKtplBGO4QKn7SJzY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G/l2J7Ja8VZg1Cey749wIAKZzk4UIIYTZoFuTTeIcSIydQK5gLGLzA+aVjQd1dGDT
	 0lA11cyKh8Q/FBDPiuhIeijAKH3x8gwe+dcF0hY0ODWNgVVPRsGmI2yJtAC29Sav1q
	 uCaDoxVgpO7UBXmfz/ekSqzky56X5u0pW7MuZq8Db8eG9zQUMqXsE1mkOwUx2YtQSz
	 5inBZjx2X5y/q5q3hWdUBSn52WRGzVYgF7X1D9ZJsVUuvfeM/RwzyYn9PuoEioEl0H
	 PaDjzUdRuZ+9YJVE4jsfUwlugvMpBtuZEC0lByXFqnd8vyGTlxBBxeP2JURIc/tIQn
	 aCJlIKNJbLqTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D6480E6F;
	Fri, 20 Nov 2026 09:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D376E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DF3A60E5C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmWw8Mt1v-D4 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4EFFC60E49
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EFFC60E49
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:02 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-491846221ffso523258f8f.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168741; x=1795773541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K6PsndVMTGDx4n0xo8XeB9WXBbryBYLVqevdizpWmeg=;
 b=EpadJmqS3cm7bzzVeNCegc+EZY3RLoBKjilKQUC6njqOMgKvASzhMjML3KMVilI5vO
 tB1bX28/n72anrMVo3wVROO7Q6d6HzToqpg0vX+oNUuUWtlNx2Bib58ApCYF6y2Zuv4h
 ZdnB0VTuTxivDU0d5WBc/D374E3bax/8STZkYV8D6Giam/a0f4icj8/Q3buhjeyQvneA
 ti2DygbyX3og/byg2ohq64VZWGMt2D38PDlhLYVm2EyxIKpg85oetnLHdkhw9Qgp5Mqq
 d5knC3+aT/SRRQTVWG2exRkkzqLohPR/xK8TV+lSLV2WdHrKZgWLxFgGoaxbeXPXt5xT
 NBPQ==
X-Gm-Message-State: APuU4Z9eBQLau3bMSU4hQkFywyeJkxy5A9HDwWkMLJXWvVPNk6Ykon4K
 jrh4ZuYkXjWODLxnOQAVsRqrIE6fZyn4OJLO9/S3tVbqJjc8lQ6nxC/qtbhBARMtfXHZTKCSQdx
 y/hOFCAYuFg==
X-Gm-Gg: AZFdTZciodg/bERayXRzpJFOw0iYLJwJv6LMQ8cbdRIAP7cDfdQVR1ksx9liBBjovTg
 JTadS52YHOX1PRNXpvmOE+1E35fNQZJwIZKQlSwTalI+vdScDcoclBHW0wBQ2o8CYr1bsWrMSBm
 khGku2jPSxgtxJGrKKqV5sya1vMSx13yRS6MtggU5TgI5xaL5Zu/ITmaYUt0vtcvL6/3vlQVvYh
 6gPQ4Mvaehb02GtTDNjhfg8dCA1KBP+UmNjc6vqLinNeLjZ9w4GtUqdnv5fX83Q60nwTqNQKISG
 cuH1ZaxWzIf3SWMKYDuJi7eTEqMCZM4I3mR4nlzF46k59gTunwYZS0pLjBv3R1OKI0zrJPW8HP/
 mC+t6U5DdDOsDeSRZAddMG8PKX1Kp/H+B2tJSqF9B0UUc7bkWS/QwObE/SSR9/x07VcPoavlGFu
 MO33Ra7aQreQrb0F5gvdf0S+pJQElUahnYgS1LS8/D4cJ9PLjNxFV+Tj5rGvGwoFOkQ5vxRbDWD
 4Lk1HKyuShT0LRtBnm9eOjZp7fRRUW7wc3jHtYRC14/GeXioANaREUuEXRw82VyV7slNIK3irEf
 QJNggEpZ/gOc64FvZYwk11XFNaUTfhQ34xEuL8Aiceflu9xESEnMi71rU4Tdt8uaPg==
X-Received: by 2002:a05:6000:46c7:b0:48e:4561:8a17 with SMTP id
 ffacd0b85a97d-4abb1baab22mr3300147f8f.16.1795168741211; 
 Fri, 20 Nov 2026 01:59:01 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f204sm5190138f8f.21.2026.11.20.01.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:00 -0800 (PST)
To: buildroot@buildroot.org,
	Adrian Perez de Castro <aperez@igalia.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:58:56 +0100
Message-ID: <20261120095900.538597-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110165045.3679658-1-aperez@igalia.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: bump to version 0.13.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> This release fixes an issue when opening directories in the new root
> when read permission is missing, and introduces support for multiple
> --sync-fd command line arguments.
> 
> Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.13.1
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/bubblewrap/bubblewrap.hash | 4 ++--
>  package/bubblewrap/bubblewrap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
> index 43b22dcb5e..2a7a12ee3b 100644
> --- a/package/bubblewrap/bubblewrap.hash
> +++ b/package/bubblewrap/bubblewrap.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/containers/bubblewrap/releases/tag/v0.13.0
> -sha256  4734237473c0e5d695e4e9034a34e43b2dbf5164655bd13fa59ae376b2b7a765  bubblewrap-0.13.0.tar.xz
> +# From https://github.com/containers/bubblewrap/releases/tag/v0.13.1
> +sha256  0e85c8702248b8dd64144f594147553650cdd0e4c951690345faace79c217c4d  bubblewrap-0.13.1.tar.xz
>  
>  # Hash for license files:
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index a58d7fd143..4f63b8ef90 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BUBBLEWRAP_VERSION = 0.13.0
> +BUBBLEWRAP_VERSION = 0.13.1
>  BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
>  BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
>  BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
