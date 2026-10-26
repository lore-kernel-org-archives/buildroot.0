Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87866606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A3oG3780;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sL5v6JI2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E58880DC8;
	Mon, 26 Oct 2026 09:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b68eq3uZHMIl; Mon, 26 Oct 2026 09:17:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F9B980DA2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793006235;
	b=K8z04I2jJM1VDCJG2zYNiEV88gDDhSeBjgy8oYCHEIsP0bF61Koc2HogzX+Z9GrxDUk+
	 mZPi5G5iWcVWDn4uXw/g3OTsyRJV20fbFyaAe+XdKZXjSFsBPot0a6+6Dlumf1pqjGD0m
	 5XOvJjwoX+1+9OO0+0UL2hB5uzZ8r856d9bmmebuh3qy58q6YQZIrTcqoxac2tj2WTcmP
	 FTqHwdedRrCOcIw0Y6b4s15mJbNtyRtXs13MRd5E4DIuxrZMIxS6KNbF9L4KGz7tRgEIl
	 fxXK2HcH18yF7V1Fb1iekqAVhA6Jy721TqSZRt4SigVqfPtlseXnYMS+Nz2IuOOKAwA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793006235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=XGAt2ENbtLQeDCfEevgJ1/c1UDjunvml/kFlzJGQ9JM=;
	b=MMrAHKYcRT1lXZFKdYun2LFcuEPnogc0geovj3NUIgUBag9uKOfuTB30fPo8XKDFJ6Qs
	 hSiCUo817mEB/Af2swz5AtuX9tv0+3eA58pACIXs9WVGO1yDOCGkGnWt2J8jC9eXvFBh9
	 Ll2qrlhxAKQtrp+Ph78N0M33qJbZWpu+FWB6QfsR5wJfY2fLY1/njS2HddDbTmYZ42zcA
	 bSW6K+0YQ2uBcXQt8I2XJvIeVKRH3NaClOTngeMPcle+4XLEjj2Psk7IIZ2wd6gTdid+2
	 gE6EJ5tGBofKAqSfZHmeYFtABfFLtp337g0biiiHboORBrpduBiQbasqDX3D/u6Su9Q==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sL5v6JI2;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793006235;
	bh=XGAt2ENbtLQeDCfEevgJ1/c1UDjunvml/kFlzJGQ9JM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3oG3780cawkDJGiduNlCOcBvEpnavIkEIQbk6nR6cex/7xXGIRv4VkdEsBTHa6ZP
	 blawm2XmzXDQoAEDuULWpzmY7rF+KOFOXJ2bGpOofT5Getu2u0SrnUr1QN0kFia12Y
	 oKOc7KWcJajTN+yM25MAaCAI4uV3LiLCrtTdRfJQloUvYr+Zv3K115LAH3zZS4cHQ6
	 dmeZqiASJe4yM+7ACB7EFVA2LHQGd3jeazZFKhnzaOKCOFSyixRQfNqHsAagqHr/qB
	 OeBWxrHm4C0wGznbTMp/4QixrcngtxmMezA6SUCpSwY3z0ichSR+rhAZkxQhTujod+
	 dtrVl1+6fwt7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F9B980DA2;
	Mon, 26 Oct 2026 09:17:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7E31235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D8A480DA2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4f0E2BWd6jRp for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 09:17:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2CBCF80C75
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::92f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793006232;
 b=HUgLkKZ0w13eChtePD6WekjNcjdXY2FhuyJk+HlNDO4cJCH5x0UOi9b5Mk7d/vf9RyEY
 oVKRlzXkGFuu354AGS2VVlXbFTsWBfihDGviSHTA6ljACz5E8E/B1HaFdYsF1KQncw2bS
 uPBa73gGLWwm2lZrnDPMpHZwAKBCCOCJ/6niCnnVR7VrDmp/BBVz158KP1ZLLVgAO3f1A
 DYYLPNuNvzYA6Eui3ushCTxwKoeNjzr7Xuel6ywEL0X84Bvw43krj034XeOJKbIpmROT2
 l4LZRzOXKye43xP6Kj+EhNkmcgrG58N5ENoulAA6BO9A22cPj/ZYfEOVcYnPR4w0xhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793006232;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=oMDmrVel8gxU+qMrYqZJYH+fdL/K7bjn7/nhlbTI2hQ=;
 b=PDEnJvfX8Od2fitp8iyZErk1i+40pGcpoR+7Uoy7vtaD8rRaLZeAG5nE1dxjf/L2PYGK
 ajLYorXyCZnRaKnsBaN3dUnHLt50bvGn+CmvXXhjxfWB5bd06Jh8IoV0E6ayLw70ruDay
 +LZg5QvOaHaTUAx2yPrpz3ThtDwQPlRpy+gxVqtkj32CCljrI8nk0b14LEDMqhEtpCDyF
 EjY7pxjlcKkWwhfhswFLHAfqyUCj5eMue3bKyTjI77MkxU4zVxFmd7eYBDYlxMxS2yCYt
 31z37uuOyOEj+YnJ2KAbgaS/gVq9wbNe8mxRHUIH6agbz8SQtC1q7ODtvUlvUyp1t0A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sL5v6JI2; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::92f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sL5v6JI2
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CBCF80C75
 for <buildroot@busybox.net>; Mon, 26 Oct 2026 09:17:11 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-988c7371716so977262241.1
 for <buildroot@busybox.net>; Mon, 26 Oct 2026 02:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793006230; cv=none;
 d=google.com; s=arc-20260327;
 b=k1rwXwFiyUuqJntoU+pLjdCSoXqocn0D2m7oEVsHTVMVa+X0ESYzvATLJfYpCeszD3
 NVofD5ATBuW12slq02yIcZKVadU0W+RZ5C0niw+yjsu5g+N8PkUBJkm+UXAVyywXXVtO
 Hd3yMQI/CtAW1IwkN2zSiNS/g/60s0nXInyhLV0gEdOeo+dY8rZg0LfLR16ZKYqe36i4
 zRunVGgPUEcchRvP10P5se/k4zaDsFjTm0VzuaZqdlXkqLUBBi7vb0P0eROQ3ASeHq8T
 XPZtS7BcmhhjPjUpf+q1BhGPS3m2e2ASzCYpCQ9xFMoKTAFjVq174fNA1re3x6jgRTAj
 z3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oMDmrVel8gxU+qMrYqZJYH+fdL/K7bjn7/nhlbTI2hQ=;
 fh=J6ywOFdhM/uDHB/p6B23q5fRdRpCJ7kirBPCytknF+s=;
 b=gBl9X5zv7YgB1YsJ0X6fwTvgNdDFosc7ZvqHKKxAtGTy9nIrhonT52SZM0FdTrQL+N
 1YuWbhooCMpC+Id55LdTQ93Y3N9cElbT+LuHPdkJM8aYftqzpa3aoV4c63Q+CbkQGaTw
 4r4wGcPbL2A6nacXmRnTSfbxDBDsCVqCGQD7cfu66bISGICs3rx2vJq9rTqnzqzArghd
 RNJYMMnv+9XS2mCTe9ukkLbW2U0pvpJHwjiCPekpubNbSMNm7oFTYZJOtpMIoNPgAimU
 t+rZqDUbAWefsT9wqIetboJnDH+v40qdScl1E85W/L84lNMCIw3CPIQD7Miws02iLADd
 3dog==; darn=busybox.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793006230; x=1793611030; darn=busybox.net;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=oMDmrVel8gxU+qMrYqZJYH+fdL/K7bjn7/nhlbTI2hQ=;
 b=sL5v6JI2Ol/NBX2GemmfFcT35qgeYp/Bi9OXTIopZ1XwRpK8VTLVy9phlDrXNs5vNC
 kpiBdooL4rTzRZncitliDGSsbazBhYweKsGNc0kn1i8xEYmcxEapxANzpoRhka7ra8za
 TZfrrmctRF0bTfoao9Rd0ZrMa2xSkxp5AMb/kjmgm5ZdpWqDv8db1gCn4j9ZJ5orwTvS
 JzuFZNNOw3qpMO3mxOvsRzVAWm3UIGsN8VNvZdj4hObNuq0W3MhLLqrsy1Ag2NrTfF/A
 E7a2AZsgeXkSBPhmxf4fChTGmk0AI0cnoD66Y6P42UfUlab0ftxTqHMOEtqWNncv9HZ2
 5IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793006230; x=1793611030;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oMDmrVel8gxU+qMrYqZJYH+fdL/K7bjn7/nhlbTI2hQ=;
 b=kPuc9UwWplmD0EQe09hTHpapoiLsfrsDs+yBs61vq/WMxkVb4I5j5cGH1xi5FT/8Tq
 40XrEMsiXbWkyB3mfz67VZmBbzt7Hw7+yv3PNqjGTSejBUt50M/rskBifZndVB35JaaC
 FilS4yScWPw5BkvXyNCyY0O3JSbluVfooT/TaM3Rpb67JIjWQlxKLZn+zIWEX1RWKwLf
 LGssHviKsvF3Ub6YsZMexUPgEaryYxDpMXgak7GraefU6CGJr1X9x9vUQOQgiundMdS0
 4I5psafFtApBWERsiMCG/X6uFFOgtuUMUs7/NMKfgj6YVYus4YE+EX5ekmB61f+XEi2b
 xaRw==
