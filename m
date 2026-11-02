Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FD7606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VDJrFCSX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJXZZfZA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89745606FF;
	Mon,  2 Nov 2026 07:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYkSVngPRsP2; Mon,  2 Nov 2026 07:10:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 855C260687
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793603414;
	b=UDxG3nqSz54AYoQz4AZ/nHgRZfzMnMHgOgHeuVtdxpylNQuWrP8nCRxhd+N2RfofMo2F
	 wdxiF14GEuLrYKz326+KFYFjJZG5VuUIeC0SJ4qAyJU6hZmUPnwjzkmNczJdLr92cSxe+
	 ujUSPpxsLDhzYZQGYYmK4jnTlM/Jv5zvrjOsIWlhMMIKKx+dPOMLOotvVefV1zeb4QATt
	 jPvepoPKce/YGkqhY7TuWnLjS9B4HqvSUKxDuiN7LVF/lIYQqI6Gr0oLk/QgtbTFxMY8P
	 n4Qs8k1AUvTS+FFwUgG/6GiEfqBL7GvPRyhC+e7V3pTLa/tDuBtY3KNI8MU78ypYFjg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793603414;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=cb8j5h5+9M0N0NL+DfSvDQV2N4FnYKONN8I5hEgsjLk=;
	b=QcNGy/QL7Srm+28SEPy58xoet3shsxMnv3oGqkDrigfqmzoAmRe7KFBIPJutcOfqwZ3U
	 JJox4hJUaQXbu2s/LuLcNt7xLjeReQdAIHpp5gnPuTM1DxMf9FhOikSujLRaHVjPPJRK1
	 YE+A+AtZbIixZixfC4NFPCO/HEOE2i+LdDmcub8qjEPPHvs8IYko+gJTpDVu05SuZgNN9
	 pR76UOunobNOJOVYE3lojL4B5CvCTDKyOTivNAjH/3oB21ygeJnDs0N4i03Gn94XddvKK
	 SbE9MClkY3QaZVtQ851OVQccHAyide73japnwuEWPSI8zTruZfAKVSq5A2jSVzfET8w==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793603414;
	bh=cb8j5h5+9M0N0NL+DfSvDQV2N4FnYKONN8I5hEgsjLk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDJrFCSX5KQsuE6/NzsSomsQVxkpg9XbAAKmB3N9qBE0STqlPFBgGKTsPBgLaVe34
	 HhpWr8c0zv8TiMv3ZqqkFLZW2oSFfim2ExOSsemjZ6L02/03Zf3hEd7Fbh1aQQy45w
	 JM5vuPaeeqKAYeiVZ9rB1K4B+/hK5uswKZlZfXOAjm6W6BCJBFl7xTQXoSecX9ug8/
	 5M3RrEYfiuai4m/i9SibhzwCw20oGp4YzoIZW+n4SgBkA+qHKNrB26c7VoQJzgGsUu
	 5XzW5TwFmkxj+oz02HHqmNk6fVdy4YqdReEmWV5USR/HDzAdfeSO0uMoTJ2Zme1Vpt
	 769d25ajEal3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 855C260687;
	Mon,  2 Nov 2026 07:10:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7913D435
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 07:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ED0880E1E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 07:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YU5k-R4G0m6E for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 07:10:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 542438079E
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793603412;
 b=XZFHEFMUseVuen0T3EnsjdV5Y084BTL1KBDbC5/vit4J1ZR59GbpvwJNMHdBe78TRYVb
 HraYtkzTje9cMOvn0PcARDBd3L5xhmgabFsbarXBPi4R+DquR4a7ghQW8QIqvCQ0jGnn0
 UMz/SwVMvqMxwcQcxlW1JJ10P5OYJipRNLOOluRgMdKGF6Q95K5l5GEL/ulXcAueNFnRT
 RsVDIx0S5TLbAgmjxADj60a8nW2H4G1YcdrnGKlwtvQ3gjPlUfQJIZlOD6quFpVLc7r45
 53lywKuXPEabXQ8m3cawn2XCbs5BStMFAzMnv4gu3QUXwzjIqWHN/e/xL91CGqpQ4HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793603412;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=D32zmna3b36JOpXRgtREuQ9X398xiMYDyOb9kCyi/xw=;
 b=Sc8Fde7lf7K0h/kAFYP7S1DfEBOmO2UlRf9AlpUHgSRKLBfOHV/1069PrPmB6yOdKDPe
 9oL7LHW7QlEteuWibwwe009zpoZ8RiClgkEQ/TldDFxJ2DJMaeK/a9xDhKXOv6+Mi9gpi
 OkFhWWAW3izjxbxSyL1/3B0ZuH8xzE5HObXd/I8R+wilGD9CThlN9HpbrAhJ7+BgIA6ow
 Vc/j1Zj6x5RWwmsxMsQeJPfb9rQ1gg+46l0h19B2sBN2UY3gRw6CyTH7Gic3FLYEhnGvD
 LK4AE++ouMTQQHNII8vOFSVTb8GECpnUeSDtR8Uelca59+VwCBuP2sIkMLAugpAetfg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=AJXZZfZA; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=AJXZZfZA
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 542438079E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 07:10:09 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-8490a7d6696so1735582a34.3
 for <buildroot@buildroot.org>; Sun, 01 Nov 2026 23:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793603409; cv=none;
 d=google.com; s=arc-20260327;
 b=Y7Hwo6+3wssKyU8482BDzYA+RHeuHEmp25kYP7zJk3ii3bFBE9+OGYoS8HTTRAL1Et
 4LyyOPUB7HTLfjMpXGyk3lfuuSZHMskfL2tvC4PnhrSdJT6WOU42qHC9cQDey+R4Y0d7
 cd2TLv0grMsicQOeBFWZf/mxDk0+ZZXXK52we4o3QHYpFt4yKpOmH5Zjp+bMz+XtVS5r
 Zfip42HAqg+oBOSGIe7CnE91znFHXKJEpmPb9E0vzb1D5L3sydRs5+zY+XXUayVgV4i1
 8LC0GpOesiE7msmqCl6M9ifqPkYjaonnQRwFK6mJsJC4/zC6pl9C7P+aqV3Tbu80QQdX
 QI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=D32zmna3b36JOpXRgtREuQ9X398xiMYDyOb9kCyi/xw=;
 fh=DU6mN36uXLYENFTyIy5Y2vThwZtyfKZCBSyZmbxxPNs=;
 b=gTXAy7kTvnL3xVLXmR7C5pDEDrxITJ87lMLt4e224CzUrWsOpYeB8DXGXyMr7wjt50
 tksdifuf2vgjlWSvMACHgBNqwzB8sCtlJKh+eh3avoN4blEwaJVytN7BtVXHtLVlaVSb
 Y0F6gb564AHSyNMIVpofu+GCoKdfap9rYyl7gQA3LnUhIpopYKcSsGVB1WtEqyLPXwJD
 lGFup1n3II63HsoRq//MSjVrY+x9DhpPXXYK1PKMPV6PvMnMYcRsCWlal51SRzWdONgE
 4EY0sJw4B4/QjCNiRxQ+X0GOo5K6KTC/Qxaq6ZVr8A+dy3NfUDhCEwykccs3KPmndwXh
 OwDA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793603409; x=1794208209; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=D32zmna3b36JOpXRgtREuQ9X398xiMYDyOb9kCyi/xw=;
 b=AJXZZfZAyrzNBJlV6ERUqF6y/zMwazLJo7tUfcs5DxUHQ80Hnz35uoJ/TFD7aQ/Jj7
 FqnumF74qsXxfla2Bf4lH66emaj9/Oygc9i153jvBh4yj7SsMbCa1PYGv0NfJ25axRGb
 tS9lzNDNw5JYy+CamBxcZ1pkRONqLhZ26P3BCCgo3HuSijntjW5s/044Ujgv58FL/90G
 xgjE/A248WnllgQnNcEOA8NFQAYMyBs38s3w7rBLaWEMQeZAHSU66R0dI7E0/BQz1RCZ
 z0t3N5T4iL+bstjTdlwib42LajpsxSpX33lpdutnxrFIsAsx7hOjIGGTosantGmeA+z3
 KNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793603409; x=1794208209;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=D32zmna3b36JOpXRgtREuQ9X398xiMYDyOb9kCyi/xw=;
 b=hcPFdBq3kF+fcG8cABhy1SfIdWoP7F1QhU4MHTmlcmbg5TXPEvBnGSnIJJgy8w61+J
 nFQtrMminAzdGsLvlm7aFWYNjGaAv6P+gXTQVr/FHYuDorfSODsmaQ2Se94G90GMZVnh
 kafED7z5xOOLt9mjyy7vB/M1g79f018IUC7CgC3qOcTHTT0bK2S1Iw49iyz//vwPqAVD
 SeH6h9AhhyVba4SdqR3Swp/A5t/FbaStToFqv6ahAWFt8j0ypJ4jWtWYNJNwkJ7n2iZp
 gBZtDkx4paDgzYbz4eIWrG3mLBb4u+Aon/DgyRkt1WRZHN0voXUfVttGwKn5R/5jDtHJ
 qFVA==
