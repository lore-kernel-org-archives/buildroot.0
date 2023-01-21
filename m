Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D38C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 14:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4466A829F2;
	Sat, 21 Jan 2023 14:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4466A829F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-vjqOEKE0cf; Sat, 21 Jan 2023 14:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649C58232F;
	Sat, 21 Jan 2023 14:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 649C58232F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A8781BF31D
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 14:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26DC440523
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 14:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26DC440523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XPWSVVilU41 for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 14:42:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8FDC405C6
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8FDC405C6
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 14:42:37 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id d62so10036352ybh.8
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 06:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5R8G+IckC9FGyt2bc12WZRDJ5qHvwVRH8irzUNA9EfQ=;
 b=fCA9ywhATxSrLieAjOzxLAg6B2z099uHvv3+WVB0kTWohrhmZiAxHcE6o4obDAH487
 2iEAifgRKG9tkGjqh0eYWCh/feZM/FNA4EJlnv5ETk5VFc2OznMLtSVMYYWVfbYRmNfT
 xfS6N2fil4IpIHl2B9rlVU1So7c12iOgcG3lD1WTrSLjUGr55FYHOYIVAq5ZGD45u7Rk
 SUt0JOOeUpuWHZfXyHnsQbMzUPZu52X5sHTr5waVXO2Ykhs4mvs03hebhjF4qhtsOJNU
 g0DYq9Z2+7y2TG95YUi+JTgxcY14ChT1M6pdebw75+1u5lZdEYnLlaZYAxz/laWyV1q4
 240g==
X-Gm-Message-State: AFqh2kqFvsEHIzbNvWiqGwpDYqUgsyOYvH2MXz/0n0A69yhfYtv8ePdV
 BkXzJJAsXmfayNXxHE1tmxqzu19Z1YyUbCna/96HQzIdhydAXQwF
X-Google-Smtp-Source: AMrXdXt0pchTg8j7jSuMoNaCWWWa6p7zLJ89Y3gkWpufFB2bovNzDorjcbW3EaV3+XDlGdzAGhO5RtNox6+0Rp3H30k=
X-Received: by 2002:a25:4c8:0:b0:800:20c3:f9e5 with SMTP id
 191-20020a2504c8000000b0080020c3f9e5mr819115ybe.26.1674312156516; Sat, 21 Jan
 2023 06:42:36 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 21 Jan 2023 20:12:25 +0530
Message-ID: <CANtE+cKcemOj_DTSOZ_TzuThSrXBwah38WJYM-AVH1nGTJikDw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cradlewise-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5R8G+IckC9FGyt2bc12WZRDJ5qHvwVRH8irzUNA9EfQ=;
 b=TQ9O0O+WlrQ1MTAILANFQw+AcIZzGfeVJmT9CUR9+7WKUnI7wdpIyR+ZG6AMHftR2c
 b3iTxNXnlO19BsNFQaJE31ExoF+IFn88VeJUw4TGrREQNG6ycHKB+INYQ2zP6h0X9dA1
 O6lIugzsHGoGtqCC2Umq4+D/iXMDSW58U0zy1mOEE/5J4TxxCsIJKPHHe8ZZB2JpAv60
 dj+DplDnBJwRaT/D4tOuqiieear4YGKZnw4iBv1U4Er0LDbf3bRMkmf53zZM8lk6jgEZ
 hGLTicOGLsUDKHxonfdXTsVzOIsKywvuOKchfvY5yWUEkKRa/VFpDJjsjv/aqm11ovRG
 MH4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=cradlewise-com.20210112.gappssmtp.com
 header.i=@cradlewise-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=TQ9O0O+W
Subject: [Buildroot] Not able to build python-numpy 1.23.5 on buildroot
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
From: Prasad Sankaran via buildroot <buildroot@buildroot.org>
Reply-To: Prasad Sankaran <prasad@cradlewise.com>
Cc: Archit Taneja <archit@cradlewise.com>
Content-Type: multipart/mixed; boundary="===============6914382104180226020=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6914382104180226020==
Content-Type: multipart/alternative; boundary="000000000000552d1b05f2c72d2d"

--000000000000552d1b05f2c72d2d
Content-Type: text/plain; charset="UTF-8"

Hi

The following errors are reported while generating numpy/core/_
multiarray_umath.cpython-38-aarch64-linux-gnu.so using
aarch64-buildroot-linux-gnu-gcc.
Is there a way to avoid including AVX512 .s files from the compilation?

numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:19: Error:
unknown mnemonic pushq' -- pushq %rbp'
numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:21: Error:
unknown mnemonic movq' -- movq %rsp,%rbp'
numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:24: Error:
unknown mnemonic andq' -- andq $-64,%rsp'
numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:25: Error:
unknown mnemonic subq' -- subq $192,%rsp'
numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:26: Error:
unknown mnemonic vmovups' -- vmovups __svml_dacos_data_internal(%rip),%zmm7'
numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:27: Error:
unknown mnemonic vmovups' -- vmovups
64+__svml_dacos_data_internal(%rip),%zmm8'
numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:30: Error:
unknown mnemonic vmovups' -- vmovups
128+__svml_dacos_data_internal(%rip),%zmm11'
.......

--000000000000552d1b05f2c72d2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><p dir=3D"auto" style=3D"box-sizing:bord=
er-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-a=
pple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,H=
elvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoj=
i&quot;;font-size:14px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial">The following errors are reported while generating numpy/=
core/_<a href=3D"http://multiarray_umath.cpython-38-aarch64-linux-gnu.so" t=
arget=3D"_blank">multiarray_umath.cpython-38-aarch64-linux-gnu.so</a> using=
 aarch64-buildroot-linux-gnu-gcc.<br style=3D"box-sizing:border-box">Is the=
re a way to avoid including AVX512 .s files from the compilation?</p><p dir=
=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;=
color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Sego=
e UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Col=
or Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial">numpy/core/src/umath/sv=
ml/linux/avx512/svml_z0_acos_d_la.s:19: Error: unknown mnemonic<span>=C2=A0=
</span><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono=
-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,mon=
ospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;white-space:break-sp=
aces;border-radius:6px">pushq&#39; -- </code>pushq %rbp&#39;<br style=3D"bo=
x-sizing:border-box">numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_=
la.s:21: Error: unknown mnemonic<span>=C2=A0</span><code style=3D"box-sizin=
g:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Me=
nlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding=
:0.2em 0.4em;margin:0px;white-space:break-spaces;border-radius:6px">movq&#3=
9; -- </code>movq %rsp,%rbp&#39;<br style=3D"box-sizing:border-box">numpy/c=
ore/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:24: Error: unknown mnem=
onic<span>=C2=A0</span><code style=3D"box-sizing:border-box;font-family:ui-=
monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberatio=
n Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;whit=
e-space:break-spaces;border-radius:6px">andq&#39; -- </code>andq $-64,%rsp&=
#39;<br style=3D"box-sizing:border-box">numpy/core/src/umath/svml/linux/avx=
512/svml_z0_acos_d_la.s:25: Error: unknown mnemonic<span>=C2=A0</span><code=
 style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&qu=
ot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-=
size:11.9px;padding:0.2em 0.4em;margin:0px;white-space:break-spaces;border-=
radius:6px">subq&#39; -- </code>subq $192,%rsp&#39;<br style=3D"box-sizing:=
border-box">numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:26: =
Error: unknown mnemonic<span>=C2=A0</span><code style=3D"box-sizing:border-=
box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Conso=
las,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.=
4em;margin:0px;white-space:break-spaces;border-radius:6px">vmovups&#39; -- =
</code>vmovups __svml_dacos_data_internal(%rip),%zmm7&#39;<br style=3D"box-=
sizing:border-box">numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la=
.s:27: Error: unknown mnemonic<span>=C2=A0</span><code style=3D"box-sizing:=
border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menl=
o,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0=
.2em 0.4em;margin:0px;white-space:break-spaces;border-radius:6px">vmovups&#=
39; -- </code>vmovups 64+__svml_dacos_data_internal(%rip),%zmm8&#39;<br sty=
le=3D"box-sizing:border-box">numpy/core/src/umath/svml/linux/avx512/svml_z0=
_acos_d_la.s:30: Error: unknown mnemonic<span>=C2=A0</span><code style=3D"b=
ox-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&=
quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px=
;padding:0.2em 0.4em;margin:0px;white-space:break-spaces;border-radius:6px"=
>vmovups&#39; -- </code>vmovups 128+__svml_dacos_data_internal(%rip),%zmm11=
&#39;<br style=3D"box-sizing:border-box">.......</p></div></div>

--000000000000552d1b05f2c72d2d--

--===============6914382104180226020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6914382104180226020==--
