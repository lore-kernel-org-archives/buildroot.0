Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993C606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=apxGeGzj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rkzTTj1k
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3E3811AB;
	Thu, 22 Oct 2026 07:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfSeZYPRuO2u; Thu, 22 Oct 2026 07:06:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C510F811B1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792652809;
	b=SzaUEMTxACFp/+GihToG97mkkwr8rvYyPUM12D4KvjKg/TSDv7ibLjEexbVUGK/CZWm5
	 Z7t+wwxmkaNCTAnmvLj0WpqoSFZ6ZIMW4t9qRTtuXGqnlOPFF0Uq7utJgFz+dXnpy5Vh+
	 8A3YMgwvKlCydXDwQuFsXdS4OyTdE2x1GBs9to359OgPrjBRdiavWFqFbA4peth+VM2Tk
	 FI0BVrTFeQO6wlYY1uqOv2ci1v9mV6CTB+dAi0jMBw+tSBMD5Y4MnjUdO/gjcNPBuqxbl
	 AxPpe16muC9NrmVv8Rneb5eFyiugXcJsVNort0qQqcoXvbD+QTHL8nstkJA+aFLojMA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792652809;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=N7vS7XcH+7k2xM/89sjk37OJi29nyhY9wIr9Awvw8zw=;
	b=bCxT8k9u3FKvzerWE6I9IJcT0OPmc5eYNH/OSXKlSJuK5BIJplj2WWDniJfTHCniVsZu
	 SBU4zleeWqcLRh/epXLanezAo3/WT48bsyaGtQERMESXh8Uu2WYwPEIdqKyLjBabvG8pC
	 aou+DPMb/Sb8uTLwLRGPDQqWO0SAIz0poefOrq19tzp9o4N3v8eJ9LZkvs3uodEw3hqw0
	 dw9sDLFfTqrCBnZ0tuATJiPVEwQKCBeV1U7USW08JHQ0UJPXe3ko0zgHyz0wN2cazotd/
	 6cxzXFWYSd5PyHPPCHVOXlnlPxxlXPmJ4xUXsuc5HHCIP0Bbas6f3xp2PmlF6wTpQ9Q==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rkzTTj1k;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792652809;
	bh=N7vS7XcH+7k2xM/89sjk37OJi29nyhY9wIr9Awvw8zw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=apxGeGzjIlL3qU1Vb9SWDLwJ44rdIhOwrnnDRwKjHaR8BuocHVf1HLYciMo+u3Egc
	 pYDndU5pwUv8mTOYuWFAP5SnqoBXd7ElKX5awkePbFVDqAOPq961r0DssBSXQsG4BQ
	 Rj8UUo+RheCcAKgU9KnvNfL4YULkkM7iM8ZCpa1+b9+xTMiN2PLbGIsThysOYkwYV4
	 1biiuz7f05wSP/UNsScy4dZruEkCUugtJ3ad1Chjspd/RxEKplVg48PpwSdwWG6ojd
	 T9k4bX6HH50exGWlrjIyXN09iXdps5PtXeXgzc6zUMSCwOvxPi1tLWbONZJqmnIng/
	 Cv3pCMET8/DGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C510F811B1;
	Thu, 22 Oct 2026 07:06:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E633E3C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC4A4811B1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NwraV1bgh8a2 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 07:06:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA51A811AB
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792652808;
 b=S2u3mgXbIjWeLqhUdhC5jAM9Dj2SiadC0CO6BaWiSwARhVNSgcGu4JDaXiUlJKzSxods
 EuAOFr/D7O/b5uUyh0gnimAGgXvhyzVho3twFw/LkF1eNHw5ugLCbWsohwrlWsgfsbn9v
 uf2ZeGUZcufimA44WmrcLgbEQqWCDjld4A64el56K2Cpl24v4YRlM5KJOfJTNtxi/3OQN
 lj7hfJaQsUk0xmp352+Q3Vp0Q4+neD2I2zQT1uqbCxpcYNaVM9iCUJ0oo+wjqGtV0C8jO
 Ay8qAWyiiiFkx0syx3meQIpOm7jTii1M2f/NthCGjcNJmjSdFXRiUhvFb7KsFoNGWXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792652808;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=/FWWuvo2EjZ7AIX0c6nATfXrJ2INxe2X/wZH6zF0qsY=;
 b=axxYorkAbmnhYsWEXq5imiPh5j8amPejo+A2LD2WYPH33EdRBetPf2SmyV2a2RMBjEtZ
 QZPjJMYn0VHd8hEnxLjdGaGfS+e93OVFyzc0lhYE1y4sKWJswmBh01Omp0Ya6ZCA/UFFx
 2sFbNsOw55ovAxDiapDc9MEfR0JWxWlVKYlDt0FT1KAX5czuZ9C8FXgF+aI8WTAe09uSU
 Tp455StCi1D9Qlw3/VxlW/f3zSJOyWlmt4tv1Ic4IPzxCMX6hpyuTza4DFBbnWYi0JRJI
 R54avpbMCX0i4wEzxdjYGSmHhUh5GLAAZkeJq/w4ff/WDjCuvRJJsdtABz3IRPuvsxA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rkzTTj1k; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=aleksandr.o.makarov@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rkzTTj1k
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA51A811AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:06:47 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6b1afdf5196so632084eaf.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 00:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792652806; cv=none;
 d=google.com; s=arc-20260327;
 b=BfnVpXR0dmWNU/DilO/vM06AW/ncYEyWE5hJkO9cfzoV67slE9XmrIgkIX3fticdVf
 UbU1YuanPtFEa7qMqLDn97XM6SwP5/zUvMoY3dG2uc8T7jHryGUT6fc3F7CLZhfnWTO7
 n+0Za3t0MldEayOC2EAI7jdr8R2gw1ZpCWWLJfSyfO9PdlirYjiLGpijqTlY5tfUYX4A
 f+KkOgVEoEK/3N1YXyX6ork1b+z+LGw//ZLX5v89AiiuZcJ3Dsn8kU6v4PzdN/46pWdk
 tvCLANgAdYU3Pgds/1xZEWuiX5QI3TN4ipEihBNGvmVB26oQrnr6rOaZ3oSlY8kjNRjf
 Xr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/FWWuvo2EjZ7AIX0c6nATfXrJ2INxe2X/wZH6zF0qsY=;
 fh=XAxhLHwqiuWDE/k8wt0vIJjesGmW893py1GyeFkB/Ss=;
 b=Jx7FZWychSMZk8u+RoZYXoQiJTsyXw/WLZbPAjsIJ/Ib9NB/w64b2G00FrZG0D7SV+
 som3s1ZAeU2p7TxrhUOgUHwhZhUGS5cgsR+U3YVKnSURemW0h9n0VE/tpHnQqRtaBHq+
 HjoqkK8W2SaDJhKno9+3hZYYON9m+JFcxY84Ncns6xswlZvXTq7RuwiCK6zn1R4gEdu+
 Y8M1zC+VXu54ilpsV0ioSxOExpjbhuNsqTwMeJ4QupVR0NfOI+0nnsSqon0LUohvYYkr
 evRd34xXlVZYuvXsZpqFXgrI0FGE+3hbNRXVX+RMiueEYbXMuLAdVwvfEu0jJz1Oqxkx
 VV2A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792652806; x=1793257606; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/FWWuvo2EjZ7AIX0c6nATfXrJ2INxe2X/wZH6zF0qsY=;
 b=rkzTTj1kGd9U0xoyfXLqSc7ZUl3jSzIFTJuQpNoE1aAs7ukGiopgy7i3wGuDIkHtKh
 Dr3f58xkeIkz/Qo9VCRJuHLn8j6wEiUVEclLIOYN3xlw6g8Z5eaoffm1YG4AY91hYX4D
 LnGJlcf4+Xt3hFfvF2Dw5hmrhIM5YOePoPjcqCp/n9KTWGEGfJn/bB340efktjVtVJLH
 IjeA/D3s1DgH6myLkY7+Pd5iGG7OZg284obqtn0UiObtoai5Fdi/8iHA2tQVPzZUo/94
 AllGihPyRt9LUPZBg4IufkPrteWLVC2GNhJ+lBCDIHtyrAc3MJJaF2AMFbM/ofiVFjG5
 Vvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792652806; x=1793257606;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/FWWuvo2EjZ7AIX0c6nATfXrJ2INxe2X/wZH6zF0qsY=;
 b=FtDOuwfopwlYJ0/13NF9wjWyzPlzEyfT/Dav41U4MYotbKytq4GisYKI5QVagqxoQT
 DFMUx1PAzX2tMxEV6fU7LOrachbSBWCqvP8ZBqunYcgkIy+z+V6buEDK4kcsW2CyHsP3
 H9WVWDB34Kn7YOdO9vYrRZaIv9f76/oNggWav/udM+UKX7YeCz3dUxl44JyE3Oe2GVYp
 ExD9686Ad+c+dZUtHnHS2+F0VFXYmFwzDj571UQltP8sbH+FxaPKqG1b/e2/4XWnG4no
 mOUecib/WpGiP50Qk/P8QmPOeQsA1FfHRH/nZtOoG4QibQZ8EfG9XhSKr6/ZFRWXcBZC
 5Njw==
