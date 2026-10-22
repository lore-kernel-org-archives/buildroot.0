Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5317D606ACC1
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BglnSpLM;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FkIEAgt6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EBDE811F3;
	Thu, 22 Oct 2026 15:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dYx95ayRQd1; Thu, 22 Oct 2026 15:22:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 060A3811F8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682531;
	b=F08bVJVWMm1++753doyKN+aiaB3163cBJX51V7jSk7o1M/R+KVNkOfntnVX1wAAxjMS3
	 gtmQaKeNIQXQ6ZX8BINlVavI9C3dPu5fMb84wj6YYZrZvg8oxXeLMUHM6l5ADusPCaekT
	 SqIM3mixYfB+i2KX7yvkmivFmNvixd/JXMNL5DJZioany2y/BmEdzq1yWleoEZM3Lzm5N
	 xYE2Hzyrg+UhCCg2rgq5z4owtw0bmevPSt9T9DTeZ6a4HvQ2NumE2H8y1wgGbcvaBLVD1
	 L1VgUvR+s71Z5DWEGdXGIT+xm7JWHZmdAKGomHv51On1WRf36eLM5gkKSfiNZQoa2Ow==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682531;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=RpULm8VcF/iA7zPFBxp9L5p8jcBhkqF+XU52ztZ1/R0=;
	b=fdLgtv9Ayks+Nfhu52Qu2RFWq4Qui0Li8RypJJQtqG3G+oRuWEinSXUuGlmkExi5Mqk9
	 OgUoGyPKMBkDzOiP8IsDT8GnvAwEN58VWDVe7RvNFSaDOWDBVao+h35IOnnGQssE1lha5
	 X2aYHrWwPO5IqYdSxHHgxzBK7toYqZj9V+MoW0COBcO2tdII3QKN7z6xiP0vDCvcSdgDC
	 TJLGsBa05FlXutTdHIUIGCAit0eo2PsdmZli+v7PliHkM36qMlYuojCQXcwVE+L3dP35E
	 0ZqusVfVwEN58KfYXomfYsUA+uEaRxCaZgf6mFHxPHs0s3ptIKnPyNVDm2/mFp4AEMQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682531;
	bh=RpULm8VcF/iA7zPFBxp9L5p8jcBhkqF+XU52ztZ1/R0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BglnSpLMECkZBDm6JU0M9qjXwuClvlSzmvnZ7iwrTSCaxOdefk67JOS3Pypy11sEC
	 NiVE05Nz8QOa5xaykEV5kYyTqQnsYyxYHkcZalmZL1cTY52SfSBVvGs56Vpb8xonBw
	 N5Pp5cm494y0QpgLLB4mUw+59oBH7OJFIrJ3lo8rkLAt/x42kh4MBTxblpEyTWttuG
	 lWvkal/Cix4cNLOPdN1izDgPGmjOLeDPsTEP10N/6ArN1ap9SwjyMy4YSXXifWMPCq
	 M48zp/RzKDWs9c4Nffb6QyLmyXMQUR2Oe2l3uUMA5MCZXJiol7lFKgJpd/QUXmqT1x
	 Rkcg+ZS3WSAog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 060A3811F8;
	Thu, 22 Oct 2026 15:22:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93A9795C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79C776069C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8idVro9_9B1F for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26B3060680
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::112c"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792682528;
 b=VYg17y4h52NbB27AHXNFTqunjmdXJ3sJcflf+JDvvMwAmsBdSmbJXV0g6KxnuuZa+cCd
 KlDrTi0fC4mSxebI1IcMzIEY/PZ53VrrQDe6jhEquHmTRo9tk4iXgHkxYl+bfVJCaEwGv
 GqLZ3CoIVzCpkAnsr//8FlVwIAWdSll6qTghIX2QRX1kW5unSTUcQTEdYs6Zq7pSika+o
 QMO7Cdle7HOyExRAmLsfqfm+LvE96j0sny4ezV7P657HFT67rEFojLzYmNYPT/ZErvv9X
 ElB6lJB0fTH1+lNc7uJOxBjCvwEIV6E7uRxaZrHaq0aR9F+f0njNWu6h+sXT0w7c0mw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682528;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=EHt24r/LfFX/D0CTNdl5F88NBySzw1MVOHpAQEeTx6U=;
 b=FM/4U8NwUDh3g3QRGYFp4+OLcD/H90K/C+ypMoh+OYEBTMFsOlM8EVopOYO5bZre6uXN
 CABjoxuqkLBhgEE9tfnhZJT6fosZ8qsiugNM5+hE/LusrKlUeDpfvACMoAF/e+lJGvt5H
 CEPGP1JoMnOJAqqtLogVDUaXJAb2mostUTm0jHlBUuhV4BJb6EyrQVWTDIL6xnTChfNdV
 T2CngzcLwzYiI+OeJ03nG+tcd55TI+fTLF8cuWSxYCFQvYLishs3NwQd2CnjNwA1eQi9w
 KrUJaN/CZfL05Pwp9g3FpiPAP6E4WHgJHXw+6Unkt+DBlWzg8p1NbVd7qSlWI8NiQ/A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FkIEAgt6; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::112c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FkIEAgt6
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26B3060680
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:22:07 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b0e21048f8so19295267b3.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792682527; cv=none;
 d=google.com; s=arc-20260327;
 b=InEjPzdcZyvDy4sOS/PVGTIXX9jGGeBYGuL5igczmNKbJx9oNUwr+vPR8AsdrX0z0J
 Gi4xN6T8yW5zVno3NINWe3OJP9ZW2iHMFL+vfJbSXC69EBlZMZIVEPyo2bpqlffQVWDy
 iWz6SVOSmuizYAwHSf3XmzIwlKjnK863IV1sxO/uC50eSpgF3cr6SYmwN9b5AK9h9Py6
 MUb4TgXDxcsJNMKzF+RVEwj3GI9hMaBh20dnvs0S6O9U6/ScISZlMyA6nERF/aV7lxCF
 mmk2HYMloCq1XZ6nBeEyx2yQe1nIK9XUv5F+oU4uybJeluaNjgUP+P4RSyJARZ2doNhr
 iOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EHt24r/LfFX/D0CTNdl5F88NBySzw1MVOHpAQEeTx6U=;
 fh=uO4p1laeMeYHYyNzBoKjK3Va3goVXExfxtFn1BssHXk=;
 b=WlXDJuHdgzvtT4YXH3ysG0fVC8zjgPm0DvoTbfc1EX2Sz6az7vfBRwoKhyVQe1QKfi
 tl1HNg5XXpyznZMK1IQwFDt92Hs9PvoNcRE+PFBWwF2vzyowJHrD7DKlFPxzaWaWfoi2
 h1cWvQE+7CSRT1GDhLhqtjT2A9Ts73ENt94cmFeYi8OeUmWhkOye54hH4QgWYgwgkmYz
 mWlVYo4lnBHbwvPgC8CrmCwZWlKk+xgBcd+nxyanU4vAeSBjyjEfHeYXgEEwV2eMUd+/
 o9N8jJyck32tesc1DSu/MGYRVlXu8FUyZkCiy+OTAgjbJe2ASFOGD74MQ3F7Z8/iKbF9
 D12g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792682527; x=1793287327;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EHt24r/LfFX/D0CTNdl5F88NBySzw1MVOHpAQEeTx6U=;
 b=FkIEAgt6mUBSVwGZrAO5dVNAFC4uHozlgJPWdxGmuWCLS2lUifRwViDCjvD2+tehOF
 BeH/GAJreT1xcgheTj40Vj6uQ+jypXeadBBzj394siOBSLVEIFJo3Q9bgKT0HX7DJPU8
 1Voe4VbH1KigZplQJgSoZUAuahROAaMb3Jslg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792682527; x=1793287327;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EHt24r/LfFX/D0CTNdl5F88NBySzw1MVOHpAQEeTx6U=;
 b=apWxmcnieiy0KibSBhKfPE6+IrdpC38x9dgU/5SqA/EzFLgXvpjFWdT7Y826s+Jf0b
 mFgtmnq6EykHrcrCqtKTQUis/MpB+4yz6TeESWw+IAp129MkeaXaFwn/6m9+JFP2UAn9
 mqrZfG59Zn3xX8Qg57mYt6zfmaiQPYKmUNS4gWG5Xt9kyu5CjA9bn4b8M4+WW6DM4Mxc
 4F5RgS//57Bm7vBJ28r56zvZk8R2RmUx6x+IaUf2Mcl1malsFRMV4LJMSC07ibDCH/aN
 3BVdzWNQ7V6EQi+dnBtvCTyWK5tBCiNckDQ1abz7U84fGR+AEFu1nDDp35fvro5j4Oys
 ecCA==
