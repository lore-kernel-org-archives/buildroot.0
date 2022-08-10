Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE56C19F2D
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 00:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DC56408D0;
	Wed, 10 Aug 2022 00:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DC56408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9djyT5jZ8aW; Wed, 10 Aug 2022 00:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A13E540939;
	Wed, 10 Aug 2022 00:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A13E540939
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2C9F1BF419
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 00:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4A894013C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 00:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4A894013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEyFCh4rFTkD for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 00:06:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 400E54013B
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 400E54013B
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 00:06:15 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id h4so3242899qtj.11
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 17:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=i+UhihXZNsHIxNIMCVOpeVCreFMrVk9kDM2rMYFIj8I=;
 b=BhEiAxwA6kRLZXU+A3/6yZSOoMxhSxm920dSW31pTBr+JKrv2dXzTvNuyZqYVbS4IM
 wIsVeylTArMqrmiRxhm2Yk5VBeA6/ohwDXyZTIJ6lgsnp5SpI1fR2ZSGzb//tOEju8+T
 OkpJdEwOs8RiRhZIGMJ7hp8p9o7vzoqWweqErNb2NBGFhc+Xm1MxHgk6HunV/PSGnobB
 kfUsAsXZEX/b3hyJYBrvU6wfq0PIHdvqcH4lyObvGRCFlx051tTM3jiSfh/ae2zFs/eZ
 1tEhJE8GwCDgmOLP2Nz2Yy97Gv6Ir3qkr4h2Ce6jU6vZ+ScBsh2uSTry3ygAngBB7PgJ
 oxXg==
X-Gm-Message-State: ACgBeo2/BQ59GuwrAUYAUt0rUz2kKH/Vvyqt/CZNclmJLBGn4I6CMDOn
 eRhhmJNOiIWAS431qjlMNevLC697TSkuUyVPHi6vno+w5lc=
X-Google-Smtp-Source: AA6agR78uUAdFidzZW0YPp5yUaz5ISdTl6jqucpT/cMHSKIzh1rUNNp3maCt4nQi6Cgz4wV8bLc9JPvTAUOkqHxyBxs=
X-Received: by 2002:ac8:584d:0:b0:343:a90:9fd1 with SMTP id
 h13-20020ac8584d000000b003430a909fd1mr4274267qth.662.1660089973846; Tue, 09
 Aug 2022 17:06:13 -0700 (PDT)
MIME-Version: 1.0
From: Wyatt SanSoucie <wyatt.n.sansoucie@gmail.com>
Date: Tue, 9 Aug 2022 17:05:57 -0700
Message-ID: <CA+2=KW=N8uk9D4ajpL61O+JZGyMLcuthvpGfEKOA6EvY=u0xSQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=i+UhihXZNsHIxNIMCVOpeVCreFMrVk9kDM2rMYFIj8I=;
 b=UNLfcZFKWOVntkyxSUFRNRyn+P5U5TsKB78KnAbQWRGblWCxrL1HAtq5hI6JPOIO7u
 cVJjdrg9EvwvwRA7TUEtMj349rOpqjOjFMp48XXHyp61e+TJJcHpIwDc8zXa9vjg4rx0
 RQifHUzUwF5XosCq/MR3C8bRe8t21dyArL1cRTQfnpEWXU/fulCxo8799wJQphTLKUgI
 2DYUczBOWuIwT1x2YqY6Faa7QzdmoFBNI/GrUoiHOSbACz6rX6R1MtB07HUnKYpJ+lMe
 ncieyKE/J3UlOkrLOppc5ui03Y6vDyVQGNnGyiiAOAIgxFwRM3LMLuvRT50mcEmzsl3b
 AV3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UNLfcZFK
Subject: [Buildroot] freescale_imx8mnevk_defconfig
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
Content-Type: multipart/mixed; boundary="===============8282630161816214723=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8282630161816214723==
Content-Type: multipart/alternative; boundary="0000000000002fb71d05e5d7d174"

--0000000000002fb71d05e5d7d174
Content-Type: text/plain; charset="UTF-8"

Hello Everyone,

I am trying to build an SD card image for the NXP iMX8MN EVK board.  I had
to change the configuration from DDR to LPDDR in order for u-boot to get
past RAM initialization but now I am stuck at this point:

DDRINFO: start DRAM init
DDRINFO: DRAM rate 3200MTS
DDRINFO:ddrphy calibration done
DDRINFO: ddrmix config done
Normal Boot
Trying to boot from BOOTROM
image offset 0x8000, pagesize 0x200, ivt offset 0x0
Can't support legacy image
SPL: failed to boot from all boot devices
### ERROR ### Please RESET the board ###

I also get this build warning even though the file exists in the
/buildroot/output/images folder:
WARNING 'ddr4_imem_1d.bin' not found, resulting binary is not-functional

I did a git pull and full rebuild yesterday and also tried changing some of
the u-boot options but nothing has changed.  Can anyone help me with this?

Thanks!
Wyatt

--0000000000002fb71d05e5d7d174
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Everyone,<div><br></div><div>I am trying to build an=
 SD card image for the NXP iMX8MN EVK board.=C2=A0 I had to change the conf=
iguration from DDR to LPDDR in order for u-boot to get past RAM initializat=
ion but now I am stuck at this point:</div><div><br></div><div>DDRINFO: sta=
rt DRAM init<br>DDRINFO: DRAM rate 3200MTS<br>DDRINFO:ddrphy calibration do=
ne<br>DDRINFO: ddrmix config done<br>Normal Boot<br>Trying to boot from BOO=
TROM<br>image offset 0x8000, pagesize 0x200, ivt offset 0x0<br>Can&#39;t su=
pport legacy image<br>SPL: failed to boot from all boot devices<br>### ERRO=
R ### Please RESET the board ###<br></div><div><br></div><div>I also get th=
is build warning even though the file exists in the /buildroot/output/image=
s folder:</div><div>WARNING &#39;ddr4_imem_1d.bin&#39; not found, resulting=
 binary is not-functional<br></div><div><br></div><div>I did a git pull and=
 full rebuild yesterday and also tried changing=C2=A0some of the u-boot opt=
ions but nothing has changed.=C2=A0 Can anyone help me with this?</div><div=
><br></div><div>Thanks!</div><div>Wyatt</div><div><br></div></div>

--0000000000002fb71d05e5d7d174--

--===============8282630161816214723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8282630161816214723==--