X-Gm-Message-State: AFq9FYK7aa0XoihioNubAHH2UKvGbyt9vpnXsRUIH32TtM9osGXjseSs
 toWsYl7tmnfDjzviWcvhAlARumv6/SrKbETHl6w1K+hv/upVc0k13f0ZjzkF2JN8VLooCLmCVHZ
 TOsPyVKz/fc6MImIA8gtCL2GcgatnJ0w=
X-Gm-Gg: AYBFou3Q3hZCgFUlfycMeYfwIKG3c64oy+pDog+W19YL3jRSgMwkhFejjWAlhP1IPc6
 LcfwAinZHL2lrZfpYNa7fDSkL+cjJzYGMIEUpy25KcvDnhzHmIWgOKGw74RhykdXaAkK5boOx0r
 Jr1M/9PCueQv23RrjWaEME9fkyPLiAmamf/ZkzMBvVxirodu5Ait8X49q/HzqBzTtmOqTB2fpvl
 1ShYSn1eEWfii/YHah+UKpg64QSQIZeQ0JzWG/02V5SOZel2s0wsq449DmhSu7iumW5TQXD6HFd
 5tqhJTLWrihGw9Bk6kFx8zyogVbh+r4WLu5pIlgPtUv9Xo2QnKjjbFq+O2T1e2+go7Xg+WIW43P
 lFgBRPJ5K/vYZLIS3WU8nvQ5IhRrdXFoofaWPVPzoLP9FwKFTzbrKakVHucv772AHLkAHvhTPW+
 +vSLicR9JqeUJjsQYEsQ==
