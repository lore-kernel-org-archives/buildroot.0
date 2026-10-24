Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48549606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qJkFAL3+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kMqSpKXC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1995C80D91;
	Sat, 24 Oct 2026 10:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gxpdpp9KxrZ4; Sat, 24 Oct 2026 10:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F21A1816D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838833;
	b=st0on2S7Do3Q6QaZXJw4g/KZV/NKaA1wfyf46vADRJfhbl4CyPgENDyxaVVfgo5ex/BU
	 2qu/76RSvcRAlwbzPylAxWt6AORQqVH8G6JoKoK3OFdKFfj5WlOBzLruP86VClp7UgBsm
	 GuL43YNrJOrhpcdEUM0xOhYZFDzG8TrP7cHssr0oagHV5R6aRBDtyfKY/WkswWBxAd6w5
	 ywhRMnzCr6+CRcreoBwQRQfv3LY9lPOG8T1g0yqvAcz2z8WjeX+MqaVGMErfugOgvt4lA
	 vS9Ms9f91IE1sU9tXqJYMWcHxg/Ul947DuQC8zRGr4jeT4eoWe/zEMorKNdcpaHQKAA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=dAstnc1kIm4zQJcbC3jpkNNhVR4OrMWBo3Hx+2JOsP8=;
	b=S17jODPcnQL6nnLTu7viumcrFiY/OSxN9pyZ9Eh1qVy38Wij6JZGG+u+vEfXgOQ91SvN
	 2IiyYyNt8/S/l1kp0z+dH0PL2+qpU4ik6l7xr8gnVqoFsEG3KkIVYvu0RRWPi4ZRPC1hz
	 g5mAbu77hUtjBMSsd19PufJucYQnGglX0ugjyEgbyMbvu35aiPZFy8r+Y9aO5321r67SN
	 6JqQyjj4kiLnnmY3Yw7oHFz1s361XZG0RWyssCHRGbWbmzX6k4a/D3AyYH7NiUhd1+SYM
	 8/jqhR+WypUmMisiQG8QaYPxUQVSLZuWWlSw+FkSgANN2TmIz4UDaOOU77FtIYpxubA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838833;
	bh=dAstnc1kIm4zQJcbC3jpkNNhVR4OrMWBo3Hx+2JOsP8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJkFAL3+DNXc+woazhHjTDbnBlaXv24v342ULZtX9K18Jwnaen7MnE8rhvDN1DZ4C
	 n7PhreQa0rvRJHPeya+DHXWH1b8JMCuBdFRQd6rKEI+LxixQmdLgs3ASyXdGpwqCpW
	 Ohy7/w/hfWvIoLnKMv8OHKaypPyEcQcbn7uieD6qyWvRckwgKLAnDQ6hGWbXteIgp3
	 A5/nxPN9ApJUoRxFx5vJtyYnBY8EW3YFfTWUZS4EET3XynjFM9sxJk96dALN0OkT26
	 OrZZjMIf2sL32BbC+/uRz3pJgCOYg5mOJiWmETuv4W9st2CLVPCfV7R4rx14MDXU+3
	 QVGBck3GGeK2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F21A1816D4;
	Sat, 24 Oct 2026 10:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18C2A380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1561460739
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sntdOCRGfzIT for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:47:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF71D60680
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::a34"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792838830;
 b=izr/zpI1kN2NsJcVHdv+saRhhWAMhegPmH6TVF5m1+rWHaEAUjmDEcAt4RJRlk8MxXe6
 8/zQLH4SMjYRB8i5H1KWElqW/9lF0BpPIREeGwBwcWBA8GYAdZ6EceReW4UzbU66vOV2z
 ANK4slf9dh4kN2fy72ohwVygwWr2a15DADOQCLGofBTSi3WhLH++CzzB6kVgIebJhtAke
 VD5TZdoNp61TCYrNkJEVDleKeNQonvHULZ35azDSgoiVDpfDBnZ6YyQNDvnVOJYkHuync
 YSf/q2h7GIohYUpRoTTBX14gPH3JC3MEP2tKbSLZHHaHJ7GMVi58hRgKhYbKQop3M3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792838830;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=8lUhODod6nFK1/f6QugIpWt2Km1165fSJpFizfvWxBg=;
 b=SVSGQp7MdaBigQTo6jfTXbmhV3yWg/bSmp1MqzVYnK95ff7afpqzBq7CUijDq+aH0TD6
 E5TKa0vDElEismbjKTS6CYlBNMsLISCgb8tieJM8B8tNxwqRovT9eyTe554bA5fE63FSH
 OYXxU6y0wbYSEyUfzfuzsAwI7eIo02c1F3OfWsXGmLM2s46ziPWl+HvOCUh4CX5TjzKbj
 pl3JMdxw7F7ci73JpwL0tUhnHyFjGXdj5wVzRibhfPPrXKlksh2qbsXw1D36v6d242VPq
 eG5IQH5LlO0YBgiMpgDdQGFPJMe1T6Qeq7C6VxfnwKf8eeQPHeLechbi62F4KHdn1cg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kMqSpKXC; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::a34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a34; helo=mail-vk1-xa34.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=kMqSpKXC
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF71D60680
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:47:09 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-5ea969fafeeso620383e0c.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 03:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792838828; cv=none;
 d=google.com; s=arc-20260327;
 b=ZAeEuxFYsBpdoOCTv6S+0UUzmm3OMAC3amSlKOy+TJfNOdgdBVBypYhuQnZED6tMPC
 QrBNzw9QZBwOvmlST+Sj7O7LEI8i+7xB1czbNSX/V15KJASUPVdbXHDXS0PD1+V8RwyA
 aBrmJAVtzTQi42+nI7hFDC5w/sco/Y6WHNp1vxRZwZpKil0yfaVE9Z/r+YFMRNeSqavr
 unRBiDJL0b+d0L8T0/Bj3ooYq3b7X3JLsAxRKklvlmEQ3t+vMIuS21a72hrfR1EiwpTH
 pLFfCtG7wl+iI+MAg0DGKpAt98em/0BIlcLst3vdNghBRlz+DcnUrW0w2Br98zQNDTHT
 iFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8lUhODod6nFK1/f6QugIpWt2Km1165fSJpFizfvWxBg=;
 fh=uNQaJjvtYez2Pf/8MdVG/BxjCe+pTpQsdq1aveHShLY=;
 b=lswRK9aQV/7Z+PEIyHQQcIiGqONpeZzwbeI1+7mPRPyQwFzIAgiohLW5dwUlFr3WwH
 Ze5ndEiNh9C6GUc5y5PAIB7AG9B5ieflSCEhK3MnFjitojfMTvg/OIaE33mABp0mLkQi
 yo1L2Cys2MYDZHiDt4hk4M6Yuuefu4u1/1k4ivrqKkt1qSREQggx6yNbE2+Zg5UXP9t6
 XClvX5J7e1xjgSgHmlj+xzAM2QpH9K52cCR8Uv38DXCiRYzC7Itik8qpN3HnDYB5OMIP
 LH//niHB+KpsWdmPcwTuHsW8LcnzrsANccF5dPfVTJn8etSY/4vEdeeqhYABZInedkUr
 a31g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792838828; x=1793443628; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8lUhODod6nFK1/f6QugIpWt2Km1165fSJpFizfvWxBg=;
 b=kMqSpKXCF/ZDDYIW6K+v1UlfKneleuzdnZxInb/61SSUHVZ6OoHf4HOMtrr1TFHBs3
 lXDntv27ykJcSN5Dx+/my9ZCKzt8RtbTVn4If7Rgce5OZJBXLue6qbv15b+flhw7jrOY
 CGw7+H72t0z/Oeq8vyykNr4yNOodlUw2jeaCNt1wInAJtXfiu8eL0rmVYKYznwOTvPuS
 Qe5B1HNey0Dvm73S3pUwaiZD9ED7PaWDCjlYMfeQWXiUnYWZ9TX7+wl1We7S1rutA3n0
 eMrF6QG9M9sE8j3khJjZvIibVeNjjGJcWWwXOzDMM1Lz1x7C9zI7IYj4JSOub1Wrnkka
 50VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792838828; x=1793443628;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8lUhODod6nFK1/f6QugIpWt2Km1165fSJpFizfvWxBg=;
 b=CpLGNtwVUJ9KmhjD8pf8dujKaY0gVtXxEKzmMMnC2m0AYB55KwG2ae4rTkwYmcgpID
 gwD57jTaAMzq1+/jSDNKjo3siA+NP2nPTrutK1gZMq/uk0Fq9oPVI2CJsEjWoXR5dT1b
 Brvwy8TDXIeasrTcdp+UBB/I10hQxwZZz+vYnnVlUG0xluP/5j8MbnT6RYlhF/i4EbcR
 v1yuKyE9vGkDMwQZ05szji6B/C+NoNqxb2cob/8Z839MULBVJ3MsMpmPsgrA4m+hwmPy
 btZoBQcIHh42wCkzzNKOjyqEzDdidKBqgOZ2+Wr2sc0HPjm2cO29f4BQqCpTMNC/hMQW
 yEBQ==
