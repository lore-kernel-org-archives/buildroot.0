Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A068606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 18:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e8Wk8xgY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hnq//p87
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5150C6071C;
	Tue, 20 Oct 2026 18:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEfFiZtyaTWc; Tue, 20 Oct 2026 18:26:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4D3BE60773
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792520778;
	b=fPTxKa56P48i8UG47/BgknIRbQdM1FyLVSNqNhr7YwD868IAddlr54UlbDXBCthLayct
	 65MfPkBokgx61GQOYxnSJrj6/uNrBK+GqBdT70+02KAngQW57UyWPWoHqBqf622j3ipLX
	 1/nAeVlnQ39rFcGJB1rxI/nFYmtrSAEBPodBsAfiLDPxqowZAA9LjGtyuCXjIz9LlYOq3
	 QvlMRPwKD2fRGPLqSqD0HenmX1eI7aVW/E0Q0VzpRg9HgXUsAgtk9D/f+vM0YtrL3VH43
	 Ld31BRXIlRbP5pdoX0MzHbak1tvUreJR+2uB6G4xaUjjMP+9aIAifi5UHzImZSg3Rcw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792520778;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=Cne49m4lrHjOg+xCnWrp1xlt4Hnmb0eHCpXNJJYCdoQ=;
	b=HZIBI+SGO9j0Hhzsa0PFBXmprHKs9rlSueNgAbWDjs3ecqPjr7q81FZDWxb8KJ+NALwS
	 wh7VNtzkWxJLDnQ6j8uvKFZnND2iaQNzk8Obs4MauNpnZ1t50ye0wi26DWy9E3gIQnA7J
	 5vHEsSoLkXorlrSRzhG+kzaTRSNaeM4FagwH5iWbAgPaWWHuUgVCwCLNNlg6h2O3M6zWb
	 UmYNlZkMlrZH08a+zGwh6miURdgc+Y+HD9igiIKpi4K9VSZhkxfBpArxSU5POal1ZtQd1
	 4mJWqdD8xFsKIgAVa65GY8ZeV2A+b2RLqudzLOtUnO3/XOPg+itRhFPLutR/kDVGmXQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792520778;
	bh=Cne49m4lrHjOg+xCnWrp1xlt4Hnmb0eHCpXNJJYCdoQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8Wk8xgYTjUfcJek/P09rVAU+LNRdsWk4I2g5F/bxcIYFKJCvs4MW+FbEze1s92uZ
	 rxYRuIEoLgbqoZdcSKB8i+EZzJbjXEC7Al/hx+J2gkX7aX73rsZXYCxhmDw5sLdXF4
	 aCJKgrk40crUSB5EZ+3OMXzd+yHr0pmWyHLSFHXpvH7ftJfEODOwBhjjYzTMYDF+1P
	 E4cHUhbFgmXqV7C0i2aOLpDYWLxnIyhwCBiMz3H3rRw1y4BCWNHNlEtEpcrQDgr2Go
	 yWJRBkKh+QvoxAC7Rnbw1a4LUep9J5T9D9SqdssGiVCbQw14xZ48jbo9zW8wWXaj3J
	 K6ZzgOVLlmFEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3BE60773;
	Tue, 20 Oct 2026 18:26:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A59B51E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C3F3401BB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uadETepb_eFj for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 18:26:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 658A84016F
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::92a"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792520775;
 b=LEPtCyPPQ39aPSlo0wYt8OOIS4ssKpPnxOhnemkF+SRC8B7h2kBbg1W9y5kZs7frc/mN
 HeAtMH4vrWwqQPFRO0+VcBRaoVxJVNbrJgw/+wG/Tlk/qUOCV5vnZdXGa0umh2HHyVEpC
 vW90kCLNSfF8NMxHs9D8jIWimShfP8LPc/oLeyDjkQAf0re+2Dm9RHm7l4lfi9hnBKsH3
 VyPUgtfUvaHQ4NBRswclNcPAKFnNOEd4QAk/0Gjej/IStckPRQ+/rYG2xljfW89ovmW8R
 GXsVbkMrNddm4Tl6w01K8D6oeEyEOIgKusfTXGf8JViIHb9WxNstN2rwOr8N901bqYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792520775;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=RIXBWs9s0AgMNXd5sSIiSO6Kx/BK6gs72KL8qzSle2s=;
 b=lzIkbc1XHAi3lHzC7m4HZFjdC1wYDLPO6lZwDB0+N/JBMr3ZyaGtHVIwhRD2hPD4MYck
 l2HLK/0amT3ubOcZrnDy11yi9U7hnsJWEJX6OPTZdHM+ZNSa/dijWvXxYSskRuJqwM5iA
 Rt5zaDqSj0YdLQkWTQX20AbGEtHNyVHda38x+MfEM5KsoHSPjK2E0V5S2Rmv10iROpe0G
 FI94vuejPavZMp4+j0OcgbEiB4p8VmI4OsgZNX/oRyCpXLn4wBSmd1QiTHpXpEQ/X83PL
 JbhE+7cSGzQ9czXEouuX6kBIIn4SCVdaXtjvGJs7/lh4dtKl5oYP57dloOuqx05PIYQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Hnq//p87"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::92a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Hnq//p87
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 658A84016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:26:15 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-97ca72f2cd9so2426601241.2
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 11:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520774; cv=none;
 d=google.com; s=arc-20260327;
 b=N2zWvm+7yfVXxhWsTl4eTx9wUKhhdhcP4zGYd3KHldi1qTG+MrRJeXEDg4o+c+Pkji
 azFeWOmOY+TyRUqfnM44IKkbs+3JFI/ubrWap3ZkSFiwrS2bw/jSkSMEYmyZUW2ULBWi
 3qvW554LaT39c7dcmNBnqdivqcM3XYfFMnHvEYq48OEygMcJZdi3/oDs1pfqLsRzfHdM
 hke4+pIXOCiXrCNl/RzqyniWfgwTRm+rjSZMX+Z3RdRbF2oFaoGm9+zof7colO/ANO6u
 Y2tMtArXzqQcedsHjMtPYF0BulmW6aT3d0Ng5MOwD+0TmHMpwJ+W+HkwsG1fa3M5BvYO
 0kRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=RIXBWs9s0AgMNXd5sSIiSO6Kx/BK6gs72KL8qzSle2s=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=JUWIWbmr9ZJXyE2jzMG2c0xCf5RIFfo9cUA6eoLBm7ToMbA4SrWRAG/vA8P6pWQI5P
 yxB5soXqwWYqsl+v0dvMylv4GtdGQX5j1KfpRUceIq2M/Sa853qvBw9jR39ViZBb9hjO
 3A4Ydqw7BAdQ6WTaGFuJCj7P7lo+G4r/0wPO1A3rdRVww6BTZi/ePMM9C6aSPqqzUSpf
 wYCWHE/2F4mmdt0xiFq1i8y4+sHI5msPRZ8MQZkeaVOk0Ieiw0FHffRtHo8+au2oKjJy
 nq130wPN7g3reUeJxznvFYd51MgyWToBTRX0ub2wV6XyiyWj0dnTd9dUlt8k24ucupFo
 D26w==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792520774; x=1793125574; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=RIXBWs9s0AgMNXd5sSIiSO6Kx/BK6gs72KL8qzSle2s=;
 b=Hnq//p873Vmawru4UgNfHKypE73/SZDTRgAGeJe86VKIXXlkhLtLZL1OJzzbEPXKgV
 rEWfrehkQzGDWJtByr6aIp9kMswVoyguf8En4ZXwZ0T2BaSb5MGIZFZRRrt2ozOxWYiH
 FEcgwGu7cIsQrJaxK35ZCTu+JYQhjPoahanCURJCzu9Ob/Lz8FpmhVjMpGbAN/zo6s5+
 J4wHGA8YnA/13hZt5qYrdcj0l3lKbt88En20rZgGLGyOYsNeRIGXxOqir+u4kWA1e4qu
 TQ8AkVER+fDL2RDTKeWJ7izvg45ZdD3pAsjA3LT+LyvJRrCVxmGLzPo4pVdAvqVQEjED
 N1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792520774; x=1793125574;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=RIXBWs9s0AgMNXd5sSIiSO6Kx/BK6gs72KL8qzSle2s=;
 b=rd+aU7xmof0uoz5YCSSNGuOWr5Tzl4OBi4sleU5fDqgxMTJ28/cvSpR558hCRFrrjx
 vI7SoqX9JtrnHCftblIIpc8XibbO61SyBDmiOiqMVSFq2uJcAGYo4eLfbv1uAprDtEun
 9VMQAR8NFN6KOTneH9LKXT5fUuWmbmjTVjiJio9ngMfCln3pndbvMpqulsukWlZ9GtTa
 eTyUOSBwzMPYjkmA8dR/HRvrcWZGiiykDNjzRwetTC/3zTqcAR1W0mmsPtUDAR/6n5v7
 KvjBaYaF/Ks2t7Ly7gO4kB6JXjPSPh7LYjwrLr0VVRGKLQWwIiSvkh92tkFK05rKR8ef
 p1FA==
