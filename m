Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BBFC636D3
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 11:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0148360EB8;
	Wed,  1 Feb 2023 11:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0148360EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etRly4b11kC1; Wed,  1 Feb 2023 11:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37D9960B78;
	Wed,  1 Feb 2023 11:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37D9960B78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE681BF3E5
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 11:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0503940982
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 11:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0503940982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQBOOAcXYwGd for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 11:36:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FC45400E7
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FC45400E7
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 11:36:28 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id p133so15437989oig.8
 for <buildroot@buildroot.org>; Wed, 01 Feb 2023 03:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AmyNWj2004YnEMUq/e1mYiIEK9fPGSW5ZgRyXdmyZZg=;
 b=bnPFuc8Vt455ZSyV7Ouij2Bt95zfPM/SRIBbNHqf2c2EeWO1FPNFyG4mgAH64yCDMi
 7EMVWOzZgLnSmndCNVpfJ4PpQdzn3v8iTFLvYngOXa0UiuoLrg7OpJnFiuttxz6w1i87
 +XSvdkItGeI4M/bbf+Jh/06u8mcN1g7xBVuVgbduRy9ER6DOeUF91q+d9qxXn74fpEHo
 UkHyyfPGYCsFvNTGXvNDJDQ0YnNI1ogovgGGDKy928UdwJTaLcIdsBCJOVNY+W5SsO1E
 loRfQglcIxzHgUJPMLqJALGkUGlp3jST4WHkHHACF3XDqPUsfDQGOLE0gqIIU3az6OUf
 DjlQ==
X-Gm-Message-State: AO0yUKW7h/gNF8hGMT4WUS/cev3UvRCF0R/bMJSb3z4eDNRcPujDt3DP
 roh9ozhHCeRx5KpMFgGgDIMzdE0q4nWqjxONz9ZBfBrEt5U=
X-Google-Smtp-Source: AK7set+NTyXpqgV2VPMsrp1FZUT37T3m646D/rf0NPOHAlGJzCsDUDWXXrsEfIGwup/mwkmnD4dyn30YZlVltZox9ZA=
X-Received: by 2002:aca:6548:0:b0:378:51ce:f949 with SMTP id
 j8-20020aca6548000000b0037851cef949mr156009oiw.170.1675251387028; Wed, 01 Feb
 2023 03:36:27 -0800 (PST)
MIME-Version: 1.0
From: Takashi Yasuda <proud4124@gmail.com>
Date: Wed, 1 Feb 2023 19:31:43 +0000
Message-ID: <CALy0T5G0AhS735OSWAiJg_bySv9xUgxqt2nYMDb71s4fOpDsAw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AmyNWj2004YnEMUq/e1mYiIEK9fPGSW5ZgRyXdmyZZg=;
 b=gA5qjJ6ktDOWXzevkHJX/jqbAOdC7EEAULawbxSUBoROI8Fv0i2lCnw4ekCW0b4IXa
 Rusa1rt53rilM63EPV8B8ajFJ1LvP+t6WS1Z0ROeuGr4ij+RBK371KcB9BdGam1scsTA
 t3i3/VJOOZHmvj8/mCacjd+2LszEdbCCROLAB6lewpwCtJYWCUQ3Dp27N2PP8mXKBgXt
 7l033X/khjAGM5kv2jviP1Ww9KGi5WmBUqzAE+OdTPcOH0S1thdHvt9J8DERtYTTL/70
 cxiv1I3Wf7tdisEzrNX7DX+IrwFgVUmxvWrnzIFo+x5beJbFNFcMhD/rd4KlR0xkUzNm
 bykw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gA5qjJ6k
Subject: [Buildroot] libc testsuite
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
Content-Type: multipart/mixed; boundary="===============1204167851355956560=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1204167851355956560==
Content-Type: multipart/alternative; boundary="000000000000d5589505f3a1db38"

--000000000000d5589505f3a1db38
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm looking for the alternative to in-tree glibc testsuite [1] to test the
libc installed on my board, especially for comparing the stabilities of
glibc, musl, and uclibc, regardless of the architecture. I found the
uclibc-ng-test [2], but it seems to be no longer actively maintained, so
the test cases may be outdated. Is there a more reliable option?

Thanks,
Yasuda

[1] https://github.com/bminor/glibc/blob/master/scripts/evaluate-test.sh
[2] https://github.com/wbx-github/uclibc-ng-test

--000000000000d5589505f3a1db38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div>I&#39;m looking for the a=
lternative to in-tree glibc testsuite [1] to test the libc installed on my =
board, especially for comparing the stabilities of glibc, musl, and uclibc,=
 regardless of the architecture. I found the uclibc-ng-test [2], but it see=
ms to be no longer actively maintained, so the test cases may be outdated. =
Is there a more reliable option?<br><div><br></div><div>Thanks,</div><div>Y=
asuda</div><div><br></div><div>[1]=C2=A0<a href=3D"https://github.com/bmino=
r/glibc/blob/master/scripts/evaluate-test.sh" target=3D"_blank">https://git=
hub.com/bminor/glibc/blob/master/scripts/evaluate-test.sh</a><br>[2]=C2=A0<=
a href=3D"https://github.com/wbx-github/uclibc-ng-test" target=3D"_blank">h=
ttps://github.com/wbx-github/uclibc-ng-test</a></div></div>

--000000000000d5589505f3a1db38--

--===============1204167851355956560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1204167851355956560==--
