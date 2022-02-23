Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C1A415BF;
	Wed, 23 Feb 2022 17:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5FYhix5wDNZ; Wed, 23 Feb 2022 17:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88DD4415B4;
	Wed, 23 Feb 2022 17:52:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1F581BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF41A828F2
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAR57K9CCYCi for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:52:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05BC2828EF
 for <buildroot@busybox.net>; Wed, 23 Feb 2022 17:52:27 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id c6so49639228ybk.3
 for <buildroot@busybox.net>; Wed, 23 Feb 2022 09:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4nbwVjoC7kFynXs2sysuGJAOWCkTfamBouzB+zDNIMg=;
 b=R1bxYW+RW+OEk2GjrMKgTPFs+KEpwQWWhX/soJRJBN19eOSKa9edozWM9E0WGHHTXS
 OAiZF/dHgp+DldO4O5Pl8DMlYXMKb/Ofh0gw8y47oUTqAuFrnMb4m9g5HXRvO8PU8PrG
 zyGGVTgHmpfKeiApzS0QG65RzOGWg+Kha8TnNEtoH760slpGB3f+BnyfPzC5W0ulia38
 UGWJEF0+PbyRoFLq/IKqFNbGsmmGa9L++dMtKhqs8t2yOD872j10D2G/IsJGoK7gWkPo
 4wW3FSypgPXoHABxjUY+mTM2mOpjOkhjnI0EyRv3VvNHU59H7IM0m5pMTAk8WixL/yVq
 cDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4nbwVjoC7kFynXs2sysuGJAOWCkTfamBouzB+zDNIMg=;
 b=7FxYJwx8vVUvytjXd6UF95OxTq9/Daf4nACVLsBSlEbnvg2iDTks0OtwV7XMi+NHmR
 R1qcxs4ftg9w1tkuub050arMOxfZy7YDhLYhzIDgu8iNR7iwyRNDXLS1h2hXooRIIDZn
 JFwymFjINQTT/GXk1oygqpRTZ7oY0dODwluLqwkzn5/rqvlKtTpclSMMg1UHCDtPmJMm
 4PleJiEevhxfwqaku5NIKEgOCrsOe6UKF7pfConKd6M8BaHsw5N3yiQdEX0Zwc8wNY8R
 gE5wZKGfxuaZezCd8Og4lceuI8QIymnQlDoLj4SJlw8UQI6L0shlD1xOLG9/IYArq0fT
 8AwQ==
X-Gm-Message-State: AOAM532POveo0ibfLc3Jw99mYSMASepNbaqsfL5gMrfZelZyXaA70hAi
 MHI1Bj3w/3LrDZfRQqp+6HSxYbPHp3vbIY+L8/32xyvZ
X-Google-Smtp-Source: ABdhPJwbumn9U4skagyHVK02AozIdV010xh///gt+BKSMoW41vQ8RRnvIxXlDmBWaxFO7nzbgSDTh81walEaBFuzdI0=
X-Received: by 2002:a25:42d6:0:b0:61b:3589:a42 with SMTP id
 p205-20020a2542d6000000b0061b35890a42mr720463yba.31.1645638746954; Wed, 23
 Feb 2022 09:52:26 -0800 (PST)
MIME-Version: 1.0
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Wed, 23 Feb 2022 18:51:59 +0100
Message-ID: <CAJe0E3fs9xSP3jEQ__1_6JWRLYTMMywouQdF6kVKCu=4ykf2Bg@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: [Buildroot] [v3] package/ntpsec: new package
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============8775637347466608915=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8775637347466608915==
Content-Type: multipart/alternative; boundary="000000000000f0dded05d8b32086"

--000000000000f0dded05d8b32086
Content-Type: text/plain; charset="UTF-8"

Hello Peter,

sorry for the delayed test, the usual "busy on too many things".

Today I ran the current patch serie on "zedboard_defconfig": everything
works fine but SYNC is never fully acquired. The estimated "offsets" from
the pool is close to 2^32 (limit?), jitter is large, delay is realistic,
but those values never get averaged out.
What do you think is going on? I don't think it's related to our work but
to the demon itself.
v1_2_1 is fairly old, I hope they provide a new tag soon because a lot of a
work has been accomplished in the meantime.

At work we use our custom fork (for custom encryption), I rebased to master
last week, I have never experienced such behavior.

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>

--000000000000f0dded05d8b32086
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Peter,<div><br></div><div>sorry for the delayed test=
, the usual &quot;busy on too many things&quot;.<br><br>Today I ran the cur=
rent patch serie on &quot;zedboard_defconfig&quot;:=C2=A0everything works f=
ine but SYNC is never fully acquired. The estimated &quot;offsets&quot; fro=
m the pool is close to 2^32 (limit?), jitter is large, delay is realistic, =
but those values never get averaged out.=C2=A0<br>What do you think is goin=
g on? I don&#39;t think it&#39;s related to our work but to the demon itsel=
f.<br>v1_2_1 is fairly old, I hope they provide a new tag soon because a lo=
t of a work has been accomplished in the meantime.<br><br>At work we use ou=
r custom fork (for custom encryption), I rebased to master last week, I hav=
e never experienced such behavior.<br><br clear=3D"all"><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><fo=
nt face=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br></font></div><f=
ont face=3D"arial,helvetica,sans-serif">Software engineer</font><br></div><=
font face=3D"arial,helvetica,sans-serif"></font></div><font face=3D"arial,h=
elvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" ta=
rget=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></font></div></div>=
</div></div></div></div></div></div>

--000000000000f0dded05d8b32086--

--===============8775637347466608915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8775637347466608915==--