X-Gm-Message-State: AFq9FYJeHAiNd3j5TIhNCWHlgk6oP++IvVDOOW3BOMFoSN8CPsac6OL+
 BK+wXbThxKgEpfFM2AIzvAIgS9w5NnVTFRp87blQr0grL3KcfoNwkuQBfQv5hs1PVMddjeEF7ZQ
 6JQU7TeamXVGbur3JoiM/OuwlLtAbG8nMutq3iPQS1WaKVtDWKc2QrVQ=
X-Gm-Gg: AYBFou1sNR0EP7wDTKPg5MO5jpUgbqzs3qJT530M6mLxznR7j7K7F3vxbFuLr+OlVCo
 WMDMbzg5doNUh/whIkF0VgVf1Td8lSTg57D3ElZ+cTB3/BjRXVwOCCUi8gdJWtihpKa93A6ZKyJ
 3Pvd1cgsxIzh9N9LoPlbAty/+PZ38Al7iiHJeJUFFFs9Ye2BJRiILjWGO1T1yX+1BORh6RgRM+c
 86n1OfPEpHx0gmWLnS5PfcVo3Y/h8TR5wP1pWaODnoEvOYj1s/q8HaxHfXgTL3qQ7rh8+8Urarg
 gH6iVO0W3GxSsbtmMALbBLOAZwdM8LGDhgW++Qgb4koNLhKnsiqKnswvenX7wzaRL+Oyt6vjjKo
 HgyM5P5kH6YrpS3P5Dn/D0EaMYTkoXS/bxnB7GM3Bsrl3ddORs7EHl1J/wQXE602fNA==