X-Forwarded-Encrypted: i=1;
 AKwUvBydIpq7l5L6FINaHU0ZNXnfe18seTQVNkmSLWSbJ0o+OuK1hpachDx6AQqnWVgg0hs9MUmPUzvcpQA=@buildroot.org
X-Gm-Message-State: AFq9FYLAxR6G6P7cdqRoQEjSGyt4TYa/W09DVQJnWtZGcSu6Il4ZN3Yz
 6yqRFtoZV+tZvyoIpvwtFvm5MeyZJaTXeRNF20GFOyJ4XWILVJ4456a63/H3uxzudaJY52dz6Jx
 tvztxR808O3DCvoZgppKiynnkyCe8vGZ7M8RQ
X-Gm-Gg: AYBFou39QfCgfvtFtiKJ1rpVZjeOd7baxqXAyLjaQfUasH8DVgz6UF/1UiBambHjiUB
 L9Sm3wi94FRZir+S8g2p93tJqqZwXqLzmDP9woUAJ4sfCFiP/CqmHxundVOzPH6p2CDtxGJDKrW
 h1BDQAAGXB8YbmYih0kbqh5oOsRSlAvdPSkFuKhnSzrpugyW/rjdkYBJlqY37NRNbuINKz/zVUj
 zBJRbZBZ1RoWxrC0oSQkI5XLm2FxDmShZoWCOi3TpQn2bgAoHTDyK/tLDMeR2N79/dhzSx6uwIN
 JkZky9ph/KuQCD7w4ZnRI4DVFGiQXIK0thr3AcQpPQ8oRaFL9UPFU8yn9ReNlOgmrr1wrALi019
 aIuYIby9OAntijm04z4cLnwYgMqyQcew9tiUigQ==
