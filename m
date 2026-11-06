Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78F606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O2wAR7th
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D3660AA5;
	Fri,  6 Nov 2026 16:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQ7HDESwhqfD; Fri,  6 Nov 2026 16:10:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9FDA460A97
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981428;
	b=tVP/sqMpoebGZoSM3ebJazDnpdyS252sP6hNeDgFQ/yqhMe9JhnLqUFdijKXTiRdcNF/
	 MB0LhwUwKAH0VFcCdCOXPNXc84YE8ljg8wY9R09H3qtyj+1NGoZFfKqaRGueHoEbN8PV7
	 S06SHqmgSJINYJAoJb5nER/RqBKhxv+Q1U8+yYoqpBWkxeR2eV5TAe6oGGne00dQSxOX5
	 rkh2+7XAhRn0OL74dWGh0u+olvtQnJC0QXTrckYoiGg233f3i4ycNeakG6wuqo+0YwnRE
	 u0gTI6zc8imKHYfMzIwBl6M/Z8w3moLwE8bcvrOal9VlrOqbYEsKLUBraS5wLjWq0iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981428;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=h0EgJNx3iIP8pYt9hr9c/Qn1GPOvRPDYlPNUOFwiBHE=;
	b=CZwU4W4vAwEQPu436WFD1jEn+dhHN56UQZL2bOAJeNfxL4LkBWOyB0BSYCzbYDNG2geU
	 888WITP+xw/XeNgEWjC9jCOA0OijtSPHjeEuCF1KEp5gXIyE/YwOzejbGyFzj0Eu3cE3D
	 6+hL4bAmtAE12MsxSNFt41XzVGRlRdQGpVzso785FqAbUWrm1KOcF4unlMX9VyfXA7hxe
	 entckG88bfiUKtK3EXkledisBMg0RDhE3bQc6YTvYuIC+hzGILDU8LX5nBTEc9Td9lLhh
	 7qHsgKAe6FzJb57rZ0I5m5XnBIjW14ohUHBUlxNn9f6gBftSIxHmbMgkHdAQc6caMhA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981428;
	bh=h0EgJNx3iIP8pYt9hr9c/Qn1GPOvRPDYlPNUOFwiBHE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O2wAR7thf59+qUzTnCpV60/i3jQpllTJEN4zh5FINCDHeYivC4JdZthArtQDM1ETA
	 u9TkP9hw2prkYKqAElDMsChDO7p1Voq4EIrLxUU6qxxdDGuKZ/dyam+as3KIetLSEH
	 myC1NBCAvoN8iKO7Zikgv5AD7IZv40pb+CB1e50I3URAzRh2zyC3j1xlJD7LhTseE2
	 M5h/jeowD6n3gzQ49aMs0cERBlfcRXSu1LHGySA4cZ/NxeWq6mdI3HD+xrOCgkyA/8
	 Dfhp+BKhAvJarg/O8M630CwDnRVNFRok1AxJNE5EzQvx/HlCjnUoFkqGeA7nkcPak/
	 FkjbXguiy8lOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FDA460A97;
	Fri,  6 Nov 2026 16:10:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 147E34B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 063F181DFF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNe6ykRLJWBf for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF0CE81687
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF0CE81687
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa87so464673f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981421; x=1794586221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8FZ+Ma0vvBYwPsisQmQ+LxjloY0RRc4YaZE58Sc4e7M=;
 b=nndj32go84IqtkqXpwCwJvd3dCCssccThSas0yHRdztFps8Gqqh1ADVkp01GQReP77
 KIqu+waMNtC/2ScGJpxmUSrxYju/MZ05OLHk2ZGV5yUcxJSnHkb0RXyzrqfH0n6AC5Zp
 YxEJEAi4SGJXfC7QV1IX/5iJH6vOUP3QqHkXkwtjAGKM3V2PYp7eO9zFBoiHtFFqpcFW
 AGm/eejq5jXVFYFTDmiL07/U4Sosuo6ejRdiMn0zl+mxEyXbzC+UkgerpOT8Uq8zTLCT
 XipYB9Z1l17Bifli2IWM0sKq7sH6aPXDq+huDganIeuR5W7ebLh2ffVtfFMOmWAObZj5
 X1Tw==
