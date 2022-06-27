Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34F2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA4860EBD;
	Mon, 27 Jun 2022 21:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FA4860EBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBCdhGy9WFNI; Mon, 27 Jun 2022 21:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2534860E8A;
	Mon, 27 Jun 2022 21:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2534860E8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1587D1BF34B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3CAA60E7D
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3CAA60E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pMt28g9YBjw for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:21:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FAB60E8A
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5FAB60E8A
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:21:06 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id g26so21751641ejb.5
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 14:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nXLJJmGVv8R8tzrkM+zWXdyCztQ46l8qUI1D6s/S0ok=;
 b=FG2WoNA8fKBon9tV3Gcn/5ijuqzxIG12lZssUi8FThBCLhoqA7vyx6xRxnCOHFik97
 DJN67p0puybKvg+sGlrC5KbXNLQStDoT8He4x0qwKX8BYdMRK4Yt3LoVC8uN0kohh68Z
 vyhYZ+7IbUXdW0tlcTCs4HumnVUejD7UUn8ZYO3y3F76qfITqXYcy+M5iMpkoLge8HT3
 lVwPMKI6+FtJFo2LyGU5uXQzg69sp3a33kPGtGpsyA6nbFpOYlmKc79ah8EU0alM7ui5
 f39Nt8DbvF29WqOiYwHnPiWqdaxFFwLRaGo4/8CIxaA7rqvxrzxfzO/8l4tQZbV+uu98
 SUvg==
X-Gm-Message-State: AJIora/hLy8KF2Qgt7+t0HSWntZZZdK9mA4tZ/j25qqT7ususChKyUZh
 xMdikKD3xExf5JrwCVFO+fHD3mFuPUCNbfqaYeOOfuy6hpM=
X-Google-Smtp-Source: AGRyM1tFlbHN0sPd/FCVenCrxm5Bzf5E/fVWZgpmEbmVe3frrltMqDq5RAddqPNmnzyQAHm4DWY2nKsQq9UHhRlDQZg=
X-Received: by 2002:a17:906:7742:b0:708:ad9f:8e88 with SMTP id
 o2-20020a170906774200b00708ad9f8e88mr14564842ejn.735.1656364864423; Mon, 27
 Jun 2022 14:21:04 -0700 (PDT)
MIME-Version: 1.0
From: Peter Scheie <pscheie@gmail.com>
Date: Mon, 27 Jun 2022 16:20:44 -0500
Message-ID: <CADAQQMx03t-P4GBSgC51ZN6+1qMveHJg+U8u70kLh+f1h1PR=g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=nXLJJmGVv8R8tzrkM+zWXdyCztQ46l8qUI1D6s/S0ok=;
 b=PjXoZCWZmEsR+uJ3el8GAqMLooyDvZSFmBRUWa+Gi6cilmi3/2DievXecb4ISpRGfK
 +b5J7Lqzo9oWdUN3cAA964OP8TGXs7lb4Q2NB7MilX6kuPl+xfT8pBOR56LcLLMroGtI
 0TYCZfUTP0cquaqUtaNTPmNQGnO+BqNmnwltARGD80b91XuwrYsPg1ZCRaMc4IIoslt+
 o2PRp++yHM35m4AEqWGHdDPBOp4Jm60fFbVyhflswQWUpH7AemcL+/DUh7/EqBRSeGsB
 faI2drzVcIJbvMr882NYTlI7fciyDzx9XTeONOx/wnyUZ3J7kVt04OPMbQQ/pBlpc9XH
 Mj8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PjXoZCWZ
Subject: [Buildroot] am335x_boneblack dts/b does not support adc
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
Content-Type: multipart/mixed; boundary="===============6170237002368575946=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6170237002368575946==
Content-Type: multipart/alternative; boundary="0000000000005cca9a05e2747f29"

--0000000000005cca9a05e2747f29
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm using BR to create an image for the Beaglebone Black and use libiio's
python binding to talk to the BBB's analog pins.  This does not work out of
the box for two reasons.

The first problem is that the default device tree file generated during
build, am335x-boneblack.dtb, doesn't seem to have support for the BBB's
ADC.  Not sure why.  To fix it, I built a custom dts that just #includes
am335x-boneblack.dts and then adds the ADC code the Beagle Board project
uses for their Debian distro (where the ADC does work), and then placed
that dts into BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.

The second problem is that the iio source from Analog Devices has a bug in
that it uses ctypes' find_library('iio') inside a cdll() call in iio.py to
get the full name of the iio SO library (libiio.so.0).  This fails, with
find_library() returning None.  Folks on #beagle suggested find_library()
should not be used this way and instead 'libiio.so.0' should just be passed
directly to cdll(). I've made a patch that fixes this.

So, I've got a working BR image with ADC, but I'm wondering what the
procedure is for getting my fixes incorporated into BR so that the next
person who wants to use the ADC on the BBB doesn't have to go through the
same hassle.  The libiio problem ultimately should be fixed by the folks at
Analog Devices obviously, and I'll send them a message, but until that
happens having a patch already in BR would save some people a few
difficulties.  I don't know what the ultimate fix is for the device tree
problem.

Thanks.

--0000000000005cca9a05e2747f29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I&#39;m using BR to create an image for=
 the Beaglebone Black and use libiio&#39;s python binding to talk to the BB=
B&#39;s analog pins.=C2=A0 This does not work out of the box for two reason=
s.</div><div><br></div><div>The first problem is that the default device tr=
ee file generated during build, am335x-boneblack.dtb, doesn&#39;t seem to h=
ave support for the BBB&#39;s ADC.=C2=A0 Not sure why.=C2=A0 To fix it, I b=
uilt a custom dts that just #includes am335x-boneblack.dts and=20
then adds the ADC code the Beagle Board project uses for their Debian distr=
o=20
(where the ADC does work), and then placed that dts into BR2_LINUX_KERNEL_C=
USTOM_DTS_PATH.<div><br>The second problem is that the iio source from Anal=
og Devices has a bug in that it uses ctypes&#39; find_library(&#39;iio&#39;=
) inside a cdll() call in iio.py to get the full name of the iio SO library=
 (libiio.so.0).=C2=A0 This fails, with find_library() returning None.=C2=A0=
 Folks on #beagle suggested find_library() should not be used this way and =
instead &#39;libiio.so.0&#39; should just be passed directly to cdll(). I&#=
39;ve made a patch that fixes this.</div><div><br></div><div>So, I&#39;ve g=
ot a working BR image with ADC, but I&#39;m wondering what the procedure is=
 for getting my fixes incorporated into BR so that the next person who want=
s to use the ADC on the BBB doesn&#39;t have to go through the same hassle.=
=C2=A0 The libiio problem ultimately should be fixed by the folks at Analog=
 Devices obviously, and I&#39;ll send them a message, but until that happen=
s having a patch already in BR would save some people a few difficulties.=
=C2=A0 I don&#39;t know what the ultimate fix is for the device tree proble=
m.<br></div><div><br></div><div>Thanks.</div><div><br></div></div></div>

--0000000000005cca9a05e2747f29--

--===============6170237002368575946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6170237002368575946==--