X-Received: by 2002:a05:690c:4f8f:20b0:8b1:533a:e10 with SMTP id
 00721157ae682-8b1533a1224mr3193557b3.45.1792682526520; Thu, 22 Oct 2026
 08:22:06 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 22 Oct 2026 17:21:55 +0200
X-Gm-Features: AclHuK8YbKuBmfySzOLQ22sRGOfYZQchV9aq3_a_rgnHd5WsUyT74R6PrMx-mi8
Message-ID: <CABGWkvqCSNdeeLbh5RHRce7d+Wkewhme5CzV5_mBFCj8SsuXrw@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>
Subject: Re: [Buildroot] [PATCH v6 0/6] package: add CANopenterm and
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4144176841643632758=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4144176841643632758==
Content-Type: multipart/alternative; boundary="0000000000003044cf065e6f6dcd"

--0000000000003044cf065e6f6dcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 8:38=E2=80=AFAM Dario Binacchi <
dario.binacchi@amarulasolutions.com> wrote:

> This series adds CANopenterm and the packages required to build it.
>
> The previous version was blocked by the lack of an SDL3 package in
> Buildroot, as pointed out during the review of v5 [1]. SDL3 has since
> been merged into Buildroot, so this series now builds CANopenterm
> against the current SDL3 package.
>
> While revisiting the v5 series, I also addressed some build issues and
> added the missing dependencies required by CANopenterm.
>
> This series was also tested with Buildroot's test-pkg.
>
> [1]
> https://patchwork.ozlabs.org/project/buildroot/patch/20250707055824.49575=
-1-dario.binacchi@amarulasolutions.com/
>
> Dario Binacchi (6):
>   package/sdl3: fix build on PowerPC with uClibc
>   package/sdl3: disable m68k builds
>   package/pocketpy: link with libatomic
>   package/isocline: new package
>   package/canvenient: new package
>   package/canopenterm: new package
>
>  DEVELOPERS                                    |  3 +
>  package/Config.in                             |  3 +
>  package/canopenterm/Config.in                 | 27 +++++++++
>  package/canopenterm/canopenterm.hash          |  3 +
>  package/canopenterm/canopenterm.mk            | 29 ++++++++++
>  .../canvenient/0001-Fix-build-with-musl.patch | 43 +++++++++++++++
>  package/canvenient/Config.in                  | 13 +++++
>  package/canvenient/canvenient.hash            |  3 +
>  package/canvenient/canvenient.mk              | 14 +++++
>  ...nly-require-CXX-compiler-when-needed.patch | 55 +++++++++++++++++++
>  package/isocline/Config.in                    |  9 +++
>  package/isocline/isocline.hash                |  3 +
>  package/isocline/isocline.mk                  | 21 +++++++
>  package/pocketpy/pocketpy.mk                  |  8 +++
>  ...001-Fix-build-on-PowerPC-with-uClibc.patch | 40 ++++++++++++++
>  package/sdl3/Config.in                        |  8 +++
>  16 files changed, 282 insertions(+)
>  create mode 100644 package/canopenterm/Config.in
>  create mode 100644 package/canopenterm/canopenterm.hash
>  create mode 100644 package/canopenterm/canopenterm.mk
>  create mode 100644 package/canvenient/0001-Fix-build-with-musl.patch
>  create mode 100644 package/canvenient/Config.in
>  create mode 100644 package/canvenient/canvenient.hash
>  create mode 100644 package/canvenient/canvenient.mk
>  create mode 100644
> package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
>  create mode 100644 package/isocline/Config.in
>  create mode 100644 package/isocline/isocline.hash
>  create mode 100644 package/isocline/isocline.mk
>  create mode 100644
> package/sdl3/0001-Fix-build-on-PowerPC-with-uClibc.patch
>
> --
> 2.43.0
>
>
Gentle ping.

