Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AEE606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qn9MGbDZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D9A406FA;
	Mon, 16 Nov 2026 15:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpmTXiKwfseM; Mon, 16 Nov 2026 15:39:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 63947407F3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843597;
	b=HkaPhuNnftxSPJZg7J7NssNNLpi4lxdo11hySqMYxVDmjOL6BIxgDpoZRgbiNdCzR4Mh
	 RxTqPRGKANceb4hjdY5JQVTcxWmGQZEIKHEMqpc9lGnxkjOx5ZxryAkW+rynthVFCBJVK
	 9LXTG4Aln8qMXVeaD/E/UMpEtPXRuZFuvCsMqTQ6R8LvZi0jpHLp9GWhRSQ3a0ribZS4F
	 G6QHWBVBpK5Hzqsk87MZLb81VDqHu52hICONP3za7l1/F8H49ow9eSUCfmBD4t2EtACLq
	 Eb8/niSCsM/nT1rLGHb+GZNesOoIwInxWOiz+cTGOc5Tt+aofDEmszAg+27hJT98tCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843597;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=89sDj054uw+YVnQwuNP4f4EUNsMHcoIyRB+0Nx7jJvY=;
	b=K8dXGRhu7RQVwQdVhFCMcsJpObPJU8CXiWNKCTyFP13K+6PmElqk66a/ZT+n3DA8yniP
	 wkH2map0lTvcrZfSxnPshf4IxVEmiw+61J1iL1dhp3A7KgGQR2idaBQwTWBA8byOpBkQ/
	 ewhSi0NVUt/XBgdfPX+GxnPQ00KJqqh4olxlTzokNBiXmOkL5knbFVFfFm7XtmSu/nEbq
	 wtHLvWfky3zfjXl2wnkNoOWi+T9MHe2S8GM/x3Avnq1XTr/26WFe6n5H39KCY/nTPBx2d
	 HmfuIcBEyojAYTyfq+xxU/6X4P3gWKuOZtvpqmh86B0GTxOa8+KTq/MeD/9isGDa/Qg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843597;
	bh=89sDj054uw+YVnQwuNP4f4EUNsMHcoIyRB+0Nx7jJvY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qn9MGbDZe7KKxlPyWKK1yCFWXv7F/JT5wrDeHq1LB6OZBM4yg45pumwN2n325nIfK
	 NoHCgbWGAuLkhiOCFyGzi3Ymlr4sst4CA2+JiipVfp3d3Y/v3K8pWGLh5T7BIdKSJm
	 oaj3/VOYE8huPB9UUeSSy8Hfud9w3FJbXEZmBGui5ZZAHpy8m39Mi5mdzk/rJ6EV+j
	 Qai2R2rTeHO+ByRgS1Q5qm616aPCsZ+6qI36O0bJ1KI1A6YDRVPwhZf1A5D5xpfCtP
	 7krO1yG5oR2lMj3nBGNodcCOWfX0QNtu2npJAqcyMV+Dhr2A8jnpQPDpk39zINQcYo
	 +WS2O/NZ0mvNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63947407F3;
	Mon, 16 Nov 2026 15:39:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C11F52FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2CD960793
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKrPGoi2mIaR for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 895C560831
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 895C560831
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4919a880834so1822458f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843592; x=1795448392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xoVx0OEZC+k2ztotSL29KM30OhG0zrNrViSBSN3Yw7I=;
 b=IFOh5DVMMmAaFhtTwaJo2eCnz3OQkQMa1l7ADmmD/QC6+2t5eJ7FPgrGzHx8BFick9
 i3ZNTiifp5frJV8VxXJg2+7thJ305nDUd03uS0HzgipCuU4xmR4UsRX3lFWy1tBZbdQL
 rNpZpYBd9EZvTZS3JKHRRGFlbN8JyghK9Ipe3P7ewblLkIz8obUVVumGdXIZfwEnYGO+
 LYzWcc6hGaJ0dQ6jD1sfLHJN9jv0XqhTLWPdlgUXoL+rrRE+qM2d1Ods+zfSBLMo6TNn
 lKQYRByKygVnbKFzpV2hKH9NplwYvtIOUlPSSFdDgW0umidGrDX1O//EaaYN7W/ciwa4
 7vug==
