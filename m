Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2262C25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 10:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A140822ED;
	Sat, 18 May 2024 10:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjZHCq9SGokE; Sat, 18 May 2024 10:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E9682348
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E9682348;
	Sat, 18 May 2024 10:32:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 112EB1BF3A9
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 10:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2094404C4
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 10:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBcXO8bRSGXj for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 10:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=pt.skyin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4723400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4723400BB
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4723400BB
 for <buildroot@buildroot.org>; Sat, 18 May 2024 10:32:09 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so2022161a12.1
 for <buildroot@buildroot.org>; Sat, 18 May 2024 03:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716028327; x=1716633127;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8VK2t36ouvpzSz3HnVKchgXyvAww6TDlkRIraq9FNq8=;
 b=RLSALy6ih28UiU+cYRDmEmPYSU5EV/u0uSm9wCXzG4rUi0v0/OmqHAfxbuhVsXD0vD
 d0grN/qVgYAk6Ork9flW8I6Mf7cHy3LQEYFdqhw1v48p1TV6q/D5RIe/vmiUszPS1kpE
 /FDegQ4Woj+r8PnQ1RaymQZ9ZHIWrFnlvfgB0y4EaUKW7Cgaxgxhbk7h0cPYmVVsGNEH
 KUab+olzr3hRxqANpEVHZmiA/8SZehubnjFOtd4C3SFOcK9hIBZpO8TnkiQdqpDjfMPX
 hdyN6lI5o41WzYeZRaVK8Yva/4EIE1RqXZgMIsZVitoFrD8yi5Ns4Erh3+6thUvxYoZX
 FwaA==
X-Gm-Message-State: AOJu0YzbXn+mU7z/XWJ9gVlwZOMpO2h1pNMe/8tfKUxpOJaZnpPyCoP7
 u/QFB/mjQpcvMh7IdL4Xx8IulR8Gmi8YMxSRbF5Rfsh0aOt/fBdysr65ARhazdne7GFx6hEiGUN
 ZYI7q7eywFPs/Pzf4gNbKMcfEfq4rxA==
X-Google-Smtp-Source: AGHT+IE9h18rG+ycTbdiCeOrdXcBubY+ysAwEwdlRGKGl15dnPD/i84tQhpsnxwU0Z5j52j/Nlvl/cm9qm6nW50xsZw=
X-Received: by 2002:a50:cd17:0:b0:56e:22bd:7e90 with SMTP id
 4fb4d7f45d1cf-5734d6dec0cmr16015601a12.40.1716028327395; Sat, 18 May 2024
 03:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAEu2X4E5UCYXo7D1tB6P=rTTOZywQ43Pm7dg1d0=xpn6TAtbJg@mail.gmail.com>
In-Reply-To: <CAEu2X4E5UCYXo7D1tB6P=rTTOZywQ43Pm7dg1d0=xpn6TAtbJg@mail.gmail.com>
From: Sam Wang <pt.skyin@gmail.com>
Date: Sat, 18 May 2024 18:31:58 +0800
Message-ID: <CAEu2X4H2cMERvvwd2dR-3v1VaM+WXgxVgpMVtuP4Zi1uhZ4iDw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716028327; x=1716633127; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8VK2t36ouvpzSz3HnVKchgXyvAww6TDlkRIraq9FNq8=;
 b=ZTP3aMOrQiAgCaKws4ENKbCDjqM7GwW0DnxSANqH2y9YBWHkWz2r+T+5nKyAegF4mW
 0K1fLp+Chpml9lV9tRYmjruVzibpgfwHzTMsexeNHHg8KEQTdZhEAEbYYlRXNPVMXXXK
 2xy9p8sZzcfXaFRSMqSk3GPnA2dOIaR86nOjtAX+Pv3srLzKrDiHa0FLSJXcELEqqj+l
 pCbH5CVWNginExj+t9t/wYEfKxDyfEDrBTdAo5wGmWEemSVYZCPkkIQy/ABjDOh1G2v+
 o4a2oULBm84+TcWwnKBtS3xLy5UmyENdbCcMFv2i/olnPwJckWRmr4U/49ex4TjandZd
 leIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZTP3aMOr
Subject: [Buildroot] Fwd: BR2_MAKE makes "Rebuilding kernel with initramfs"
 use -j1
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
Content-Type: multipart/mixed; boundary="===============3780763160718304330=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3780763160718304330==
Content-Type: multipart/alternative; boundary="000000000000e10da80618b7fa9d"

--000000000000e10da80618b7fa9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear buildroot developer,

I'm using buildroot 2024.02.1 with top-level parallel build, and found in
the last step of my build - "Rebuilding kernel with initramfs" - it throws
the following warning and makes the kernel rebuilding single threaded.

*make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.*

The previous version 2023.02.4 didn't have this issue. And, I found this
commit: linux: use BR2_MAKE =C2=B7 buildroot/buildroot@0b9efc9 =C2=B7 GitHu=
b
<https://github.com/buildroot/buildroot/commit/0b9efc991f8a2c1b6388e4e57564=
1228262eadd1>,
which changes $(MAKE) to $(BR2_MAKE)". I reverted the change in line 645
back to $(MAKE) in my repo, and the warning was gone, and the kernel
rebuild was in multi-thread again.

Wondering if I missed something in the buildroot configuration or this part
of BR2 code needs some revision? Thanks for your help!

Best regards,
Sam

--000000000000e10da80618b7fa9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Dear buildroot developer,<br></div><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><=
br></div><div>I&#39;m using buildroot 2024.02.1 with top-level parallel bui=
ld, and found in the last step of my build - &quot;Rebuilding kernel with i=
nitramfs&quot; - it throws the following warning and makes the kernel rebui=
lding single threaded.=C2=A0</div><div><br></div><div><b>make[1]: warning: =
jobserver unavailable: using -j1.=C2=A0 Add &#39;+&#39; to parent make rule=
.</b><br></div><div><br></div><div>The previous version 2023.02.4 didn&#39;=
t have this issue. And, I found this commit:=C2=A0<a href=3D"https://github=
.com/buildroot/buildroot/commit/0b9efc991f8a2c1b6388e4e575641228262eadd1" t=
arget=3D"_blank">linux: use BR2_MAKE =C2=B7 buildroot/buildroot@0b9efc9 =C2=
=B7 GitHub</a>, which changes $(MAKE) to $(BR2_MAKE)&quot;. I reverted the =
change in line 645 back to $(MAKE) in my repo, and the warning was gone, an=
d the kernel rebuild was in multi-thread again.<br></div><div><br></div><di=
v>Wondering if I missed something in the buildroot configuration or this pa=
rt of BR2 code needs some revision? Thanks for your=C2=A0help!</div><br cle=
ar=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
>Best regards,<div>Sam</div></div></div></div></div></div></div></div></div=
></div>
</div></div>

--000000000000e10da80618b7fa9d--

--===============3780763160718304330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3780763160718304330==--
