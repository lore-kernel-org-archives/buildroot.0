Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA82606A32A
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tt86CaEA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4EF140829;
	Mon, 16 Nov 2026 15:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVUskQUiVyHJ; Mon, 16 Nov 2026 15:40:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DDE0540810
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843625;
	b=DwEiUgAx/Zromex/xyTREk67/H9FPQcuPNp8korVlf3nSnsnQMtRqRG8kyrWcMdTN+g7
	 TaY4DeGxFb7oLmOY1tKqB1KVQ0E5O+gLvCon/Afi1MCFh23TMYKz9aK+PcHrME7U0hyyz
	 2zxK/0kP6Outvl6xT4PAhn48E/OE2p5J932LYg1+D04T2SD5VGJSwQdeziuihs0Ch+mdC
	 K02FICwdqaydGOgmQPwLM1c2MIHHCHQgAQAA98qU6QBCStJc/QoSsTzRHt4iNMYx8TWfV
	 xLs27FgBH8O4TVeK8RE4tXyaA5NC73w2PeHh1TJeQNXLR584bvdA/eCA3MIk7xn617Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RPmU5nBCJ57dzN9j71/Bzum6tczomWsHp8wtrk3qro4=;
	b=BmWcwBZO2WguR0qM/gNLMOkEb9CkmdQg7OW79WmAGMYoGKLpL6EwbSUs+ucsNxph/3KJ
	 wvGi/LCj25CfMFDEwehZl4gntGm4KtmAVCy+hxc3lits2GrJcYV6uo58HsUYYLxz1EZMQ
	 7ZjUdb+Fcsq8pvICVfy4NiatH7lnMe5i3Lidjf4dseAFw6EgjoRMSFTWa9nooRVVnpjlS
	 2mPFPbXb1GrdnyrskeJ1YhcKBeEk6DBWjhtgD2wqQBqTGnk+jML8QOhlJJQxQCLtIyvh6
	 wCqJL5a1z6qK/jlTP2UYJvH/Jz4D3fTv7lBJzzqj5Za/TwMcEOSyt7O+2nUsB7wJ1Mg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843625;
	bh=RPmU5nBCJ57dzN9j71/Bzum6tczomWsHp8wtrk3qro4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tt86CaEAzaYJyCgwHHGs8vGm8lCooGVswBCP1RGMcWpYlYnas28RM7DfNAgD0ighs
	 J5mNcNiajxcFrv2ZG9M06quXPs8aRQaI3SlbjiiKIUmaSC8ZL3hDe0QpUJgIdNilr6
	 6276DJtlLwa8mZHY9pj6yNEutvOxcvq0i3kUODc8bpNgwBOpIYI3o3jFKAeoSdiVHh
	 nt9soLU+qKlWaONRUog1gVneSTxMNEoBShVGbj3zIaSEBslvILUHj/lhcx6xg4R+I1
	 IM2m5Uefd213jVLD+eflILmPiUWx+qB66HoeZ19ZNm6TevSaZ+y5XggvoAmA32K/Y+
	 CxEDCqYWxw5UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDE0540810;
	Mon, 16 Nov 2026 15:40:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F808109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2664340282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8R7ZTgy1HJZ for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BB5254009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB5254009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so20150315e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843619; x=1795448419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4a5cdBMzC+lR+ZtlViR6QAp6yeYbgRxWwv12s0aYFn0=;
 b=iBEJpHZvm4ZBxDCPIPqr0xfNIoq9yMH1U6aarOBecqL7if+/ER1/DUiZZHVGsUI9k8
 8Ab9JCNzYiO7j9dIFAWr1JQYlC0/LRdPnIme0I2uQIuK1WO4UCjfnPAt0ZFLSiyBbvrn
 A9A8aLjFkeazaV3LOnJcBUqOhrWSA5aQvNENerlNkkV4xtTCB/AOstRROTO8EvJBm/XH
 /hh1xeG2gANVNSRBEr93h6gqqcpxfwdiCRNdkWStmklT/cVb+izbXOGc8T1wa+U8zb4U
 MHjBLJsTWOu79Cj9LBcVdw4NnHWQwd4Zd8esyoIesbBN3hYtO1kFVHk8NcwJ/YQGsBRY
 GKGQ==