X-Gm-Message-State: APuU4Z80njSaNqsStkECEHPuX4fgThKnEm7Zg5vDlvaZ7o+9I2BsNLjr
 8iiiUOk9StTLlQR8NTDCyPnIbEUDSjG2NrsPt21t1O3tva6cGNlad4IKP+xynTZg7xnlAYjcmvh
 IE9t8UJQ=
X-Gm-Gg: AZFdTZfLr3LRqtH4Xpo4Ifsosfr3Lk1ufckd0EHIpne/SNnt4h34F63KsBCUqb4GpOE
 aAssZaXIWLiJs7KciCUhAEKwJ7I86ficmg/mScBEBzKhsFPF23gWY84BqQr56h+N6f4YVEbq6/D
 CbwOFRMeQ2Dc8V99vXnh7yQF/vXJnER49Ebz53ouj70I3L+/Wr/HSz5K8dfU2euaHqX29L/91ew
 SsKlrGbvXKCoIxVXND30LTVbNJ/xTyfUR4loP31+/RQy2vnV07HkEnzx+wKI64ldpypqnp1l+iz
 2lR8TMznWF/OSszPzRU4I8Ss+nRKf4dxiqYDj1RBBnwISdlbA07xjk549sLNPTYHF0txQjHz8Xl
 SWQ1bIcyFk4wWesNOkioqTTT+qyzd3EF04iQql3P0IsigoxeLimbv95GSxgC59uvQ0AbequSG34
 s8RjtrUqkjjvNBRNjPr6C2iDDJ8o8R9Dv4bjNf2351+3rE8PRKQPiCbgvYdAYYU1PKgKl65ZE4z
 o0eL/ZkKAqKMw/+Va+Hvb40LmM7p97Mx0yakYCGe29AG9wrW7i/qzLNdxFzlHUrxiZNSSFBE/uh
 olrVmiMn08A6kmdvA329dkN2dYl1KENkpWm85BTslSVHU2ZF54o4
X-Received: by 2002:a05:6000:2584:b0:49d:a36c:2d66 with SMTP id
 ffacd0b85a97d-49da38ab522mr18603183f8f.27.1794843592452; 
 Mon, 16 Nov 2026 07:39:52 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a32155283bsm506974f8f.37.2026.11.16.07.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:52 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:49 +0100
Message-ID: <20261116153951.725624-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103070457.5964-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libfribidi: security bump
 version to 1.0.18
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
> https://github.com/fribidi/fribidi/releases/tag/v1.0.18
> 
> This release contains "Security and robustness fixes".
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/b1f717f968aa2e503efbf3966c8ee1d9c258e50e
> 
> with the exception of an unrelated build error with ffmpeg:
> https://gitlab.com/bkuhls/buildroot/-/jobs/17679187034
> 
> which will be fixed by
> https://patchwork.buildroot.org/project/buildroot/patch/20261101191738.2091630-1-bernd@kuhls.net/
> 
>  package/libfribidi/libfribidi.hash | 4 ++--
>  package/libfribidi/libfribidi.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
> index 38acd814d0..cca8bb2da5 100644
> --- a/package/libfribidi/libfribidi.hash
> +++ b/package/libfribidi/libfribidi.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/fribidi/fribidi/releases/tag/v1.0.17
> -sha256  6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2  fribidi-1.0.17.tar.xz
> +# From https://github.com/fribidi/fribidi/releases/tag/v1.0.18
> +sha256  1de5e8073d035388b71d0b2d452b1da1f8caeea8a7702997b401fe1b6250727f  fribidi-1.0.18.tar.xz
>  # Locally computed
>  sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
> diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
> index 1a275c5fcf..7a64b2ffd7 100644
> --- a/package/libfribidi/libfribidi.mk
> +++ b/package/libfribidi/libfribidi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFRIBIDI_VERSION = 1.0.17
> +LIBFRIBIDI_VERSION = 1.0.18
>  LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
>  LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
>  LIBFRIBIDI_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
