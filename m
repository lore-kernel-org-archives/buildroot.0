Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A78C606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W6Xul7dM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lgx/BKGE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F3060679;
	Sat, 24 Oct 2026 10:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmnGnLt65QFG; Sat, 24 Oct 2026 10:20:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 30B1D60680
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792837242;
	b=Em1+CvJRXZ64GX1xaMPmlxi3PHxWvT2xhEUAaQzFSEfzvsTjp05z+6IYoH2OmwFqUy6p
	 AWxTmdtF9SkDS2fMw9gFG1/qhVzpLVu+uXgbhMUu1rDGm9iIGS2bvD0UMho5JKxdpvWEV
	 p+IVTpH6bgkFJxhbkTwSiMOWgyd6ALrQLx493Zt3YGkiQlUZ5JDXoZp9GhMAsPI6k7SHO
	 R+SceA/tJBto8kx8go124O5OkO/KsPOh7caQwg08+weiYSHHH6bE2Hx9iSmaSMvPwOn6u
	 4qayYfFJjvV1Jzf/wQkoRYQ8AJoSYXDYYU9GbZPD3VsDWcIq+S0WfdZTgTmftkextNw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792837242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=Qh0j4SJon2aJ9vJaDJjrOgoAF03mSDfNjKXleW7OOe8=;
	b=KLK2KT7xhTJP61HqQoAkq0+n27SbEmn8gcGp6Q0AMiqBZQp7Hmhp2ZYo1g+9BZX7GQ0F
	 qw3CAosNdcI6tC45NFxhVUi8hrJGGs8ojn0Zh5E1aggn3xBbm1NxysaaTwSEyAIAxnfUK
	 22X50laRwkprUpmVVa0So6U7tl73q4KTLwBLBjr9FVFp9s1Z3iWcT56t92pfkB5oueZOk
	 NZqQdFo1E9u7aG/F5vGpcsGcgYOanwbF+F54UtmXvme4npZocsSookeDhazDuqk7oyO9X
	 E8Me9pAPVDob5vy7glyuAMOuzk9DD/hvdKIqD3Uhn7aP1VX4APXOPUBppL/4qHkiIng==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792837242;
	bh=Qh0j4SJon2aJ9vJaDJjrOgoAF03mSDfNjKXleW7OOe8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6Xul7dMLRt/zeQNxCsxqZKayBeal7tKPPJuK+Ya3SUUdD4xClOQ/Jl2Ryn9TV37L
	 imDCkHho468qBe9+uTB4LkHnj+fwEEzrx1taD8sHAkfYpGP/Gyx5g/7UmPXmhQYIt4
	 ifZzpawqPS0p+K7Bsb/wVGWYVri03HZnmGr13yR6C3JkwOFHPXm9yrPpMvaIjf2GK4
	 3SbCx2yVWSd+9D4diT7xozoH/NWtGQeo3Jc882bIrL8b88kskJAAQ+7tqrM8O27Ila
	 9niZIl96U/P56MTfWMg62mBOoq8TwmyKv7DHQSMZYUJdSLEqXPEuPIOLEt3zz1WcF7
	 CuuQ0PE/8pKvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B1D60680;
	Sat, 24 Oct 2026 10:20:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CCBB356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5367B4009E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHRP5ykHnBjL for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3875D40068
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::a33"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792837240;
 b=SjESfUu6VQL2bn30PgOxOpzar+SCyKFFeAK3W4TQVL1Igum3KtjsgPOgBYK/qTjXddrf
 xMdvmexmhMp6PU2iwyViDxaiPEBMnmygKpHqVIvvM2F7bdwf53WdYcrvXzYpcYP12xwB6
 aTXJtFK8iMl97mQPIMLVLnRGWkIwprLrgKRWwafizaqX0JQEUBWP1TV+uVb1/v32WJ5wq
 nnIEhOzBerY/1NjmM94+ykwdx0UevDJijYnpv0mQE0s/IzwDJcQcqzVqCb2YD03OxHY7c
 zHHBh72EosMWmfjjB7ER5jYaria5+pwtHdrBg2zIA39mByd9lRK3iusqEArtde1C51w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792837240;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=WTFqNmd4tPch92EMyHyDrh71lYQSFQDGKC6eAhfNT5c=;
 b=fRRGLYXhMNYMpKWFfCTDQs83I4Io4gZBmJItNfhTtptxURLaUiUmlIK4AKLregSsv9rz
 4dlmfUMNvWx70MQUl1ly5WSmHDDcp5pfeteMbiStm5ccQ5q06+mFTfsvfcYEs3OoUBBoE
 KB6sD0egTbH+tfD5MEkfz3gndHk0ixdpNf09n+xNATYuD5cGzpbAL9vspKQkzc2AmObAE
 KbYWG+yL5uOAyGLHA73SKic7OXVXdItyXWsAyk7g2stOJgQLKEs+3pSy0FiBHvIwxRUY/
 v7z7B8ouCbgJMlPv24HIbdyqYFxdmO4fVPmVQKFczEYet06bVzYMiLfkiTwF26/wAzA==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="lgx/BKGE"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::a33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lgx/BKGE
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3875D40068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:20:39 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-5ead5ff47caso803610e0c.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 03:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792837238; cv=none;
 d=google.com; s=arc-20260327;
 b=EKlenvI9MAIT6+J0BhiNCHZSAmMeRWMF4o2iLzNsdnjpUAHv3Wo2b/7k3scqjH1fSK
 jd7fMxza5R+JRH814eEVyMQvAP6LRH+0vTlvuPeLJsmBQ6EQ1PtZywBKq7RxWZ2bv+Y7
 9s2DxG3gHLeA1vvAL+ypnliJ/FxgmDQTvW+mQxQyeI8Qq3gcCsaM9QR8QMDZTbtRSZhg
 EunPUsoYzn6Hl9//zdmQHjU+SRU3+SRFPuPgfOsX39KcFmNJmxJYMm1gTv9vg0ysrqqw
 NkgaVgWJpS+dR0Rbppgl2jNHRa7czz9n6smwh4wk06d++A9IA1i3FpPNZKuubjdkdRVG
 nNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WTFqNmd4tPch92EMyHyDrh71lYQSFQDGKC6eAhfNT5c=;
 fh=uNQaJjvtYez2Pf/8MdVG/BxjCe+pTpQsdq1aveHShLY=;
 b=ACJpYw7l6jZURvt5kf9ZtWgEdPQxPQfCa3GjlS/7+64IB7ODpQicOgL1QGf8I/t2gy
 BKskVcg1mqTPVDouRgtHz1hAal18fzN6tcYl9QtyI7IrmAM9QFJkfipribKnM2T2H5G8
 ctxaR339eM3vMnypanfi4n53Y+B3adTqV0IOMI3DJK0QGPjk+t+x1QytQALlUqsaWnhX
 PTrop25Ud5P9aNDKb1XRVg2Hk8V5XWjJOf3oFXPt3/tciGU3rQL/dfLVuafZjNRUSuuu
 X1tfjnjkBKSAmOr65ZMwsm1nDqipPhw4UN/ewmGoIya2hb+/McwnL4cNnbOGajInXUOB
 WLGA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792837238; x=1793442038; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=WTFqNmd4tPch92EMyHyDrh71lYQSFQDGKC6eAhfNT5c=;
 b=lgx/BKGEodnQQEARNJ1Nw1Ho+sHdgdZ231QgJSl+r4qFD+QojG12TtEAIdx0Zbkkhn
 DjjD1G3Cw5oTXOyLZSRDunfksIWZENHJfoCX/sWtaUfTtPkTmO0SIOVOcngUEtlA0otk
 /OYmJZBwrUSOoVs8jRsgVocZItpSOBmlZa30AUz+/cKtgmePUVG7kN9PGt/IH8TuCQnr
 /Y7LCLYjbnsZwHo2COgWPHWMPSfTbdZ4i6o2Ikh0UjqnRBKzgg0i9UsQ0hLzi8hAxw0j
 b0UV7T9ZGtdRAtaxOBbHojm1nCPIFAn/rlJTTlM0c7IuQYCXShZi2iUAwIZ44m6pbELm
 EBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792837238; x=1793442038;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WTFqNmd4tPch92EMyHyDrh71lYQSFQDGKC6eAhfNT5c=;
 b=IFO4fL2v4WiqUXYW+ywd7o0r+oWY+ztgCLtB+OZRPqJP4ks1hTru27YDxW021RR2+9
 4yW4219IzTXpsCLKxmHPG6291gBUL8XXKiRh7XkNsvKOXzymf8BqqWnpSb+MnDTtbLe3
 xYesBYIkEP6AyuBwDa5fzJqmpIsZZ91BZikgmkCBuriFXabguP/n/o34aew5WFcGHCLn
 N+E4Gz7SR3iiH+dr0njCUnSQGgny4ksGvWmFUT1SOJXwvp3wFnv3eNaJ1hP8p53QbVNX
 08uXyjUAEAye1TVOmUIOYiMWG55P3vu8069fVRceUMCuGGTU0Fa1rYxk91zDmtLsBfHq
 V6Ww==
