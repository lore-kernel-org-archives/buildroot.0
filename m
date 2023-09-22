Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E5DE6FE52
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 15:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CE7D41983;
	Fri, 22 Sep 2023 15:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE7D41983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sUW2qjIt0HW; Fri, 22 Sep 2023 15:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C23354197F;
	Fri, 22 Sep 2023 15:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C23354197F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA1711BF2B0
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 15:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9449041982
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 15:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9449041982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTN8jCsqc75z for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 15:33:53 +0000 (UTC)
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFEE44197F
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 15:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFEE44197F
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1dcbe9b99e4so390830fac.3
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 08:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695396831; x=1696001631;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eruZxUbzvz/3ja5TnIfUvHWRiR6fHEZwEVmkpF87I38=;
 b=lh+VP71b8Lp8w11lyEpSfUbHN+9LVvdaOapvtfE9bH149cYZWM5DS/EvE2QKFeRMkQ
 9aQZoTv+xgoaP/trmWXJou5f/MdTk382rH9VgjYwe+bVgwYZupypedPJAj52yoiHPjkr
 8T0L3TpyknpFQ1r3BedfOI+eNgK/pSnV9QhvRRm6jWH3VIfFRZVyeie2xNIs2JWLObI4
 rYb4E9rDdljIkkNjIbWkHdHUoz9QqzPfcyrrDvN3B+1G5c6aTaQT2OBf79jSaR3KVy1F
 ZPFa0VYV35q8/s2B1+C3bq3vGULj7AKak+8WmlpqUHB2wvD1Am8TXq9n4PdrMoG8KZ/E
 MP7g==
X-Gm-Message-State: AOJu0YxlcMNcIsHPMxF71x7Cdue9heT2Z4GEAHpkaGH7jmHUTwPSHgXf
 IPympcqHS+vWGbdWjG7gXebARRN1XPrNVMEuWAkbZhYpQfo=
X-Google-Smtp-Source: AGHT+IECGqnoi4lR4Vc3afOiHhGlSxr1l6fsv2TDeGuNvm86sr3PEddYRuYFZF75Zw+kGDHykkQojIbdh5+zTteW2nQ=
X-Received: by 2002:a05:6871:80e:b0:1d5:a3f5:e93 with SMTP id
 q14-20020a056871080e00b001d5a3f50e93mr10018365oap.17.1695396831558; Fri, 22
 Sep 2023 08:33:51 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 22 Sep 2023 17:33:38 +0200
Message-ID: <CADYjeSs6=UDJZ_6NHNFnKwagW01pcXAKSO8k-G1EUwsBjD2bpw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695396831; x=1696001631; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eruZxUbzvz/3ja5TnIfUvHWRiR6fHEZwEVmkpF87I38=;
 b=g5nYY/dz7AWZxoTg+wtdTELWz3wyMstqJH7H7W+OVia9eM2WO/vkj9Q73oBOwI9ds8
 yPChKajzy4R9spqdnHR6p9eHRhkVxmUxsGQuCMD6I1xPR7lKd6MKKjJHAY8yfjykoPDK
 Piwo/k6jTHYubq6U8TmeLIYPLSIzqV2xDFxR2wfJ45ZmjquPqTRBub41AV4SS/42T3Mh
 B/YsoaOm7q3MktaY8PhMzs9fu8LQlojjhXRZl4VSHQDCkDif+oqtcALGsVvjfFZeUpJF
 Z6lZS0YJXxtVusnre/Rx0lQ8uFoasAIhJUXn1AkHqz9op6rJ9gOULa1MAnSKd0Xfc7tP
 6plA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g5nYY/dz
Subject: [Buildroot] How to pass EXTRA_OECMAKE_BUILD in Buildroot package
 definition?
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
Content-Type: multipart/mixed; boundary="===============7404514392884273162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7404514392884273162==
Content-Type: multipart/alternative; boundary="000000000000e601e40605f45513"

--000000000000e601e40605f45513
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to add a Buildroot package where I need to
specify EXTRA_OECMAKE_BUILD. But I couldn't find any relevant variable in
Buildroot for this.
Example will be from
https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41

Can anyone please let me know how to achieve this?

Thanks in advance.

--000000000000e601e40605f45513
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to add a Buildroot pack=
age where I need to specify=C2=A0EXTRA_OECMAKE_BUILD. But I couldn&#39;t=C2=
=A0find any relevant variable in Buildroot for this.</div><div>Example will=
 be from=C2=A0<a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a864ab7=
7de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/t=
ensorflow-lite_2.10.0.bb#L41">https://github.com/nxp-imx/meta-imx/blob/64a8=
64ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-l=
ite/tensorflow-lite_2.10.0.bb#L41</a></div><div><br></div><div>Can anyone p=
lease let me know how to achieve this?</div><div><br></div><div>Thanks in a=
dvance.</div></div>

--000000000000e601e40605f45513--

--===============7404514392884273162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7404514392884273162==--