Could someone please review the series?

Thanks,
Dario
--=20
*Dario Binacchi*
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

--0000000000003044cf065e6f6dcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 24,=
 2026 at 8:38=E2=80=AFAM Dario Binacchi &lt;<a href=3D"mailto:dario.binacch=
i@amarulasolutions.com">dario.binacchi@amarulasolutions.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">This series adds=
 CANopenterm and the packages required to build it.<br>
<br>
The previous version was blocked by the lack of an SDL3 package in<br>
Buildroot, as pointed out during the review of v5 [1]. SDL3 has since<br>
been merged into Buildroot, so this series now builds CANopenterm<br>
against the current SDL3 package.<br>
<br>
While revisiting the v5 series, I also addressed some build issues and<br>
added the missing dependencies required by CANopenterm.<br>
<br>
This series was also tested with Buildroot&#39;s test-pkg.<br>
<br>
[1] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2025070=
7055824.49575-1-dario.binacchi@amarulasolutions.com/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/202507=
07055824.49575-1-dario.binacchi@amarulasolutions.com/</a><br>
<br>
Dario Binacchi (6):<br>
=C2=A0 package/sdl3: fix build on PowerPC with uClibc<br>
=C2=A0 package/sdl3: disable m68k builds<br>
=C2=A0 package/pocketpy: link with libatomic<br>
=C2=A0 package/isocline: new package<br>
=C2=A0 package/canvenient: new package<br>
=C2=A0 package/canopenterm: new package<br>
<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
3 +<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
=C2=A0package/canopenterm/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 27 +++++++++<br>
=C2=A0package/canopenterm/canopenterm.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 +<br>
=C2=A0package/canopenterm/<a href=3D"http://canopenterm.mk" rel=3D"noreferr=
er" target=3D"_blank">canopenterm.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 29 ++++++++++<br>
=C2=A0.../canvenient/0001-Fix-build-with-musl.patch | 43 +++++++++++++++<br=
>
=C2=A0package/canvenient/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 13 +++++<br>
=C2=A0package/canvenient/canvenient.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 3 +<br>
=C2=A0package/canvenient/<a href=3D"http://canvenient.mk" rel=3D"noreferrer=
" target=3D"_blank">canvenient.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 14 +++++<br>
=C2=A0...nly-require-CXX-compiler-when-needed.patch | 55 ++++++++++++++++++=
+<br>
=C2=A0package/isocline/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++<br>
=C2=A0package/isocline/isocline.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0package/isocline/<a href=3D"http://isocline.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">isocline.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 21 +++++++<br>
=C2=A0package/pocketpy/<a href=3D"http://pocketpy.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">pocketpy.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++<br>
=C2=A0...001-Fix-build-on-PowerPC-with-uClibc.patch | 40 ++++++++++++++<br>
=C2=A0package/sdl3/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++<br>
=C2=A016 files changed, 282 insertions(+)<br>
=C2=A0create mode 100644 package/canopenterm/Config.in<br>
=C2=A0create mode 100644 package/canopenterm/canopenterm.hash<br>
=C2=A0create mode 100644 package/canopenterm/<a href=3D"http://canopenterm.=
mk" rel=3D"noreferrer" target=3D"_blank">canopenterm.mk</a><br>
=C2=A0create mode 100644 package/canvenient/0001-Fix-build-with-musl.patch<=
br>
=C2=A0create mode 100644 package/canvenient/Config.in<br>
=C2=A0create mode 100644 package/canvenient/canvenient.hash<br>
=C2=A0create mode 100644 package/canvenient/<a href=3D"http://canvenient.mk=
" rel=3D"noreferrer" target=3D"_blank">canvenient.mk</a><br>
=C2=A0create mode 100644 package/isocline/0001-Only-require-CXX-compiler-wh=
en-needed.patch<br>
=C2=A0create mode 100644 package/isocline/Config.in<br>
=C2=A0create mode 100644 package/isocline/isocline.hash<br>
=C2=A0create mode 100644 package/isocline/<a href=3D"http://isocline.mk" re=
l=3D"noreferrer" target=3D"_blank">isocline.mk</a><br>
=C2=A0create mode 100644 package/sdl3/0001-Fix-build-on-PowerPC-with-uClibc=
.patch<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><p>Gentle ping.</p><p>=
Could someone please review the series?</p><p>Thanks,<br>Dario</p></div><sp=
an class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><font color=3D"#888888"><font color=3D"#=
000000" face=3D"Times New Roman"><span style=3D"font-size:14px"><b>Dario Bi=
nacchi</b></span></font><br style=3D"color:rgb(0,0,0);font-family:&quot;Tim=
es New Roman&quot;;font-size:medium"><span style=3D"color:rgb(0,0,0);font-f=
amily:&quot;Times New Roman&quot;;font-size:12px">Senior Embedded Software =
Engineer<br></span></font><span style=3D"color:rgb(0,0,0);font-family:&quot=
;Times New Roman&quot;;font-size:12px">M. +39 328 0625246</span><font color=
=3D"#888888"><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Ro=
man&quot;;font-size:12px"><br><a href=3D"mailto:dario.binacchi@amarulasolut=
ions.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">dario.binacchi@a=
marulasolutions.com</a></span><br style=3D"color:rgb(0,0,0);font-family:&qu=
ot;Times New Roman&quot;;font-size:medium"><span style=3D"font-family:&quot=
;Times New Roman&quot;;font-size:12px;color:rgb(241,194,50)">=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span><br style=3D"color:r=
gb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:medium"><span s=
tyle=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:=
12px"><span style=3D"font-weight:700">Amarula Solutions SRL</span><br>=C2=
=A0Via Felice Cavallotti 25D, 41012 Carpi, MO, IT<br><a href=3D"mailto:info=
@amarulasolutions.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">inf=
o@amarulasolutions.com</a><br><a href=3D"http://www.amarulasolutions.com/" =
style=3D"color:rgb(17,85,204)" target=3D"_blank">www.amarulasolutions.com</=
a></span></font></div></div></div>

--0000000000003044cf065e6f6dcd--

--===============4144176841643632758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4144176841643632758==--