X-Gm-Message-State: AFq9FYJZQhkx68o0fk73mcW7f9844Ot00993h1BsGqUzZlL/+ZIJ/fpY
 QcfVIxJS0o1Jcg7JnANWrd9iboMSUP3DV9UWmO6eOqifbjpv2gt+HyeT91QMqXVQmnYpY4BaxgY
 Gt16pkZr4EEyE7tMPfx4RO8B9SaJZXfQ=
X-Gm-Gg: AYBFou2/v7CyT1+FX52SxSzpdjSGvrKxb8n64NwraLU9JCmle5rFZS7ufSO8jftJB4d
 Ii1RTt/9YmjIh0imogkJru+RlSHv2i0FW7UmHkMfPSreZ2On+B+T7V8KBz22IbQzUlyzGYrYXwk
 t88riypSeGxudysp96mryJ+pg+uSGM3fWNE8wIALysz6sEkEdeLpAWxCo9MoA8ow6G985G7GTHn
 gmFwNIeQatwcMldvxG8cA6JFTvZxIXVyLyx49tyNP6rYkvT2ZpfNnyQucM7m32WBsWOcAXAR4z0
 wY3lcuw/yQVCktdJHCkxr5QZwTTGQLw46egDNWwdOr9qAKVxk6uk5x7im9RBR9hVtATExHrHUA9
 IRQpmSp5Ge1B9CqMyH++qz94CaReRZj3IVnXkl2wPuastirPKEVYfVdTU1Lf2NyAi633TRnQV1v
 tiAlbDlBhhtrqURnqGOg==
