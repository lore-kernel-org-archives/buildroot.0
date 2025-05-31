Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF72C5B543
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 09:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEF78607D6;
	Sat, 31 May 2025 09:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDW33d84v-Uq; Sat, 31 May 2025 09:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26AE260797
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26AE260797;
	Sat, 31 May 2025 09:42:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A73BA127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D7CB40018
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xUI-rkZHLef for <buildroot@buildroot.org>;
 Sat, 31 May 2025 09:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1042; helo=mail-pj1-x1042.google.com;
 envelope-from=vkmoni18@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C73164010D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C73164010D
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C73164010D
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:42:46 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id
 98e67ed59e1d1-311ef4fb549so2406144a91.2
 for <buildroot@buildroot.org>; Sat, 31 May 2025 02:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748684566; x=1749289366;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ws8A09Nj49TItLq250/0X+owTK1gKEF5FjmEeDwqAis=;
 b=qonY8/GWnTBkURJICd+eYkkaGmc9N8siuxpTXLnlQEck1OK+GNh4uyWZ0ugc0ugTrB
 kGGKsFC3CZzcAfhdATDKeVMWmmud2BCXNoQLoLCZK/pRBpzL5od1u4YVr2ekQjW/LMVt
 KHvQ1RgB8sls/vJDc3hiG+Kq5F8mXUSq4CZ+zYtRP//JjCSy5hnCgkzqBxTX6z85N9KB
 jw/nExT3vV3KQ60oyygtyu5D50yMnvdDe0vLJCIvK74A4NGvuIdrYAGd4I7OipFXNDt5
 0Db5zE7Lg4AFFmNX9sctEfktR3KmUiLUIO5OO1zfDotjllQAt6Oa80BVcNCBbYEoNqIS
 0Yww==
X-Gm-Message-State: AOJu0YwIW4tWdVWcFQXeADrGUPUd/QuBGH9OQRwwJaoxqclRg45mzmi0
 m6UxBDlVrn8caPfYk65qSpQlV3O7QhvEY050eGpjDMuy4Wdw9laariA87uQfjoxdxUG81lP6csz
 WhZA1XNYJLh2dAYyjPFq5POT2HSSsM+YHnjesHc8m9ZTkT/8Vaw==
X-Gm-Gg: ASbGncsmIt/cHbLOGcX4juZYz2wE3swgnkk3mSK30MWnEBXhTd3b/la+YpbDHUtYCJl
 HbJvqA+uUC3FmDhjFocl2oizDYzi+/xN9LRS4cxJ/rldijavFgjRp+tK+Qz9Hp9BtFG+rjScSaH
 RXdMSPpsh5t35idlLXHsOBtTFfA4UAt0FqlqmCQAFnorAczw==
X-Google-Smtp-Source: AGHT+IHtu/TvAFyrvsd5CIzFnwkGiJt8MbOv2F1wp6AHnb7r4HOYDNmvQEi2+JcuTmBqnywSLJXhxT/wmQSCS03e7DU=
X-Received: by 2002:a17:90a:dfd0:b0:311:9c1f:8522 with SMTP id
 98e67ed59e1d1-31241531388mr10429443a91.10.1748684565834; Sat, 31 May 2025
 02:42:45 -0700 (PDT)