X-Gm-Message-State: AFq9FYIG8kBuD5iIpdGl9vg9lNTVR2z5YZTe1vbaAxeToFzmWh4ZgByh
 OXwrJizGfZitDnbm3wYgn0Qap2FkG/7hf87VNQuRiYC3C4IKjCm6DftfKRx6f/dMSctPO6SdB5z
 eHpUeKDiQZX3TRqkkevNKMpxBPLclmSfa1Q==
X-Gm-Gg: AYBFou2eUhDNO6Y3Co5SM2RTXuEZJh4BPi64ZHl3KbIXu9tQsNz3dO2kmTZ0RmM6fRl
 Y5kPsLs9nwFh1ZrzxM9mpo6ymGjO5plvPgHji+NtJZQZTnd6yiJPMRxH2fquccZv8l11QB7l28E
 cIJx0NmxKYizMyAoSbtOArMiFRu9KGhIF7OitkkBd1f2ivv8Vjfd7nD1U1PNzPCsetfdHcHaDDW
 z2nOEdaaFObSKM9WIkJAPzA2O1FhD/NdJFit9CNUzKj9dLT5zvW7hzKEnkM7/wcPkAjDTKY8/Tk
 Lr/+PtHpD+7xfwP3QDAK8miqqSSOSyApBG5KGuwq0bUcJKcQPLq2oUIOhLaaYXiMKKAfZgXKEl6
 pYOqiWoMxL1KZ3FIRwiEzdfywnc3IMRe4Ambh