X-Received: by 2002:a05:6808:14cf:b0:4c3:db9b:3ead with SMTP id
 5614622812f47-5534f0450b5mr2992236b6e.3.1792652806379; Thu, 22 Oct 2026
 00:06:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-3-j@j-ernberg.se>
 <atkstjA4-icjE-BI@windsurf>
In-Reply-To: <atkstjA4-icjE-BI@windsurf>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCc0LDQutCw0YDQvtCy?=
 <aleksandr.o.makarov@gmail.com>
Date: Thu, 22 Oct 2026 10:06:35 +0300
X-Gm-Features: AclHuK_xgX9Ezp2adz09LfI76tKBd9SISLeQSp-WnjQux_k_9Sl4H82faM0UgKk
Message-ID: <CA+tfhucpM468eDtqH3pDG7WZkfDJQXcy64ZNQkOumgS6GTkSbg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org, 
 John Ernberg <john.ernberg@actia.se>
Subject: Re: [Buildroot] [PATCH v2 2/8] package/libest: Drop java support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0796975760099672474=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0796975760099672474==
Content-Type: multipart/alternative; boundary="000000000000bae290065e6881bd"

--000000000000bae290065e6881bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I worked on libest while I was at the company, but I=E2=80=99m no longer th=
ere, so
I can=E2=80=99t say whether they still use it. I=E2=80=99m not personally u=
sing it anymore.