X-Gm-Message-State: APuU4Z8lRbuxTIdIx59Mr1cY41oNiU/IgImNG0EXKKqVAqeNNIFKXXZK
 FPdvKTnHTo1dE5y5qBwlC7eDKz0FRrBEwSG9CXmEBfesEBSNrxAI2uOlZvkOjv/VV7mewGwyRyA
 LsbS7mh0=
X-Gm-Gg: AYBFou3EZMwZt/JBVImz/2/76VEqRvQhpV5Sxof40LxLXEI/Qnwn2BPs1iRTrOuTQPL
 ozGxQN18tfo4jplQKtK0jU64JnivQc+igBE4JL0PWt/HflyO8mjLWkKHJIxE2FMAMyih4AwjGSV
 MAh260W7sd0RyOfpLtrWi3PDgBN0AFtzDDNYjxIKm//yFf4G80XObpZ1OHdCv8ksTBJptu8dFhs
 YJd1irF1Ppksc+pO+A0rs430/l8qOhTnqo/pCIZtAhcnnsVxPwccokMN04yuoUyaccQLqIeBD/g
 dXQmRwHXvuxOGp4XTv3e4A4CQIw4go27Yv8DQqV9N3d6XoIW+e6o2SYtZJT2Mog7bgOv35H3C9o
 Sibk/uyz41OAGXX0zfgBRVVfD8Qi8alGdpHKAsE6grNCKG2Q9K685uhoo9oxTwd4vbyJhgljS2v
 3hY6MAfbJtM4nhG5s1I/tJiTB6aoIfpz4uWYIREBl4fiHsHO5iSykAFGtkBjojMppDzndlHDzyC
 VKShzMtMhRnQUWCoQwtIwWDNaDY9cYuiawQ+1f0o119+Kk4mcvndPbxNuUPZuxfmc4XjdowXmv8
 Amp8IPumHItoR0FJhD2RK6zuTTznkC8=
X-Received: by 2002:a5d:5d06:0:b0:492:ea10:b073 with SMTP id
 ffacd0b85a97d-492ea10b327mr4736819f8f.18.1793981420926; 
 Fri, 06 Nov 2026 08:10:20 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d609b1sm4254379f8f.8.2026.11.06.08.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:20 -0800 (PST)
To: buildroot@buildroot.org,
	Peter Seiderer <ps.report@gmx.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:17 +0100
Message-ID: <20261106161019.607583-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027194638.2165377-1-ps.report@gmx.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: security bump version to
 1.2.6
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
> - bump version to 1.2.6 (for details see [1])
> - fixes CVE-2026-102486, CVE-2026-102483, CVE-2026-102484, CVE-2026-102485
> 
> [1] https://lists.ntpsec.org/pipermail/devel/2026-October/011062.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/ntpsec/ntpsec.hash | 2 +-
>  package/ntpsec/ntpsec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
> index 768ee75a86..4bfe81aaae 100644
> --- a/package/ntpsec/ntpsec.hash
> +++ b/package/ntpsec/ntpsec.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  48717ea84a8c89bfa082ab5d0dc58b44e6328158632e77d2a74c85b7a509e498  ntpsec-NTPsec_1_2_5.tar.bz2
> +sha256  c82f213532d2a5b5e9c368127287ba69a20e3116bc134e64a5c767f7c96565d8  ntpsec-NTPsec_1_2_6.tar.bz2
>  sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
>  sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
>  sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
> diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> index 0fa8a3f527..a67308af4a 100644
> --- a/package/ntpsec/ntpsec.mk
> +++ b/package/ntpsec/ntpsec.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NTPSEC_VERSION = 1.2.5
> +NTPSEC_VERSION = 1.2.6
>  NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
>  NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
>  NTPSEC_LICENSE = Apache-2.0, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