X-Gm-Message-State: AFq9FYL17kpsGF2kDi/7gCzl/Aw+pqO8nTvox8jUVMv4BAhGHSyg0FLz
 9a3p7IgSKzdxDAgs0YAR0fzXKrTvzA6B4TZt3wZz9SaUGQUbK6adR5y4LgwJwXtnrYP9BbIeCFr
 zUzI63Yma7nvDuE3HYoT5KVsp+fTt0bU=
X-Gm-Gg: AYBFou3q88q2H4r0R8dT6sWbJU5tGCk1yefcBTSjC8N37it2liIv9uP6dyJzL1DWeu4
 Blhn9jfxBcyoA+jLc+wHmPZrl/z6IBAQbK95NuraYJI8q6T4CtUEAxxMeTNR79zovkmGWjYa2VM
 +93YiSYncY9TV9Byns0CXu/7WeNOCSpkNItwnw+d04qrmRqMmJizLTQaSN8dg26Jm3uiQM0wxRx
 sRNJBEWzawJFO3ecDw7azrPa+oIZb7/RkEOiKmqkes4zsbUlE4eVH1Louuvr32fYyhdm/H0lbvr
 FaXqPbfk1bziM5lApgp1/lkJ8ZXxAOGUA5hP3IqcFxZNH/wjrVVnZ6B2q3s937icvZSJ1UGcnyc
 vYo1SjNQsC0CWwxhvnXjgJu2A/g==