=D1=87=D1=82, 22 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3., 00:21 Thomas Pet=
azzoni <thomas.petazzoni@bootlin.com>:

> On Sun, Jun 14, 2026 at 05:53:22PM +0200, John Ernberg wrote:
> > The package doesn't compile when Java is enabled.
> >
> > It has been broken since commit 3c66f65a6a54 ("package/libopenssl: bump
> > version to 3.0.9") from 2023, and was left unfixed by commit 8dc7445056=
d1
> > ("package/libest: Add support for openssl v3") from 2024, which added a
> > patch to support OpenSSL 3.0+ with libest.
> >
> > No one has complained yet, so remove the support as it's clearly unused=
.
> >
> > Note that upstream has not made a single commit, nor responded to ticke=
ts
> > or reviewed pull requests since 2022. [1]
> >
> > Link: https://github.com/cisco/libest [1]
> > Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> > Signed-off-by: John Ernberg <j@j-ernberg.se>
>
> This issue has been fixed since then by commit
> 7e34cd7c7e5094f99ee26b24493a9007b646c3f9.
>
> That being said, I personally don't really care about
> libest. Aleksandr, are you still using libest?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000bae290065e6881bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I worked on libest while I was at the company, but I=
=E2=80=99m no longer there, so I can=E2=80=99t say whether they still use i=
t. I=E2=80=99m not personally using it anymore.<div dir=3D"auto"><br></div>=
<br><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">=D1=87=D1=82, 22 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=
=B3., 00:21 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On Sun, Jun 14, 2026 at 05:53:22PM +0200, John Ernberg wrote:<br>
&gt; The package doesn&#39;t compile when Java is enabled.<br>
&gt; <br>
&gt; It has been broken since commit 3c66f65a6a54 (&quot;package/libopenssl=
: bump<br>
&gt; version to 3.0.9&quot;) from 2023, and was left unfixed by commit 8dc7=
445056d1<br>
&gt; (&quot;package/libest: Add support for openssl v3&quot;) from 2024, wh=
ich added a<br>
&gt; patch to support OpenSSL 3.0+ with libest.<br>
&gt; <br>
&gt; No one has complained yet, so remove the support as it&#39;s clearly u=
nused.<br>
&gt; <br>
&gt; Note that upstream has not made a single commit, nor responded to tick=
ets<br>
&gt; or reviewed pull requests since 2022. [1]<br>
&gt; <br>
&gt; Link: <a href=3D"https://github.com/cisco/libest" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://github.com/cisco/libest</a> [1]<br>
&gt; Cc: Aleksandr Makarov &lt;<a href=3D"mailto:aleksandr.o.makarov@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">aleksandr.o.makarov@gmail.com</a>=
&gt;<br>
&gt; Signed-off-by: John Ernberg &lt;<a href=3D"mailto:j@j-ernberg.se" targ=
et=3D"_blank" rel=3D"noreferrer">j@j-ernberg.se</a>&gt;<br>
<br>
This issue has been fixed since then by commit<br>
7e34cd7c7e5094f99ee26b24493a9007b646c3f9.<br>
<br>
That being said, I personally don&#39;t really care about<br>
libest. Aleksandr, are you still using libest?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--000000000000bae290065e6881bd--

--===============0796975760099672474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0796975760099672474==--