X-Gm-Message-State: AFq9FYKrJAg9XivaxbRt0Y3KnBB2ue37jv+nx4ofB+zawvI3U/2hSozT
 akX0LORS5whxde8ZyBghWldPOS8Q06eZauJAAqBoZrIwusdM14i2QjmdqlIUnToxiysS2lFQd8Y
 Vk4L2C5PDrSSyzCLrzEQADSeKUJBV5hIV/1Yq
X-Gm-Gg: AYBFou02SyhrcfuJpo0gJlE1ZDTS+v8a21OJt2MCcky/scss46Ld1jIw1yoAUbU1e3f
 CDxfNmZShQr47cClHv5ORDgQ8x29pSkz5lD3vICsMDXvLu1I9vSXDjkgRuJoC37UrDkhYtyxpjy
 GaNW7DRmeuHTU9ULARIzzrRLKFCooD2KPIAj4s6jtyomBnnGtNZdE6rBa9uTPwhH2aCoU/ZZ2Iq
 q31Jwz6ak4TVHbfzsLSNRo3O6S9KobvxM8ELoOOvrDI9UKTx2fyMNcezv2MUGDmusp4WvJS8pJu
 AwcwT/cNwb5LQKx+VUXNezHIO40gXAljq0vPxfuaWVJd0sdziLqzsZLIqnTxHT07UxUeOHoIflK
 BVHUapa7HRBbPZaElSyOr0Gm/wkKK0TzpF8cjjeijWZpqv+cbicfwRlKiBk3SrzvysJLjwlEuKS
 nGFJ1f6FOsyVvC14h96b9khQimjJV6sz0KMy7BwNs=