X-Received: by 2002:a05:6808:1a08:b0:53a:8c5:d7d6 with SMTP id
 5614622812f47-5640d91b2f6mr5990055b6e.6.1793603408618; Sun, 01 Nov 2026
 23:10:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
 <20261029144400.2972217-5-angelo.compagnucci@gmail.com>
 <aufBUAf26C3d42n7@windsurf>
In-Reply-To: <aufBUAf26C3d42n7@windsurf>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 2 Nov 2026 08:09:56 +0100
X-Gm-Features: AclHuK_dUe91DyVUDCLRDYzBVz8OMj4l2kAEjKCXkM6MHH3Zn0IRo2vxiIgIFN8
Message-ID: <CA+TH9VkQEmYE4mNPyJVxxY509kpJv923Rr8KykKz10yiZpcPKA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 5/9] website: bump jQuery to version 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0081051584787888371=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0081051584787888371==
Content-Type: multipart/alternative; boundary="00000000000009e83d065f45d668"

--00000000000009e83d065f45d668
Content-Type: text/plain; charset="UTF-8"

Il dom 1 nov 2026, 23:47 Thomas Petazzoni <thomas.petazzoni@bootlin.com> ha
scritto:

> On Thu, Oct 29, 2026 at 03:43:56PM +0100, Angelo Compagnucci wrote:
> > jQuery 3.1.1 is affected by several known vulnerabilities, bump it to
> > the latest version.
> >
> > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> > ---
> >  docs/website/footer.html | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This doesn't apply here.
>