MIME-Version: 1.0
From: monish moni <vkmoni18@gmail.com>
Date: Sat, 31 May 2025 15:12:34 +0530
X-Gm-Features: AX0GCFtlv-j7JA-n_Pz9CjPWkAQBP_ieRgarqCGIn50P79b_w5UhZp_8b4WT100
Message-ID: <CACmEUZ=evS-cmamNZEJZpdzwmzoeo2=662kdP5JtDGVtsMPNMQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748684566; x=1749289366; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ws8A09Nj49TItLq250/0X+owTK1gKEF5FjmEeDwqAis=;
 b=DkT0LqtHOgmCwpw3d6azmtWTrxRlLmaRW650ShiavKsiKnlsNfq55+GRufyyyIbSJ6
 j7q7nLqoqLt0pklOMvlSHEJ4F8WCzYulaGQYerElE9BU9FyacnEYGJ6KGxZ0DT+7W6Ul
 2+lqHidXNWej2ucNrb0bRq9EZLJGXvxQ/Z1VRMbYLCJfTVrucAcoMbyAxOlx17M88uFO
 gQdIdLPx6lRyVvok4SSDSAJ2FUxSYLpi4pEvKg0Z8PS0KJZbc4CnMsx4+vd521tuh5Xl
 zhpO/bCKAANzYfP3PrlIF0kup2sxgPsbUV5RJ52T/fTwWz73ogI6+0b2LBmXmTH6Yu3O
 LVRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DkT0LqtH
Subject: Re: [Buildroot] [PATCH v3 00/12] Bump Qt6 to 6.9.0,
 add and fix packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1981305903670219383=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1981305903670219383==
Content-Type: multipart/alternative; boundary="0000000000005ef28c06366b5a12"

--0000000000005ef28c06366b5a12
Content-Type: text/plain; charset="UTF-8"

Hi Thomas and Roy,

Thanks for the insightful discussion on the Qt6 version bump and related
fixes.

Just wanted to suggest a possible way to improve the patch series structure
and clarity:

- If the fixes apply to both the current Qt6 version (e.g., 6.8.1 or 6.8.2)
**and** 6.9.0, consider **splitting the series into two logical parts**:
  1. **Fixes for existing Qt6 version** in Buildroot
  2. **Version bump + new packages** (qt6speech, qt6sensors, etc.)

This approach ensures:
- Fixes get applied faster, even if the version bump takes more review time.
- Reviewers can better isolate regressions or improvements between versions.

Optionally, in the commit messages, it might help to explicitly say:
> "Tested with Qt 6.8.1 and 6.9.0"
or
> "Applies to current Buildroot Qt6 version as well"

This helps clarify applicability and avoids ambiguity.

Thanks again for the work! Qt6 support is getting stronger with each
iteration.

Best regards,
Monish Kumar
https://github.com/VK-Monish
vkmoni18@gmail.com

--0000000000005ef28c06366b5a12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas and Roy,<br><br>Thanks for the insightful discus=
sion on the Qt6 version bump and related fixes.<br><br>Just wanted to sugge=
st a possible way to improve the patch series structure and clarity:<br><br=
>- If the fixes apply to both the current Qt6 version (e.g., 6.8.1 or 6.8.2=
) **and** 6.9.0, consider **splitting the series into two logical parts**:<=
br>=C2=A0 1. **Fixes for existing Qt6 version** in Buildroot<br>=C2=A0 2. *=
*Version bump + new packages** (qt6speech, qt6sensors, etc.)<br><br>This ap=
proach ensures:<br>- Fixes get applied faster, even if the version bump tak=
es more review time.<br>- Reviewers can better isolate regressions or impro=
vements between versions.<br><br>Optionally, in the commit messages, it mig=
ht help to explicitly say:<br>&gt; &quot;Tested with Qt 6.8.1 and 6.9.0&quo=
t; =C2=A0<br>or =C2=A0<br>&gt; &quot;Applies to current Buildroot Qt6 versi=
on as well&quot;<br><br>This helps clarify applicability and avoids ambigui=
ty.<br><br>Thanks again for the work! Qt6 support is getting stronger with =
each iteration.<br><br>Best regards, =C2=A0<br>Monish Kumar =C2=A0<br><a hr=
ef=3D"https://github.com/VK-Monish">https://github.com/VK-Monish</a> =C2=A0=
<br><a href=3D"mailto:vkmoni18@gmail.com">vkmoni18@gmail.com</a><br></div>

--0000000000005ef28c06366b5a12--

--===============1981305903670219383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1981305903670219383==--