X-Received: by 2002:a05:6122:218e:b0:5ea:c36d:dc5c with SMTP id
 71dfb90a1353d-5ec232ee9damr424695e0c.20.1792837238409; Sat, 24 Oct 2026
 03:20:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-11-florian.fainelli@broadcom.com>
In-Reply-To: <20261023215138.2301146-11-florian.fainelli@broadcom.com>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Sat, 24 Oct 2026 12:20:26 +0200
X-Gm-Features: AclHuK-ywpDp3D5q7nD9mgUPZ_oR2gAOlP8jzByUqCGDZPm6Gy6w1-UY8nlWYxM
Message-ID: <CAMTop89wEH4R8Jvf2zQoDU1f-Mf-Sc_QGAobjM2gOOfbYTmDnA@mail.gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 17/23] package/perl: apply the perl-cross
 even for the host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6995781451147798359=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6995781451147798359==
Content-Type: multipart/alternative; boundary="000000000000bc4dbf065e937231"

--000000000000bc4dbf065e937231
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The recent commit "package/perl: apply perl-cross patch only on target
perl"
https://gitlab.com/buildroot.org/buildroot/-/commit/8dea6e7c089cb5d4fa7bd78=
8fc6e07c9f19f70a8
must be reverted.
It introduces a third hook PERL_POST_PATCH_HOOKS which becomes useless as
the host & target tree source are now the same.

Francois

Le ven. 23 oct. 2026 =C3=A0 23:52, Florian Fainelli <
florian.fainelli@broadcom.com> a =C3=A9crit :

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, ther host and target variants have diffeerent source tree,
> because the target variant extracts perl-cross, while the host variant
> does not.
>
> This goes against having a single source tree for both, to ease
> out-of-tree builds.
>
> However, extracting the perl-cross archive has no impact of the standard
> build; it only ever adds new files that are not used by the original,
> native-only buildsystem.
>
> So, we can extrat perl-cross for the host variant as well, by re-using
> the same hook. We also need to apply the config.{sub,guess} hook.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> (cherry picked from commit d2ad97e0eeff39fc89a58b589f19094824402756)
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  package/perl/perl.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 43820cfcc33a..e5d8689776f4 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -31,6 +31,7 @@ define PERL_CROSS_EXTRACT
>         mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.3
>  endef
>  PERL_POST_EXTRACT_HOOKS +=3D PERL_CROSS_EXTRACT
> +HOST_PERL_POST_EXTRACT_HOOKS +=3D PERL_CROSS_EXTRACT
>
>  # We need to patch perl-cross, but perl-cross is extracted over the
>  # target perl sources only (and not the host variant). So we apply the
> @@ -46,6 +47,7 @@ PERL_POST_PATCH_HOOKS +=3D PERL_CROSS_PATCH
>  # on newer host architectures, so we borrow the hook which updates them
> from the
>  # autotools infrastructure.
>  PERL_POST_PATCH_HOOKS +=3D UPDATE_CONFIG_HOOK
> +HOST_PERL_POST_PATCH_HOOKS +=3D UPDATE_CONFIG_HOOK
>
>  ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
>  PERL_DEPENDENCIES +=3D berkeleydb
> --
> 2.34.1
>
>

