Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49542C433EF
	for <buildroot@archiver.kernel.org>; Fri, 20 May 2022 05:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E416409BC;
	Fri, 20 May 2022 05:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIMofuk-k5-j; Fri, 20 May 2022 05:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF8BA402E8;
	Fri, 20 May 2022 05:23:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD981BF860
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 05:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39F4A402E8
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 05:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFukKO52Hv1Q for <buildroot@lists.busybox.net>;
 Fri, 20 May 2022 05:23:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55A634002B
 for <buildroot@buildroot.org>; Fri, 20 May 2022 05:23:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id o22so8451868ljp.8
 for <buildroot@buildroot.org>; Thu, 19 May 2022 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=deoJQoW4/INC50QsH/uAg3lJJoumPSr/xUha+moEicQ=;
 b=INkrgbfrJa938lRx1ANu7An5hmwDhoyZyIEgiyaLZiOXQmS+9y21dlwSqkLXM7KdZG
 HMx5VFjIuAeHg44VOeYyGDasnEUjHPGDBEYCdYvndMCp7E+R3DPJk0aVw5htIEwqxDmy
 mbTyF9Cl1Q3JFQ8hZNd5ZjS4tbk0Ytk77h7I3dNWiGkzIonCr2QvOgRlP42SRh9Ey0iK
 wjq0N7s1WxPfCsuW3CzbhFlkG2Ym0YR+0//wsnV1wDPUUIyusFa+VXzAM+E/45sCs+e8
 mzrmyTB+QfVuQ0vnxPDulHUy6KrTkByyrjk6CjFlupGYzz/tkr+EMLAXXdgoPfhoL1vk
 4vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=deoJQoW4/INC50QsH/uAg3lJJoumPSr/xUha+moEicQ=;
 b=eoRP1F7LxV0zN2LLLcox/0mopBaLLyS3QwhC4dYnRFMrgQrFYGkMuZsJtDYHdzaSEt
 Me7O9mrSSGJF7ub22OEShyuxQMMZbXzK4HXZqHSfRzuFMv0Fk0aL+aFjzr3wXAsEUr8I
 /BBBNgfBYjEg8WcrFOnNemsFGF8SG8kawh0WiLHYCCaKkOeZzOlajvfFT32KgYvZeFUK
 rZVjIEhWu6SxmwhV2TYjza60VjUiG+Jz/GV0teVHRyvjesWX+40L9Y7HbpqJhIs3+pab
 K0D0byQdvWSe99CH2tj09QlEJm8PVmrUJtBT0353MPjpactQ0xuLKsdduwO73d7+uMct
 +hpA==
X-Gm-Message-State: AOAM533AuErNwakXdzP27SGb2yQ37V+gxixRdEowcM83SzFY5gLh9t/R
 2LipfNflD8nGxwjA0aRGzZEw+PH5K4O1SFXUmXYPMcL6DEg=
X-Google-Smtp-Source: ABdhPJwsBSVAzWMwIivpAMbaQI/f4h5XJ3QHttD/qIsR3xgeMkhit3pYP0DQX16LhjiTC6KvNtA4TXweag3c12nW3vE=
X-Received: by 2002:a05:651c:1617:b0:247:fd84:2195 with SMTP id
 f23-20020a05651c161700b00247fd842195mr4652393ljq.356.1653024178793; Thu, 19
 May 2022 22:22:58 -0700 (PDT)
MIME-Version: 1.0
From: "Ugroon} Hackerone" <h1ugroon@gmail.com>
Date: Fri, 20 May 2022 08:22:47 +0300
Message-ID: <CAJiigQmUmhkv+AMuz2eF1kbi=_-VGEAmWTN40aUbvbTqA9+5dQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] How to run an executable file
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
Content-Type: multipart/mixed; boundary="===============5521052063130392533=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5521052063130392533==
Content-Type: multipart/alternative; boundary="000000000000fb70f705df6aae3a"

--000000000000fb70f705df6aae3a
Content-Type: text/plain; charset="UTF-8"

Hi,

I have an executable file and when I try to run it with "chmod +x file" and
"./file" I'm getting command not found: ./file error. So I just want to
learn how to execute this file?

Note: The output of "file file" is Elf x64

--000000000000fb70f705df6aae3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have an executable file and when =
I try to run it with &quot;chmod +x file&quot; and &quot;./file&quot; I&#39=
;m getting command not found: ./file error. So I just want to learn how to =
execute this file?=C2=A0</div><div><br></div><div>Note: The output of &quot=
;file file&quot; is Elf x64</div></div>

--000000000000fb70f705df6aae3a--

--===============5521052063130392533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5521052063130392533==--