X-Gm-Message-State: APuU4Z99TCow7YNhI6dY0Td4BCSW/NSC193+td6r1T0oICV31Ug+M5wP
 aqy0XqZAJs6TNRgnGaenHhQMP2YoO2bcDBZxXz1htax1Z4WDaw7XnDqrr2l9sC2eHpMf65N6IWo
 3OlN0Mbs=
X-Gm-Gg: AYBFou1FBCA1iaxae1nBaqN02jPQVya4d4/VTaRzici/RUFEYYnYfHKzIcQw3uC8o1P
 lSUa5FE1a0IaQRbjzdVk47poEkEcDMPnahFV/jDXlkL2wI3Q66sB3tkyJ1pEMRuZy/PTsgXVT+C
 d61S3ojwRM00IRtNZj5PSv0wiMhMGNMDbx4pa5vr8LUq9WiaF9vdxbRojssWpb358dhY3r8R+9k
 gOtxlWXzpJTV4Y3DC2fXfyozSGHxiS422KQFWKxrFB0NXTnVPl2eS93R+SWWLyfa2l5TtR5xajx
 VRDihpj+wLw3Yu3DeHnowfUg+7cx7/wDi3Ls3SUIHAMc6iePQL7G3KvK17A6XSgXIijW0CNc+jN
 jfbOBh5MNmZHaWoTVJd+j9cJ4chbd6RpsyyNl5eIZ+h3pVSdDLfDilA19nsoNwZEP2+21ClgcVa
 PrA46KtqL8ei+ZfFj34HieAxFYsJAyrn8JXKvtfk7KnGmOAz0jbBwdtK+ZcvLEeCJiJM1ypmoUj
 A38F98wYKouLSrO8OZEBNqhfZ4Xjo0hNy2XXLDjYtr72yLwwkgZSW7ssMQEbiWcp3Nb7QjC0iSn
 CQQUPKZsnWa383K/rACh8vtiVwalBYQ=
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id
 5b1f17b1804b1-4bb6a5a7a48mr121213055e9.20.1794843618712; 
 Mon, 16 Nov 2026 07:40:18 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb6caae30csm116375895e9.2.2026.11.16.07.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:18 -0800 (PST)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:15 +0100
Message-ID: <20261116154017.725870-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105095044.3677933-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump version
 to 10.6p2
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Security fix listed in release notes:
> 
> > sshd(8): avoid password authentication bypass that is exploitable
> > through sshd(8) that affects some Linux systems when built and run
> > with PAM support disabled. We consider the root cause of this bug
> > to be outside sshd, but it is exploitable via sshd and can be
> > avoided there.
> 
> Plus a few bugfixes, full release notes:
> https://www.openssh.org/txt/release-10.6p2
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
>  package/openssh/openssh.hash | 4 ++--
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index a53ae817a4..615223830d 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,4 @@
> -# From https://www.openssh.com/txt/release-10.6 (base64 encoded)
> -sha256  a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39  openssh-10.6p1.tar.gz
> +# From https://www.openssh.com/txt/release-10.6p2 (base64 encoded)
> +sha256  9ae44872090cf2f06b3cf9ff147e7f16f309671340763ed2f99248398ae29d5b  openssh-10.6p2.tar.gz
>  # Locally calculated
>  sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 27cd5fb169..3ffc2328aa 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  OPENSSH_VERSION_MAJOR = 10.6
> -OPENSSH_VERSION_MINOR = p1
> +OPENSSH_VERSION_MINOR = p2
>  OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
>  OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
>  OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
