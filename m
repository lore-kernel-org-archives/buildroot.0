Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6EF606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FDSUZnM9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63379608F2;
	Fri, 23 Oct 2026 13:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfGxkBuQNB7W; Fri, 23 Oct 2026 13:20:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A2EF6071F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761606;
	b=QvSCR/3BJtjWB6GWBjXbsPjn5/5isXO2JxEKZ2mTL7v8BdgWSgrVFCs1KhhOT6KKFBVG
	 Sq9uNKixRf7i0OdBjKRTDqBg3aZFV3uuwAEbYVCRJPS4dfPboF1jBLS2HzzKhLQlAHqbR
	 WveEWbDt0h/WtIs3+oSN2ha9UmCy10OW0zmwNAEY6Zo5PioxcuLKwIsJpw9x1RDIFJWCM
	 J4fE7zoykr6hOm73gMEpE0gG88+6dfQ3Cnvet094bzbYW/+H304p0yhPwsqCi37+BvyaV
	 HF1cY9p5MEv6Ght2JoVQztz6X4FFMHH4b27AtKirxltuS5zCzhd9CNvDdGnFLyrFokA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6ZYeAtQyZqXb4ylmESWoWzqd3iao0DrhWPj2Nko3M1E=;
	b=QO/iG9VHeOOT/Q6pNKixCJ3GyaCQnPEEXNXoBJVLibizCsrZWO/cSv5KIqOtlMaRNbxZ
	 gozI68w0blxkNj9/bVAu/pfp7f3iOXTxKcI5Ctylcg44FRawtQi1h7eE3TSsIwgWjHSk6
	 ZgWZcwoFwNCa1uLNKsCwME0ZQj0ljTYJ/iVx3vheZctyIk8h6Ws9frq0ynvcj+FfRZju6
	 sAlRHjzX8+iUNDkGyl+LART3gX/a7EHxmSCcC0PiefySg7+rjFAMd8SvrgR56qgX5Qga+
	 gepAnfLHbxQNWYzHjVypLo1SXzZmng5UTXK7vj9LnujeQ/9Y9D1line7iCZ517h1vOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761606;
	bh=6ZYeAtQyZqXb4ylmESWoWzqd3iao0DrhWPj2Nko3M1E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FDSUZnM9wPnZNWRDv3ZMQ8k+tCeB6YE8O+mI6MJc63Hf8N+JKtteL5ggzRi9kGzGR
	 m8AJS901ghBlK5hqb7m1WP1Kd2VPh73lCxsVATO5r4kPXO59nfJs329bLZ/ocAwgC7
	 X5/GqytHCRq/BBVn9UIBwIwLbULiQxScyh+dBJeR2aXfDpBwSashQBNS5kzYz8Gtad
	 qhEIJc6tvc+eflUIthlviW0GhlFJG1Ti2pvVz0jJ51pYE+uuHhSCeIdXiSfdSWNr4p
	 vkM8lmEEoYvwae2Nd6QyzmUY2Ad7PJoN4Iqba0aocig+T9zCCCChU89Jla9MBA2JId
	 kW2WV7N29yWsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A2EF6071F;
	Fri, 23 Oct 2026 13:20:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A3B2356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B5C44095A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3tECzkwcVEX for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E2D514094C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761601;
 b=NSUMbAK5sTLrxmqxDGWFh1VjYP9yU3U/2w60zmuviLdHspwOfpLiodUwpZwVUAfGIJcx
 lQAnj50/i47748gn1WhdedTVmG5hbk2oxliONEzzdTx2f/AcHQ99gvHIVKAcjog9IHXO6
 Lik9Skw8tMvBJPomq/otJnk1uxRS6eUoE1+s5jm9pW93r/PYkQO8/+SJE/+35JAcnnUFu
 DeW4ThpXrzryIxvm9Xh3TXi4mNF/XhYuQuz2cfaoWBpNUsGPHEHjaUztVLChtWLNxo3+y
 97J0RbwVjthxCPxZUDh6F/nJoz2mG4nHKwmpR9v7QUHH+BdvMnxBa+lP2Nfiuh8NulQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761601;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=w4G+q4n4Wne86q7ZyAcPNxKDE2U4f09Mi9QCAv9VvJk=;
 b=CpadlKBWJD/6V/6be623qw3B8j2MvgME912lIuFvbDmkILfTlPXq+CCXZISPJN3UCudD
 zB1hfsvnaX609dO2y6r3P2OP0I3Ok+nhDzRQs6pQMg8OKBWvEr7B2lUOkwWIRm8eoxenr
 eHBi6KXAaLGY5nnOgkicBH7/LX4VogISvesPDejC8osbv1BrCtILzHa9Rq9XRypWVIzqa
 pjmwtQL86U/goqbM5NwhUVw4LBPFGkwYc/cpPm6+sgPC74CQVCcObnhkTrWCaEGyOova2
 9dMt3JIt8RlbDyWM7siNL9klU3EvdS8rHSJIoh51lBBTaQKusZBiOfqMZEEppQndOjw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Izjol45i; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2D514094C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:00 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so609148f8f.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761598; x=1793366398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w4G+q4n4Wne86q7ZyAcPNxKDE2U4f09Mi9QCAv9VvJk=;
 b=U4DoOOuod1oNLv526d29jDbGpAAoPSkpQEhL82In/oUquG0Ws0zdJ7B/8jIWd820ii
 mZ6HsnmoiFRV02RkYJO3N4U+nbDi7NWEAdLQiosI+W3T3P2eFvHc9hW1d5Q/BDiYAJxc
 6jqM4wTOUOya5YLKNcrmXrdVa+k98dWPVCpar0gcvDDuvpuFmhyTH86uuMphS2StrCgC
 W+AvS09lleXXmY5KiGVMGtAPq1rAiJHRD838OEtm64+bxSao3QvQoBDQKnNOGwXfY1cT
 DG/DwNoVDRy21KjJ+/2thLKJy+d+b06gVxxuZWA8FMo4Jcx6ngCHK1W4DQurORF0Doy1
 FCBw==