--000000000000bc4dbf065e937231
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The recent commit &quot;package/perl: apply perl-cros=
s patch only on target perl&quot; <a href=3D"https://gitlab.com/buildroot.o=
rg/buildroot/-/commit/8dea6e7c089cb5d4fa7bd788fc6e07c9f19f70a8">https://git=
lab.com/buildroot.org/buildroot/-/commit/8dea6e7c089cb5d4fa7bd788fc6e07c9f1=
9f70a8</a> must be reverted.</div><div>It introduces a third hook PERL_POST=
_PATCH_HOOKS which becomes useless as the host &amp; target tree source are=
 now the same.</div><div><br></div><div>Francois</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">Le=C2=A0ven. 23 oct. 2026 =C3=A0=C2=A023:52, Florian Fainelli &lt;<a href=
=3D"mailto:florian.fainelli@broadcom.com">florian.fainelli@broadcom.com</a>=
&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin=
.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
<br>
Currently, ther host and target variants have diffeerent source tree,<br>
because the target variant extracts perl-cross, while the host variant<br>
does not.<br>
<br>
This goes against having a single source tree for both, to ease<br>
out-of-tree builds.<br>
<br>
However, extracting the perl-cross archive has no impact of the standard<br=
>
build; it only ever adds new files that are not used by the original,<br>
native-only buildsystem.<br>
<br>
So, we can extrat perl-cross for the host variant as well, by re-using<br>
the same hook. We also need to apply the config.{sub,guess} hook.<br>
<br>
Signed-off-by: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin.1=
998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
Cc: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org" target=
=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
cc: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@free-electrons.=
com" target=3D"_blank">thomas.petazzoni@free-electrons.com</a>&gt;<br>
(cherry picked from commit d2ad97e0eeff39fc89a58b589f19094824402756)<br>
Signed-off-by: Florian Fainelli &lt;<a href=3D"mailto:florian.fainelli@broa=
dcom.com" target=3D"_blank">florian.fainelli@broadcom.com</a>&gt;<br>
---<br>
=C2=A0package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" target=3D"=
_blank">perl.mk</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" tar=
get=3D"_blank">perl.mk</a> b/package/perl/<a href=3D"http://perl.mk" rel=3D=
"noreferrer" target=3D"_blank">perl.mk</a><br>
index 43820cfcc33a..e5d8689776f4 100644<br>
--- a/package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" target=3D"=
_blank">perl.mk</a><br>
+++ b/package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" target=3D"=
_blank">perl.mk</a><br>
@@ -31,6 +31,7 @@ define PERL_CROSS_EXTRACT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs=
/perl5-5.42.3<br>
=C2=A0endef<br>
=C2=A0PERL_POST_EXTRACT_HOOKS +=3D PERL_CROSS_EXTRACT<br>
+HOST_PERL_POST_EXTRACT_HOOKS +=3D PERL_CROSS_EXTRACT<br>
<br>
=C2=A0# We need to patch perl-cross, but perl-cross is extracted over the<b=
r>
=C2=A0# target perl sources only (and not the host variant). So we apply th=
e<br>
@@ -46,6 +47,7 @@ PERL_POST_PATCH_HOOKS +=3D PERL_CROSS_PATCH<br>
=C2=A0# on newer host architectures, so we borrow the hook which updates th=
em from the<br>
=C2=A0# autotools infrastructure.<br>
=C2=A0PERL_POST_PATCH_HOOKS +=3D UPDATE_CONFIG_HOOK<br>
+HOST_PERL_POST_PATCH_HOOKS +=3D UPDATE_CONFIG_HOOK<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_BERKELEYDB),y)<br>
=C2=A0PERL_DEPENDENCIES +=3D berkeleydb<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000bc4dbf065e937231--

--===============6995781451147798359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6995781451147798359==--