X-Received: by 2002:a05:6122:130a:b0:5ea:389c:51fe with SMTP id
 71dfb90a1353d-5ec233150e4mr404370e0c.17.1792838827963; Sat, 24 Oct 2026
 03:47:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-6-florian.fainelli@broadcom.com>
In-Reply-To: <20261023215138.2301146-6-florian.fainelli@broadcom.com>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Sat, 24 Oct 2026 12:46:57 +0200
X-Gm-Features: AclHuK8O0Uh0_87kYsnd6cSO3aT1cMmLqAd_7hUqbrAEmBcthYVHXXMLtdVYAj8
Message-ID: <CAMTop88VNT5nza_-_1HRRUdw8XQjsiitYhK0OkoLJQwYgK44=Q@mail.gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 12/23] lua: rework post-patch hook usage
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7675050825631186083=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7675050825631186083==
Content-Type: multipart/alternative; boundary="0000000000007af899065e93d1c6"

--0000000000007af899065e93d1c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is another hook which alters also luaconf.h on host tree source.
It was introduced by commit "package/lua: allow host-lua to find installed
modules"
https://gitlab.com/buildroot.org/buildroot/-/commit/4be3fd6fdb73085a35e89c2=
c1218c1e0b1e74a79

Fran=C3=A7ois

