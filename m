Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF2606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DNs7SPw5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE23C60668;
	Fri, 23 Oct 2026 13:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-Inyz8PQe4M; Fri, 23 Oct 2026 13:20:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EE5CD60709
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761629;
	b=GM0GH8n2jNvQzqk8Bd1mV/8JMDSOkxXoKPaT60PpsDJpSYVJJLbQRH6bSiKEHlYl7+m5
	 cIlKnnGrN844o/xv5ArRx8CTeF0w1RtfI33/FufxzgI5F4qpnlt2mw2Xo16ytKNksj5nN
	 sgZ1I6EzzSf3QgT2A2rkNAbaNwdWDeVRbPJEN0GiHZbpEpEOdvxTu6seQyYfYWvg4u22Z
	 uqysWLty2XnbtW5HFHGUynJB3fZWSCH/QbEkicflEul4LyBIvTPnMFAc3ti99j2Zh2iv+
	 FvMrUey/hccqqRRpEC1m+K3M9Qv6aCEnmI21vqxFG9y4bk8vzDe13mw9ANRKmJzZjAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761629;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0mJ1i2h7xO3PpToumlwcf7ToCE20UVV09/oZqcrIuIo=;
	b=Dq26GB6NRjmB1FHbVhyR0kX/zbHd+y2I7614B4S8TI+XBQYQU/nMMAt3DqyTwsL7qXY6
	 qostIDLWCTMUdgD9RcpPoEtEQS44GcIv8o+6UEJ2Uzx1RDRIfMLQ2IYB1/0ZPKG8pluh/
	 /etzx05Tyjm22dxZHQvGucI/0uEkuv/TYl+A/rnubqM8alnRZw68xM5HiyrxUayKr7IWD
	 1djfev5M4zMdKEy9iFNjN38/ybXCmgh+LgLC3H8lIR5xxdgZE4Us2lZSM162cEDZl9+Kj
	 wMjx2vxcNSRTOX4DBQO4uzulXDikqhExw8EF9YoF/keRKG4RghiaxZwYql6+29Bu5GQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761629;
	bh=0mJ1i2h7xO3PpToumlwcf7ToCE20UVV09/oZqcrIuIo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DNs7SPw5xhWNJTmdinWn21j5C+H3LQ/Q0QnfgubhpE7OgzCvRu+Vr21Sox8s9NEcF
	 udUeiroyGP+k7//Wmq6qgyaKiJxny9wGUU8G1Io9iSCwmUNotb860LJoQA63W02PaZ
	 X+xn/LjdlRWyCVu/1u3IJX6dQs/DShzBFXlWCGaPUFb0wD+GfZ3slZJIousVyCrqlV
	 okZpaAdya9a3YIbDDUnDhmE0VJJ4almgWuUBJMZwbD+Wa3Dam1+CBnABkOR9FCDhWK
	 3nbWKPP2MFuczYebvCbge7hWlKxoez60L9dw71keCqNhPpuCXv2cYi5PHGiQbrTyVW
	 Jjl4S6iUHcAsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5CD60709;
	Fri, 23 Oct 2026 13:20:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06AC43C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E002C608E7
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBQHkH22pOCr for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 11FE06070F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761625;
 b=NyIlHVOIZGWWzeHc4gN2nurQZhK42O8cR/1MNXNdh+koBdHehMsQxIeCyyGp0+mb/deq
 FHWF1msXGev55EPQk2EIMoHU3Fc3l9ZJ3V+HZkKIKzHfiSEm5omrUbkYC2Kz6MMwwHo2J
 XOFYx8F/e8kGER549Edtqj5wEHgBBDoNe5L5odnan0iguYzufDPHrgxTOO7j7nYQu9Jcb
 s0vKMrdUYLgK1CJRoxR+RLSDGr2grt5N6jvcAsRJyV+Rc+dpiJ++dp7JF+ZzmfnF9cudA
 K9i6PmwezwcxZZSZf6VQ0zzNx9J//DpMBw+xKZvskAR/b6MH2nK/jMjK9OWbvkS/ojQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761625;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=34G3/yHVS8gh9sv1TB4s45j00c/bLUATiRKL8ckdrcg=;
 b=SiKJdmnpgyW3/5ffljYe9CxddlT0E/OUXO3dAAUrPfy9u4PPR5wo33k2Ej3hJ4Rda+7U
 vWGHagB/67239xFlMeaSuqtA2aReMaPrEalOBoEF5ESo75jJjRlvUjIejDn05qNrFBTQX
 5+K4rW8f4YEarQkCeZurJGEmHPvmo91n4bT2aV0df1WUg27QVUYIneJQsT38Z+WMcXNn/
 hUzNm5MXj5/11gaVhD+MzvNCRHzMFUuhDx5GIton5GDMKX3EfNgpimjCyx2qyYuqEKY4P
 T/GSWELIOX8Gl0A61vMvcGTmy74n0xl5EOSmlauz5sKxymuc9CvkJ1cWWoyHUmk+tGQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HEi9eKVG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11FE06070F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a218ffa23dso2152165e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761623; x=1793366423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=34G3/yHVS8gh9sv1TB4s45j00c/bLUATiRKL8ckdrcg=;
 b=GmhwHSMhSHHFpxrG2g/AnzQNJl07cytQyDWe2frLq80s6RlEuVcX0tMRTlzKXzQm7z
 UueaggdMaZUhDOLjbWKiBhfufV+YKadRWdY0ZtJw9BQ3y9q36VOedKn/XADzcaTUoNTq
 NFWaE5fD5TUGfsWCu77Tc7/QwrvLWV4F2vSJtcKO1bGIstKQcuibrzUeaOPv8JEwdUWx
 hcvE4Ne4dqY/L6ypcSIrxLQMRHKP8FLBtfIXOTP7JAbQulh1AF2qB7QA+Gzhdx0PaNMN
 S2cB3RnIjWpmiZgAeTtsR2U7drbnJySj9yKD0raby6NLvQwWntKHZS4r3YPNWrQjXebx
 ZsZg==