X-Received: by 2002:a05:6102:3fa1:b0:7cc:9a7:7b83 with SMTP id
 ada2fe7eead31-7cc9269a508mr20750137.15.1792520773773; Tue, 20 Oct 2026
 11:26:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Tue, 20 Oct 2026 20:26:02 +0200
X-Gm-Features: AclHuK86A4sq5XtAa0n4gYBuX3lxIVvR7z87CzkLm79S82gTrdnaBI9Kpat_ujM
Message-ID: <CAMTop8-MOuiRhsTYN6JSx0e8Wkmed8W-fxBJH6=Ma7TriG9aAQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-hare: refactor build command
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3203702772457389235=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3203702772457389235==
Content-Type: multipart/alternative; boundary="000000000000f92def065e49c36d"

--000000000000f92def065e49c36d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Francois Perrad <francois.perrad.86@gmail.com>

Le mar. 20 oct. 2026 =C3=A0 14:07, Thomas Petazzoni <thomas.petazzoni@bootl=
in.com>
a =C3=A9crit :

> In order to avoid duplicating the build command, use an intermediate
> "target" shell variable to store the make target to be invoked for the
> build. This is in preparation to extending the build command.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-hare.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
> index 14e0cfce5a..15dc769311 100644
> --- a/package/pkg-hare.mk
> +++ b/package/pkg-hare.mk
> @@ -49,10 +49,9 @@ ifndef $(2)_BUILD_CMDS
>  # but in real world, the target "all" is not always the default one
>  define $(2)_BUILD_CMDS
>         if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
> -               $(MAKE) -C $$($(2)_SRCDIR) HARE=3D"$$(HARE_RUN_CMD)"
> HAREFLAGS=3D"$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" all; \
> -       else \
> -               $(MAKE) -C $$($(2)_SRCDIR) HARE=3D"$$(HARE_RUN_CMD)"
> HAREFLAGS=3D"$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)"; \
> -       fi
> +               target=3Dall ; \
> +       fi ; \
> +       $(MAKE) -C $$($(2)_SRCDIR) HARE=3D"$$(HARE_RUN_CMD)"
> HAREFLAGS=3D"$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
>  endef
>  endif
>
> --
> 2.56.0
>
>