X-Received: by 2002:a05:6122:c88:b0:5ea:d32a:16de with SMTP id
 71dfb90a1353d-5ec2328e3d4mr1851702e0c.15.1793006230421; Mon, 26 Oct 2026
 02:17:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025183349.195408-1-francois.perrad.86@gmail.com>
 <at5nUx-cQuwtBiq6@windsurf>
In-Reply-To: <at5nUx-cQuwtBiq6@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Mon, 26 Oct 2026 10:16:59 +0100
X-Gm-Features: AclHuK9zwlr76I_KUHUUnjlQsLR_fBDQf2kbY6SyZeDdSyaFqF7Fa5WQNYZJDWQ
Message-ID: <CAMTop883HZzPYAPEQeo_jCYNCbKXG=ka6_P+H2XBJww0kXzwpw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Subject: Re: [Buildroot] [PATCH] package/luv: bump to version 1.53.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8788597054410945635=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8788597054410945635==
Content-Type: multipart/alternative; boundary="00000000000071c551065ebacb6b"

--00000000000071c551065ebacb6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 25 oct. 2026 =C3=A0 21:32, Thomas Petazzoni <thomas.petazzoni@bootl=
in.com>
a =C3=A9crit :

> On Sun, Oct 25, 2026 at 07:33:49PM +0100, Francois Perrad wrote:
>
> > diff --git a/package/luv/luv.hash b/package/luv/luv.hash
> > index 779046e65..2e31e4d65 100644
> > --- a/package/luv/luv.hash
> > +++ b/package/luv/luv.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
> 3e6eb820a3aee034f85f9cce9bd77b5d42f34d128a1ccec877adf28c913577c7
> luv-1.52.1-0.tar.gz
> > +sha256
> ce6260efb974647e7687f54a54a6810bc5eb81cdc14b45b69868a5ea048f96e1
> luv-1.53.0-0.tar.gz
> >  sha256
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30
> LICENSE.txt
>
> Somehow, I don't see the same hash:
>
> >>> luv 1.53.0-0 Downloading
> wget -nd -t 3 --connect-timeout=3D10 -O
> '/home/thomas/projets/buildroot/output/build/.luv-1.53.0-0.tar.gz.kAkkmY/=
output'
> '
> https://github.com/luvit/luv/releases/download/1.53.0-0/luv-1.53.0-0.tar.=
gz'
>
> HTTP response 302  [
> https://github.com/luvit/luv/releases/download/1.53.0-0/luv-1.53.0-0.tar.=
gz
> ]
> Enqueuing
> https://release-assets.githubusercontent.com/github-production-release-as=
set/6127999/7be72ad7-4095-4035-ae4d-d79da22dd34c?sp=3Dr&sv=3D2018-11-09&sr=
=3Db&spr=3Dhttps&se=3D2026-10-25T21%3A22%3A49Z&rscd=3Dattachment%3B+filenam=
e%3Dluv-1.53.0-0.tar.gz&rsct=3Dapplication%2Foctet-stream&skoid=3D96c2d410-=
5711-43a1-aedd-ab1947aa7ab0&sktid=3D398a6654-997b-47e9-b12b-9515b896b4de&sk=
t=3D2026-10-25T20%3A22%3A46Z&ske=3D2026-10-25T21%3A22%3A49Z&sks=3Db&skv=3D2=
018-11-09&sig=3DlotpmmBqnnjLIwii0KXbNOvmNsEsS%2Bm%2BM0cwAgXm1Dk%3D&jwt=3Dey=
J0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVs=
ZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc=
5Mjk2MDMyMSwibmJmIjoxNzkyOTYwMDIxLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi=
5ibG9iLmNvcmUSaving
> '/home/thomas/projets/buildroot/output/build/.luv-1.53.0-0.tar.gz.kAkkmY/=
output'
> HTTP response 200  [
> https://release-assets.githubusercontent.com/github-production-release-as=
set/6127999/7be72ad7-4095-4035-ae4d-d79da22dd34c?sp=3Dr&sv=3D2018-11-09&sr=
=3Db&spr=3Dhttps&se=3D2026-10-25T21%3A22%3A49Z&rscd=3Dattachment%3B+filenam=
e%3Dluv-1.53.0-0.tar.gz&rsct=3Dapplication%2Foctet-stream&skoid=3D96c2d410-=
5711-43a1-aedd-ab1947aa7ab0&sktid=3D398a6654-997b-47e9-b12b-9515b896b4de&sk=
t=3D2026-10-25T20%3A22%3A46Z&ske=3D2026-10-25T21%3A22%3A49Z&sks=3Db&skv=3D2=
018-11-09&sig=3DlotpmmBqnnjLIwii0KXbNOvmNsEsS%2Bm%2BM0cwAgXm1Dk%3D&jwt=3Dey=
J0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVs=
ZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc=
5Mjk2MDMyMSwibmJmIjoxNzkyOTYwMDIxLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi=
5ib/home/thomas/projets
> 100%
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>]
>   1.51M    3.92MB/sgz&response-content-type=3Dap[Files: 1  Bytes: 1.51M
> [1.19MB/s] Redirects: 1  Todo: 0  Errors: 0                              =
  ]