X-Gm-Message-State: AFq9FYJ9Div0rzfKtHKWMC+sg6so4pOboEr7M6lz51pecOsUfOqY+747
 zD0XULSrQPBvMC5yS+UtFE/S+iaJcGcX3entT9kHcYP5VXSi3ll8uIMeMqeouN4TghgYjfMqKL/
 efQBCzG4=
X-Gm-Gg: AYBFou092BU0bQ4VMbheiNkjbhGORVk/ss118R8R1Da1JfB2jM42YUpmQP67YvLmJPd
 i0nQO0R2pMpA2aUqQNSCywZKLVue+s7q8uAtKXDx/6VyAU2a6/lh6Ysasg1JUV5vlTWMYFsM+xH
 jTsQFxjPzYjj+Ao2Emx6Ikss+5guuRlG8UJLr5VtOd7jqavsPJWN0PYWkyKqe4ISCxwiU07m1KI
 3Ds6qWPwYRFq0Vlu/uoEcBQ7AWvCLAOc5+YTSfA7ufJwOWC7frEAoq4Lm823gsuTDZQFVLG5e6t
 VANWtfGmDBI0be7v5hIeRvwUBe+dgCKeYk7Bur8MVjTpnJjwfQa+iM6BgxKqR2nZDL1VFtaA7hn
 yo1zIN21EusXf93S3dNP3BOv7pXtfW2K+o/V8TIcTqlFLty40mzUDnIoXPWThLo4oGSlot/kNSl
 eTe5xC1tELMmevJYjXHPKnIIiK+wn2qWzeub92TkJBLO/ztJsyRLnr+0SrKKYaYLnJ8ithMdjXj
 2Cg+uUfKkbhRj+IwpS1K2UMOzZ4+ht0J413gr8GruOPQSBWbYiFJG2sf+50zDkQ5109mCELVuVk
 vNQ=
X-Received: by 2002:a05:600c:46c9:b0:4a2:994:575c with SMTP id
 5b1f17b1804b1-4a211eff044mr44524335e9.34.1792761622502; 
 Fri, 23 Oct 2026 06:20:22 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2154587a5sm25752455e9.3.2026.10.23.06.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:22 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:19 +0200
Message-ID: <20261023132021.1606813-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016083906.2575324-1-yegorslists@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov for
 libmicrohttpd and libwebsockets
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 349fb1d26a..0dda356bf7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3591,6 +3591,7 @@ F:	package/libaec/
>  F:	package/libftdi1/
>  F:	package/libical/
>  F:	package/libmbim/
> +F:	package/libmicrohttpd/
>  F:	package/libndp/
>  F:	package/libnftnl/
>  F:	package/libqmi/
> @@ -3599,6 +3600,7 @@ F:	package/libsoc/
>  F:	package/libsocketcan/
>  F:	package/libubox/
>  F:	package/libuci/
> +F:	package/libwebsockets/
>  F:	package/libxmlb/
>  F:	package/libxmlrpc/
>  F:	package/linux-firmware/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