Le ven. 23 oct. 2026 =C3=A0 23:58, Florian Fainelli <
florian.fainelli@broadcom.com> a =C3=A9crit :

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> WIP: YEM: try to see if we can make that a post-configure hook
>
> In preparation for the introduction of out-of-tree package build, it
> is important that we don't do different things in the patch hooks for
> the target and host variant of a given package, because the source
> tree will be shared between the target and host builds.
>
> For lua, the post patch hook was modifying luaconf.h before the build
> to get a 32 bits Lua build. However, passing just -DLUA_32BITS like we
> do for other Lua compile time options is not sufficient since
> LUA_32BITS should also be defined in the installed luaconf.h so that
> other packages linking against lua get this defined as well. So, this
> patch changes the post-patch hook to passing -DLUA_32BITS in
> LUA_CFLAGS *and* changing the installed luaconf.h in a
> post-install-staging hook.
>
> Cc: Francois Perrad <fperrad@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> (cherry picked from commit 827ed461ba2b00acfebcbd01e53d93a148594833)
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  package/lua/lua.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 6dbdc950021b..92910f8fe746 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -66,11 +66,16 @@ endif
>  endif
>
>  ifeq ($(BR2_PACKAGE_LUA_32BITS),y)
> +# We adjust the CFLAGS for the build of Lua itself, and then the
> +# installed luaconf.h so that package using Lua also see LUA_32BITS
> +# defined.
> +LUA_CFLAGS +=3D -DLUA_32BITS
>  define LUA_32BITS_LUACONF
> -       $(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/'
> $(@D)/src/luaconf.h
> +       $(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' \
> +               $(STAGING_DIR)/usr/include/luaconf.h
>  endef
>
> -LUA_POST_PATCH_HOOKS +=3D LUA_32BITS_LUACONF
> +LUA_POST_INSTALL_STAGING_HOOKS +=3D LUA_32BITS_LUACONF
>  endif
>
>  define HOST_LUA_LUACONF
> --
> 2.34.1
>
>

--0000000000007af899065e93d1c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>There is another hook which alters als=
o luaconf.h on host tree source.</div><div>It was introduced by commit &quo=
t;package/lua: allow host-lua to find installed modules&quot;=C2=A0<a href=
=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/4be3fd6fdb73085a35e=
89c2c1218c1e0b1e74a79">https://gitlab.com/buildroot.org/buildroot/-/commit/=
4be3fd6fdb73085a35e89c2c1218c1e0b1e74a79</a></div><div><br></div><div>Fran=
=C3=A7ois</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23 oct. 2026 =C3=A0=C2=A0=
23:58, Florian Fainelli &lt;<a href=3D"mailto:florian.fainelli@broadcom.com=
">florian.fainelli@broadcom.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Thomas Petazzoni &lt;<a h=
ref=3D"mailto:thomas.petazzoni@free-electrons.com" target=3D"_blank">thomas=
.petazzoni@free-electrons.com</a>&gt;<br>
<br>
WIP: YEM: try to see if we can make that a post-configure hook<br>
<br>
In preparation for the introduction of out-of-tree package build, it<br>
is important that we don&#39;t do different things in the patch hooks for<b=
r>
the target and host variant of a given package, because the source<br>
tree will be shared between the target and host builds.<br>
<br>
For lua, the post patch hook was modifying luaconf.h before the build<br>
to get a 32 bits Lua build. However, passing just -DLUA_32BITS like we<br>
do for other Lua compile time options is not sufficient since<br>
LUA_32BITS should also be defined in the installed luaconf.h so that<br>
other packages linking against lua get this defined as well. So, this<br>
patch changes the post-patch hook to passing -DLUA_32BITS in<br>
LUA_CFLAGS *and* changing the installed luaconf.h in a<br>
post-install-staging hook.<br>
<br>
Cc: Francois Perrad &lt;<a href=3D"mailto:fperrad@gmail.com" target=3D"_bla=
nk">fperrad@gmail.com</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@free=
-electrons.com" target=3D"_blank">thomas.petazzoni@free-electrons.com</a>&g=
t;<br>
Signed-off-by: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin.1=
998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
(cherry picked from commit 827ed461ba2b00acfebcbd01e53d93a148594833)<br>
Signed-off-by: Florian Fainelli &lt;<a href=3D"mailto:florian.fainelli@broa=
dcom.com" target=3D"_blank">florian.fainelli@broadcom.com</a>&gt;<br>
---<br>
=C2=A0package/lua/<a href=3D"http://lua.mk" rel=3D"noreferrer" target=3D"_b=
lank">lua.mk</a> | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/lua/<a href=3D"http://lua.mk" rel=3D"noreferrer" targe=
t=3D"_blank">lua.mk</a> b/package/lua/<a href=3D"http://lua.mk" rel=3D"nore=
ferrer" target=3D"_blank">lua.mk</a><br>
index 6dbdc950021b..92910f8fe746 100644<br>
--- a/package/lua/<a href=3D"http://lua.mk" rel=3D"noreferrer" target=3D"_b=
lank">lua.mk</a><br>
+++ b/package/lua/<a href=3D"http://lua.mk" rel=3D"noreferrer" target=3D"_b=
lank">lua.mk</a><br>
@@ -66,11 +66,16 @@ endif<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_LUA_32BITS),y)<br>
+# We adjust the CFLAGS for the build of Lua itself, and then the<br>
+# installed luaconf.h so that package using Lua also see LUA_32BITS<br>
+# defined.<br>
+LUA_CFLAGS +=3D -DLUA_32BITS<br>
=C2=A0define LUA_32BITS_LUACONF<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/\/\* #define LUA_32BITS \*\//#def=
ine LUA_32BITS/&#39; $(@D)/src/luaconf.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/\/\* #define LUA_32BITS \*\//#def=
ine LUA_32BITS/&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(STAGING_DIR)/usr/=
include/luaconf.h<br>
=C2=A0endef<br>
<br>
-LUA_POST_PATCH_HOOKS +=3D LUA_32BITS_LUACONF<br>
+LUA_POST_INSTALL_STAGING_HOOKS +=3D LUA_32BITS_LUACONF<br>
=C2=A0endif<br>
<br>
=C2=A0define HOST_LUA_LUACONF<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000007af899065e93d1c6--

--===============7675050825631186083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7675050825631186083==--