X-Gm-Message-State: AFq9FYI0W7h32zdL9Eo3bYkLAKlOQi+o988qzLi72SENox0PKDza+HBT
 a+u52Lq/XtMXExTh5A077H09gEjNFYTNPxMlviNhngcEQ02kmP39QV3io8w6SIvebXR5DFPHRn/
 pDxZVJbo=
X-Gm-Gg: AYBFou3SUGxgL4AVYnv0HexSvflm1GEiqARbh0zM7Lyl8lfzkId0Ik32F6VElqiKbBj
 FMmJYmmzD52hH63xav3lYeE+cMdlFTDhX7fPQ4wpqXHNzMsALMKwM3giqQgUuNhZCJ8JIKU9poc
 OAXzxuUEcQIQ6Qb1TFU6h1ge+NX+HistlSFhbVfWwoLzOZuy1VXK2g1AJc55DuWhSMFqyy8hH40
 AO4VF3NKcSyYH/+jYQ2wEdHObdX354YvMYHQbCMLtgVCPTum2XTtPg8gCa2KdNqu11ZPpgjhgnn
 EIMz42rD5Mdhxb8JfQvNpp4tkKZ344rmj/es90A88NB/abwGEKIuzgJveUTtpNtDIcNmkm2EKQm
 JVJ0YsMLSEo5iE6MBb9Kx3H0f5YS/eBtgtVAYyw2dauVdvKt3evp0eTAGn9LcRJeGiOjOv8O9wv
 Bk1ds3mD1mp996M8sM7RXw75ZZnAk5t+0WfYXSG/miWA1xXbAs+yUsQP3/H6o7aXBKWIXqBhLUu
 7Fg435RophDl8Yr4egtAQNMEYST7RjnRxoRElNRIs/xKN7SoCSO8+z2iw==
X-Received: by 2002:a05:6000:1185:b0:48e:2bdc:5e5e with SMTP id
 ffacd0b85a97d-48e38599244mr2967579f8f.29.1792761598562; 
 Fri, 23 Oct 2026 06:19:58 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e37edd26dsm5804090f8f.2.2026.10.23.06.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:19:58 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Seiderer <ps.report@gmx.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:55 +0200
Message-ID: <20261023131957.1606532-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014153526.1672168-1-ps.report@gmx.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/libcurl: security bump version
 to 8.23.0
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
> - bump to version 8.23.0 (for details see [1], [2])
> - drop '--enable-smb'/'--disable-smb' as smb support is gone (see [1])
> 
> [1] https://curl.se/changes.html
> [2] https://daniel.haxx.se/blog/2026/10/14/curl-8-23-0/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/libcurl/libcurl.hash | 6 +++---
>  package/libcurl/libcurl.mk   | 4 +---
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 0a7b9e0169..086f3d8978 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,7 +1,7 @@
> -# From https://github.com/curl/curl/releases/tag/curl-8_22_0
> +# From https://github.com/curl/curl/releases/tag/curl-8_23_0
>  # after checking pgp signature:
> -# https://curl.se/download/curl-8.22.0.tar.xz.asc
> +# https://curl.se/download/curl-8.23.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7  curl-8.22.0.tar.xz
> +sha256  8dadd7d2536a314f982ad05a651b713f426bf7d02cc2c76cffb9796f2218e6c5  curl-8.23.0.tar.xz
>  # Locally computed
>  sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index c3590a8a9e..00f718fbec 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.22.0
> +LIBCURL_VERSION = 8.23.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> @@ -161,7 +161,6 @@ LIBCURL_CONF_OPTS += \
>  	--enable-imap \
>  	--enable-pop3 \
>  	--enable-rtsp \
> -	--enable-smb \
>  	--enable-smtp \
>  	--enable-telnet \
>  	--enable-tftp
> @@ -172,7 +171,6 @@ LIBCURL_CONF_OPTS += \
>  	--disable-imap \
>  	--disable-pop3 \
>  	--disable-rtsp \
> -	--disable-smb \
>  	--disable-smtp \
>  	--disable-telnet \
>  	--disable-tftp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