This should be applied after patch 4 in the series, which requires a manual
intervention from the mailing list administrator to go through the mailing
list because it's too big and hot the limit.

It happened already in the past when I sent the new website originally.


>
> > diff --git a/docs/website/footer.html b/docs/website/footer.html
> > index 44ef5db17e..d9f4f75196 100644
> > --- a/docs/website/footer.html
> > +++ b/docs/website/footer.html
> > @@ -1,4 +1,4 @@
> > -     <script src="
> https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"
> integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
> crossorigin="anonymous"></script>
> > +     <script src="
> https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js"
> integrity="sha512-8LENNbXmzI/Gbj+OwXmqR6V4QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A=="
> crossorigin="anonymous"></script>
> >       <script src="
> https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js"
> integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw=="
> crossorigin="anonymous"></script>
>
> In master, we're using
> https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js
>
> Are you sure your patch is based on master?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000009e83d065f45d668
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div><br></div><div></div><br><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Il dom=
 1 nov 2026, 23:47 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@=
bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; ha scritto:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On Thu, Oct 29, 2026 at 03:43:56PM +0100, Angelo=
 Compagnucci wrote:<br>
&gt; jQuery 3.1.1 is affected by several known vulnerabilities, bump it to<=
br>
&gt; the latest version.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagn=
ucci@gmail.com" target=3D"_blank" rel=3D"noreferrer">angelo.compagnucci@gma=
il.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/website/footer.html | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
This doesn&#39;t apply here.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">This should be applied after patch 4 in the ser=
ies, which requires a manual intervention from the mailing list administrat=
or to go through the mailing list because it&#39;s too big and hot the limi=
t.</div><div dir=3D"auto"><br></div><div dir=3D"auto">It happened already i=
n the past when I sent the new website originally.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; <br>
&gt; diff --git a/docs/website/footer.html b/docs/website/footer.html<br>
&gt; index 44ef5db17e..d9f4f75196 100644<br>
&gt; --- a/docs/website/footer.html<br>
&gt; +++ b/docs/website/footer.html<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&lt;script src=3D&quot;<a href=3D"https://cdnjs.c=
loudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.=
1/jquery.min.js</a>&quot; integrity=3D&quot;sha256-hVVnYaiADRTO2PzUGmuLJr8B=
LUSjGIZsDYGmIJLv2b8=3D&quot; crossorigin=3D&quot;anonymous&quot;&gt;&lt;/sc=
ript&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&lt;script src=3D&quot;<a href=3D"https://cdnjs.c=
loudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.=
0/jquery.min.js</a>&quot; integrity=3D&quot;sha512-8LENNbXmzI/Gbj+OwXmqR6V4=
QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A=3D=3D&quot; =
crossorigin=3D&quot;anonymous&quot;&gt;&lt;/script&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;script src=3D&quot;<a href=3D"https://cd=
njs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.mi=
n.js" rel=3D"noreferrer noreferrer" target=3D"_blank">https://cdnjs.cloudfl=
are.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js</a>&qu=
ot; integrity=3D&quot;sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfh=
rbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw=3D=3D&quot; crossorigin=3D&quot;an=
onymous&quot;&gt;&lt;/script&gt;<br>
<br>
In master, we&#39;re using <a href=3D"https://cdnjs.cloudflare.com/ajax/lib=
s/twitter-bootstrap/3.3.7/js/bootstrap.min.js" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstra=
p/3.3.7/js/bootstrap.min.js</a><br>
<br>
Are you sure your patch is based on master?<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--00000000000009e83d065f45d668--

--===============0081051584787888371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0081051584787888371==--