--000000000000f92def065e49c36d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Acked-by:=C2=A0<span class=3D"gmail-gI"><span role=3D=
"button" aria-haspopup=3D"dialog" tabindex=3D"-1">Francois Perrad &lt;<a hr=
ef=3D"mailto:francois.perrad.86@gmail.com">francois.perrad.86@gmail.com</a>=
&gt;</span></span></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20 oct. 2026 =C3=A0=C2=
=A014:07, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.c=
om">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">In order to avoid duplicating =
the build command, use an intermediate<br>
&quot;target&quot; shell variable to store the make target to be invoked fo=
r the<br>
build. This is in preparation to extending the build command.<br>
<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0package/<a href=3D"http://pkg-hare.mk" rel=3D"noreferrer" target=3D"_=
blank">pkg-hare.mk</a> | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/package/<a href=3D"http://pkg-hare.mk" rel=3D"noreferrer" targ=
et=3D"_blank">pkg-hare.mk</a> b/package/<a href=3D"http://pkg-hare.mk" rel=
=3D"noreferrer" target=3D"_blank">pkg-hare.mk</a><br>
index 14e0cfce5a..15dc769311 100644<br>
--- a/package/<a href=3D"http://pkg-hare.mk" rel=3D"noreferrer" target=3D"_=
blank">pkg-hare.mk</a><br>
+++ b/package/<a href=3D"http://pkg-hare.mk" rel=3D"noreferrer" target=3D"_=
blank">pkg-hare.mk</a><br>
@@ -49,10 +49,9 @@ ifndef $(2)_BUILD_CMDS<br>
=C2=A0# but in real world, the target &quot;all&quot; is not always the def=
ault one<br>
=C2=A0define $(2)_BUILD_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep &quot;^all:&quot; $$($(2)_SRCDIR)Makefi=
le &gt; /dev/null; then \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C $$($(2)_=
SRCDIR) HARE=3D&quot;$$(HARE_RUN_CMD)&quot; HAREFLAGS=3D&quot;$$(HARE_ARCH_=
OPT) $$(HARE_LIBDIR_OPT)&quot; all; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C $$($(2)_=
SRCDIR) HARE=3D&quot;$$(HARE_RUN_CMD)&quot; HAREFLAGS=3D&quot;$$(HARE_ARCH_=
OPT) $$(HARE_LIBDIR_OPT)&quot;; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dall ; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi ; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C $$($(2)_SRCDIR) HARE=3D&quot;$$(HARE=
_RUN_CMD)&quot; HAREFLAGS=3D&quot;$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)&quo=
t; $${target}<br>
=C2=A0endef<br>
=C2=A0endif<br>
<br>
-- <br>
2.56.0<br>
<br>
</blockquote></div></div>

--000000000000f92def065e49c36d--

--===============3203702772457389235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3203702772457389235==--
