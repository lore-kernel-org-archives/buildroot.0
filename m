Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586C5EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 04:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947E041E19;
	Sat, 22 Jul 2023 04:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 947E041E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O69DmU6s8bYf; Sat, 22 Jul 2023 04:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 868EC41E58;
	Sat, 22 Jul 2023 04:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 868EC41E58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8647A1BF847
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 04:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69BBE40140
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 04:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69BBE40140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3rYhY7BpP5c for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 04:11:46 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9A044000B
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 04:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A044000B
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-55b0e7efb1cso1388154a12.1
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689999106; x=1690603906;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2VR3gk4S3oMob8f27HDb4R4jCObRGTPZOV1HIlgX4jQ=;
 b=HE0J8u0ImQ3gSr14zZ1zcGa1txkMT78huX+jqsb0rHlZ7/Bxr9fTlfztcMGEFEr9ia
 1VDdNMR0n8sD9Q/eEYK2k052qWHAgaeENF+7T207WfquQ37P/aE3ZgAbEQRA42NKrP4C
 oXAOZW+dO40g6MoPYFha0PPhb11HsDbyFmCboXWy+RrA14q4hjS2KcXlGckMvD9/2pIi
 2fLaktiKsECjKy9CRJPOHPz7AS3ub8R0xu7NtCwHtEG2L3XUptLurHP+kBHdsR1DeNai
 kfWaBaXbjzsMMseaUupxPBlr4yPsjcMvqmfgR7m9ZFQdHIgrCIJxakocs/x6sdkKBfx7
 dEvA==
X-Gm-Message-State: ABy/qLZOipVMejJdpCY1rMC4EcrfOsH/hrGCtr7MEoM/px3uoeopHtXY
 ZaB8irToxhFN0li3bL1nqHixKdcvXzOOfSeEwotgG/MpS+f9+Rp3az4=
X-Google-Smtp-Source: APBJJlEROFgBa3TyWwXBbr/c8NKFLnH0dTfr0+L+Dl0nDegYTCkTpvNcR1VrX8jN9zto8kVes5ThIplLbGCa6+G0BvI=
X-Received: by 2002:a17:90a:bb88:b0:262:e801:740f with SMTP id
 v8-20020a17090abb8800b00262e801740fmr3067208pjr.38.1689999105759; Fri, 21 Jul
 2023 21:11:45 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 21 Jul 2023 21:11:35 -0700
Message-ID: <CAEpB38PEOYRLS3x-V3y55H_yDcNqoJOeB72tyX7tNK7pGkixMQ@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689999106; x=1690603906;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2VR3gk4S3oMob8f27HDb4R4jCObRGTPZOV1HIlgX4jQ=;
 b=xjUcS4EaYZX5HPgo18MnFbiJZgZ0kBWdS7K3/mOYPIcXCYliDvFALsJbSZMHD0jmrx
 O/GJHPgAuREeI4Kd3PTO4mNizPXZ8CTG12uXEuEcZubiSpuDlMwy8vY0lfVfO1+lIgjU
 sGxo0+n3dEy8Qzg7tusA/+hDGaVYPySGYNN9h46HA3uTYCnwoxpQHH/AFI3uBwii28eF
 NTLk4K8hgH3yF2YA3K7orF2Gq51P5ae4V5iS3/OFKaIIKaMme3VvXFOGbAHypLsDqx1n
 eNDNswQKsgaDxPxy7j/LdOe3TNJcoipDsyuaUPFGhRSVH3oRob2qEj439yP986ZN1066
 xb3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=xjUcS4Ea
Subject: [Buildroot] Go 1.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============0756182974995059004=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0756182974995059004==
Content-Type: multipart/alternative; boundary="0000000000005eb72c06010b94e5"

--0000000000005eb72c06010b94e5
Content-Type: text/plain; charset="UTF-8"

All,

I'd like to request an update on why we have not yet merged the go 1.20
series.

Many modules now require go 1.20 to work properly and this is already
potentially causing some issues today.

Thanks -
Christian Stewart

--0000000000005eb72c06010b94e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">All,<div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;d=
 like to request an update on why we have not yet merged the go 1.20 series=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Many modules now requi=
re go 1.20 to work properly and this is already potentially causing some is=
sues today.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks -</di=
v><div dir=3D"auto">Christian Stewart</div></div>

--0000000000005eb72c06010b94e5--

--===============0756182974995059004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0756182974995059004==--