> ERROR: while checking hashes from package/luv/luv.hash
> ERROR: luv-1.53.0-0.tar.gz has wrong sha256 hash:
> ERROR: expected:
> ce6260efb974647e7687f54a54a6810bc5eb81cdc14b45b69868a5ea048f96e1
> ERROR: got     :
> fccabc7bb37fcc3b84ab258a19a862c55f67abc2059af0a744a1ae64119dfc6c
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> wget -nd -t 3 --connect-timeout=3D10 -O '/home/thomas/projets/build
>
> Any idea?
>
>
my fault sorry, I'll send a v2.

Fran=C3=A7ois


> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000071c551065ebacb6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 25=
 oct. 2026 =C3=A0=C2=A021:32, Thomas Petazzoni &lt;<a href=3D"mailto:thomas=
.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, =
Oct 25, 2026 at 07:33:49PM +0100, Francois Perrad wrote:<br>
<br>
&gt; diff --git a/package/luv/luv.hash b/package/luv/luv.hash<br>
&gt; index 779046e65..2e31e4d65 100644<br>
&gt; --- a/package/luv/luv.hash<br>
&gt; +++ b/package/luv/luv.hash<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # Locally calculated<br>
&gt; -sha256=C2=A0 3e6eb820a3aee034f85f9cce9bd77b5d42f34d128a1ccec877adf28c=
913577c7=C2=A0 luv-1.52.1-0.tar.gz<br>
&gt; +sha256=C2=A0 ce6260efb974647e7687f54a54a6810bc5eb81cdc14b45b69868a5ea=
048f96e1=C2=A0 luv-1.53.0-0.tar.gz<br>
&gt;=C2=A0 sha256=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb0=
03417bc523d30=C2=A0 LICENSE.txt<br>
<br>
Somehow, I don&#39;t see the same hash:<br>
<br>
&gt;&gt;&gt; luv 1.53.0-0 Downloading<br>
wget -nd -t 3 --connect-timeout=3D10 -O &#39;/home/thomas/projets/buildroot=
/output/build/.luv-1.53.0-0.tar.gz.kAkkmY/output&#39; &#39;<a href=3D"https=
://github.com/luvit/luv/releases/download/1.53.0-0/luv-1.53.0-0.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/luvit/luv/releases/dow=
nload/1.53.0-0/luv-1.53.0-0.tar.gz</a>&#39; <br>
HTTP response 302=C2=A0 [<a href=3D"https://github.com/luvit/luv/releases/d=
ownload/1.53.0-0/luv-1.53.0-0.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/luvit/luv/releases/download/1.53.0-0/luv-1.53.0-0.tar.gz=
</a>]<br>
Enqueuing <a href=3D"https://release-assets.githubusercontent.com/github-pr=
oduction-release-asset/6127999/7be72ad7-4095-4035-ae4d-d79da22dd34c?sp=3Dr&=
amp;sv=3D2018-11-09&amp;sr=3Db&amp;spr=3Dhttps&amp;se=3D2026-10-25T21%3A22%=
3A49Z&amp;rscd=3Dattachment%3B+filename%3Dluv-1.53.0-0.tar.gz&amp;rsct=3Dap=
plication%2Foctet-stream&amp;skoid=3D96c2d410-5711-43a1-aedd-ab1947aa7ab0&a=
mp;sktid=3D398a6654-997b-47e9-b12b-9515b896b4de&amp;skt=3D2026-10-25T20%3A2=
2%3A46Z&amp;ske=3D2026-10-25T21%3A22%3A49Z&amp;sks=3Db&amp;skv=3D2018-11-09=
&amp;sig=3DlotpmmBqnnjLIwii0KXbNOvmNsEsS%2Bm%2BM0cwAgXm1Dk%3D&amp;jwt=3DeyJ=
0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZ=
WFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc5=
Mjk2MDMyMSwibmJmIjoxNzkyOTYwMDIxLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5=
ibG9iLmNvcmUSaving" rel=3D"noreferrer" target=3D"_blank">https://release-as=
sets.githubusercontent.com/github-production-release-asset/6127999/7be72ad7=
-4095-4035-ae4d-d79da22dd34c?sp=3Dr&amp;sv=3D2018-11-09&amp;sr=3Db&amp;spr=
=3Dhttps&amp;se=3D2026-10-25T21%3A22%3A49Z&amp;rscd=3Dattachment%3B+filenam=
e%3Dluv-1.53.0-0.tar.gz&amp;rsct=3Dapplication%2Foctet-stream&amp;skoid=3D9=
6c2d410-5711-43a1-aedd-ab1947aa7ab0&amp;sktid=3D398a6654-997b-47e9-b12b-951=
5b896b4de&amp;skt=3D2026-10-25T20%3A22%3A46Z&amp;ske=3D2026-10-25T21%3A22%3=
A49Z&amp;sks=3Db&amp;skv=3D2018-11-09&amp;sig=3DlotpmmBqnnjLIwii0KXbNOvmNsE=
sS%2Bm%2BM0cwAgXm1Dk%3D&amp;jwt=3DeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJp=
c3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQ=
uY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc5Mjk2MDMyMSwibmJmIjoxNzkyOTYwMDIxLCJwYX=
RoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUSaving</a> &#39;/home/thom=
as/projets/buildroot/output/build/.luv-1.53.0-0.tar.gz.kAkkmY/output&#39;<b=
r>
HTTP response 200=C2=A0 [<a href=3D"https://release-assets.githubuserconten=
t.com/github-production-release-asset/6127999/7be72ad7-4095-4035-ae4d-d79da=
22dd34c?sp=3Dr&amp;sv=3D2018-11-09&amp;sr=3Db&amp;spr=3Dhttps&amp;se=3D2026=
-10-25T21%3A22%3A49Z&amp;rscd=3Dattachment%3B+filename%3Dluv-1.53.0-0.tar.g=
z&amp;rsct=3Dapplication%2Foctet-stream&amp;skoid=3D96c2d410-5711-43a1-aedd=
-ab1947aa7ab0&amp;sktid=3D398a6654-997b-47e9-b12b-9515b896b4de&amp;skt=3D20=
26-10-25T20%3A22%3A46Z&amp;ske=3D2026-10-25T21%3A22%3A49Z&amp;sks=3Db&amp;s=
kv=3D2018-11-09&amp;sig=3DlotpmmBqnnjLIwii0KXbNOvmNsEsS%2Bm%2BM0cwAgXm1Dk%3=
D&amp;jwt=3DeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIi=
wiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5M=
SIsImV4cCI6MTc5Mjk2MDMyMSwibmJmIjoxNzkyOTYwMDIxLCJwYXRoIjoicmVsZWFzZWFzc2V0=
cHJvZHVjdGlvbi5ib/home/thomas/projets" rel=3D"noreferrer" target=3D"_blank"=
>https://release-assets.githubusercontent.com/github-production-release-ass=
et/6127999/7be72ad7-4095-4035-ae4d-d79da22dd34c?sp=3Dr&amp;sv=3D2018-11-09&=
amp;sr=3Db&amp;spr=3Dhttps&amp;se=3D2026-10-25T21%3A22%3A49Z&amp;rscd=3Datt=
achment%3B+filename%3Dluv-1.53.0-0.tar.gz&amp;rsct=3Dapplication%2Foctet-st=
ream&amp;skoid=3D96c2d410-5711-43a1-aedd-ab1947aa7ab0&amp;sktid=3D398a6654-=
997b-47e9-b12b-9515b896b4de&amp;skt=3D2026-10-25T20%3A22%3A46Z&amp;ske=3D20=
26-10-25T21%3A22%3A49Z&amp;sks=3Db&amp;skv=3D2018-11-09&amp;sig=3DlotpmmBqn=
njLIwii0KXbNOvmNsEsS%2Bm%2BM0cwAgXm1Dk%3D&amp;jwt=3DeyJ0eXAiOiJKV1QiLCJhbGc=
iOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0a=
HVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc5Mjk2MDMyMSwibmJmIjox=
NzkyOTYwMDIxLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ib/home/thomas/proje=
ts</a> 100% [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D&gt;]=C2=A0 =C2=A0 1.51M=C2=A0 =C2=A0 3.92MB/sgz&amp;response-content=
-type=3Dap[Files: 1=C2=A0 Bytes: 1.51M [1.19MB/s] Redirects: 1=C2=A0 Todo: =
0=C2=A0 Errors: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
ERROR: while checking hashes from package/luv/luv.hash<br>
ERROR: luv-1.53.0-0.tar.gz has wrong sha256 hash:<br>
ERROR: expected: ce6260efb974647e7687f54a54a6810bc5eb81cdc14b45b69868a5ea04=
8f96e1<br>
ERROR: got=C2=A0 =C2=A0 =C2=A0: fccabc7bb37fcc3b84ab258a19a862c55f67abc2059=
af0a744a1ae64119dfc6c<br>
ERROR: Incomplete download, or man-in-the-middle (MITM) attack<br>
wget -nd -t 3 --connect-timeout=3D10 -O &#39;/home/thomas/projets/build<br>
<br>
Any idea?<br>
<br></blockquote><div><br></div><div>my fault sorry, I&#39;ll send a v2.<br=
><br></div><div>Fran=C3=A7ois</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000071c551065ebacb6b--

--===============8788597054410945635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8788597054410945635==--
