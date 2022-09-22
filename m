Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DBAC32771
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 02:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66FA2405F7;
	Thu, 22 Sep 2022 02:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66FA2405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yP_jIMsr68cL; Thu, 22 Sep 2022 02:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 990FD405E3;
	Thu, 22 Sep 2022 02:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 990FD405E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4A31BF38B
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 02:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 391D4405E3
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 02:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 391D4405E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uj_QBDqKbwZh for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 02:28:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90464405CE
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90464405CE
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 02:28:03 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id m65so8851638vsc.1
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=Mm+o8zyC//sk00k+AqqbOHgFs9qoNrdbySmkSZ4EHRs=;
 b=GHYvEw2wxyCHZ+a0vMNTks4UddxRBZQV9Armu1pOO05Plth9F8l9fdHEJCkQJAvem5
 yYuNjQQg1kMCdkuP+80V+Bi/KQ1woTwAwmliZCfszdi1q+uNC6Tjk0VOlZcp2mnF5Cxn
 PvmjKvCqQVLV9za0SW09L9kdOo0rTyG6FuAXuTF0TMI1/qhrNBQIymD0m2qSE1jUtHI+
 cX+uKdZSweY0+xwSMR7+BTtQ8Xat3q46raIEIEFHM2HhOGHXMzUJi6Y3NVUNBYBzXx0P
 YzxAnZRHJwOMQTqNB13UP6CliMvG7yPzNVbL9mPnEhIkJsUBEy/lgM65FNPtPsnubscH
 TTJQ==
X-Gm-Message-State: ACrzQf23jbDxX2Z5cTS3IVRfe42jUYJezS1EXSZRCB2DOVEZQBbIDhM0
 /+yFoqoIVWwPBtYzQ8OodRnN300lLwTv+gytnno6yYReXnY=
X-Google-Smtp-Source: AMsMyM7F52lat68X7s+MRoeBj6JeyyemeNpr6HXVNNhlsI9KkEpG/cklU0B43+MdI2oSqwljNzoXPIZvnZ3brVEEwB8=
X-Received: by 2002:a05:6102:1511:b0:398:73bd:9b4d with SMTP id
 f17-20020a056102151100b0039873bd9b4dmr443693vsv.33.1663813682138; Wed, 21 Sep
 2022 19:28:02 -0700 (PDT)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Thu, 22 Sep 2022 05:27:50 +0300
Message-ID: <CABRndgxwuvAGu0ydgfuShTvQjjppoUNiBSnP6xgqSKsHjifXTw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=Mm+o8zyC//sk00k+AqqbOHgFs9qoNrdbySmkSZ4EHRs=;
 b=hUjluX5KitZlkjRjNgCpROXoGacnbMXUed3CKwQkdFlxJGMHskc6nWqtDZO7V0A2AT
 gAGA7s162ExpUoXDzwDjE4gGlVgDNjIpVlealxMnC4Bx8zbRLZvVgpjwRGng5OK4DEsb
 ZTqoLpdVGkedqFs14EQCRtW+2wcDMGOncURudt7sme+d5OG66IsDOoVhruv6YpgBmGoQ
 WfCX/owygFn8WCcWW1LhbmkUAz33TBOTOdOEo9no5rUqX9HNfuBheZoiMrV8vnlMNP3K
 riGTHUhcJ2RvBx73QbnuXrCDGlBgrKI1DGhI2dTTQPpRphmLJSxag5slQPURZ6i6i5hJ
 bhfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hUjluX5K
Subject: [Buildroot] buildroot 2022.02.1: apache (httpd) - libgcc_s.so.1
 must be installed for pthread_cancel to work
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
Content-Type: multipart/mixed; boundary="===============1126613274399720960=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1126613274399720960==
Content-Type: multipart/alternative; boundary="0000000000007f121505e93acfe6"

--0000000000007f121505e93acfe6
Content-Type: text/plain; charset="UTF-8"

Hello,

I created a root file system that also contains apache.
During boot, when apache starts running, it logs the following error:

libgcc_s.so.1 must be installed for pthread_cancel to work

This happens before a browser is trying to get data.

When I launched a browser, no data was page was displayed.

I double checked: libgcc_s.so.1 installed.
My application (which runs Ok) uses this library.

Can you please help ?

Thank you,
Zvika

--0000000000007f121505e93acfe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I created a root file system tha=
t also contains apache.=C2=A0</div><div>During boot, when apache starts run=
ning, it logs the following error:</div><div><br></div><div>libgcc_s.so.1 m=
ust be installed for pthread_cancel to work<br></div><div><br></div><div>Th=
is happens before a browser is trying to get data.=C2=A0</div><div><br></di=
v><div>When I launched a browser, no data was page was displayed.</div><div=
><br></div><div>I double=C2=A0checked: libgcc_s.so.1 installed.</div><div>M=
y application (which runs Ok) uses this library.=C2=A0</div><div><br></div>=
<div>Can you please help ?</div><div><br></div><div>Thank you,</div><div>Zv=
ika=C2=A0</div></div>

--0000000000007f121505e93acfe6--

--===============1126613274399720960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1126613274399720960==--
