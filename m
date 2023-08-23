Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF5DC27C40
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 17:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C4ED40C94;
	Wed, 23 Aug 2023 17:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C4ED40C94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3C7aTdlTMvYU; Wed, 23 Aug 2023 17:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 567AE403E7;
	Wed, 23 Aug 2023 17:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 567AE403E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EAE01BF44A
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 17:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25A61403E7
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 17:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A61403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIGgA6p76aPR for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 17:29:26 +0000 (UTC)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D8D84017A
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 17:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D8D84017A
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-571110eb31bso518365eaf.2
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 10:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692811765; x=1693416565;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9omOLLmzLr3WrNAfmGJfCeWIh6MkHXFOyIYprFufrjk=;
 b=kS8Ye8uXvLofH+CuCYNOyB9aGGwx6f588yL5O9uolPh4tC9gtLFQwzweoemSLeATDx
 ULev66DQPJRvDVg3bIbEg0aolW7uCT8tF85ogw2e2GrN8bIPDpNuUwVV3IZeQx1dfmTd
 DWK3jzUkisC/jgK4Z0A/FMm2RZDCsITTxA7Znd8GiHpKoScWbeKL9YdI+OtW4UXAs4kB
 GuzeVqWX+mChdvN7CwaeLy9LIR/9+K9nfrpPjtmm987qXYw82tHjE6An7Sb8nm6oP9hq
 05RzuS2S6SF5kW6t9CVsrBcfECEDNpRd4mg/+LpvrHrcBvoZotsmpHYpABYS98q99gAO
 9Czg==
X-Gm-Message-State: AOJu0YxZkDlbGJ8s+gQM1p9nTN4wevw3wLQTkPiSkyx3cvpPUCWIomBB
 AJlVz5rsaG/GJPJoBsIA5zx5eYn08x8jtfBLy7eFMHwqnTc=
X-Google-Smtp-Source: AGHT+IFDBzALZE46yOai8+qFJTlTHY/UJepVrXYwgVU4JtxcvaxkkmatQFT7gEYHauj/4B3P2AVJnKmVjjL7m+adY5A=
X-Received: by 2002:a4a:d1cd:0:b0:571:2ad1:35be with SMTP id
 a13-20020a4ad1cd000000b005712ad135bemr1165077oos.3.1692811765020; Wed, 23 Aug
 2023 10:29:25 -0700 (PDT)
MIME-Version: 1.0
From: Floyd Brown <flobro30101@gmail.com>
Date: Wed, 23 Aug 2023 13:27:37 -0400
Message-ID: <CAKiD1a_1aCd5-67rG_Q1p18B3vynRbi0isa851QSCfYFGixYQg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692811765; x=1693416565;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9omOLLmzLr3WrNAfmGJfCeWIh6MkHXFOyIYprFufrjk=;
 b=gT+6qhg2+BG98LszY1Wi869CLMVI3Qa3azz+V/pVxif7NsGCu2+pbE4UdXJ+3jWSAz
 Lh+S07ju3LTSDfEox9czfd1j7q1qh2KTrVlkBq5JtL4yG7y7qAu9j5QhEIOImm5osXcs
 UfOq5aT4IhiS4NQSay5/OvRHYT0eU3t8IYkwtOH7Wr4HS1TKkYovADG32OZlhr1UqUrg
 cEOLkudNPo4SDOKoAlSLBPpuARVDyigB2XrObFIgD7oYvCYOxtoLxnvteR8hFcsbkhk9
 Qwd9+G0vhPfFhYBNgbblJF8LvJfiET8pE6n424NuKJ3xOjqmMJVptQb7yronBa5HWt0z
 c7xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gT+6qhg2
Subject: [Buildroot] buildroot building external kernel modules
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
Content-Type: multipart/mixed; boundary="===============8836389258204796891=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8836389258204796891==
Content-Type: multipart/alternative; boundary="000000000000ecfbe406039a7359"

--000000000000ecfbe406039a7359
Content-Type: text/plain; charset="UTF-8"

I am trying to build the brcm (broadcom) wifi modules for my old 4.9 kernel
(ancient by todays standards) and I need to do the "make
defconfig-brcmfmac" followed by the make modules...


my package file started like this:

BRCM_MODULES_VERSION = v4.14.77-2020_0115
BRCM_MODULES_SITE = file:///$(TOPDIR)
BRCM_MODULES_SOURCE =
cypress-backports-$(BRCM_MODULES_VERSION)-module-src.tar.gz

export BACKPORT_DIR=$(TOPDIR)/output/build/brcm-modules-v4.14.77-2020_0115
$(eval $(kernel-module))
$(eval $(generic-package))

--------------------

But it does not work correctly (I get modules but it apparently does not
use the compat.ko module when the drivers are loaded resulting in the
ability to not scan...

So I then tried:

BRCM_MODULES_VERSION = v4.14.77-2020_0115
BRCM_MODULES_SITE = file:///$(TOPDIR)
BRCM_MODULES_SOURCE =
cypress-backports-$(BRCM_MODULES_VERSION)-module-src.tar.gz

define BRCM_MODULES_BUILD_CMDS
        $(MAKE) -C $LINUX_DIR  m=$(@D) defconfig-brcmfmac
#        $(MAKE) -C $LINUX_DIR  m=$(@D) modules
endef

$(eval $(kernel-module))
$(eval $(generic-package))

----------------------------------

But then I get
>>> brcm-modules v4.14.77-2020_0115 Building
/usr/bin/make -j17 -C buildroot/output/build/linux-custom
M=buildroot/output/build/brcm-modules-v4.14.77-2020_0115 defconfig-brcmfmac
make[1]: Entering directory 'buildroot/output/build/linux-custom'
make[1]: *** No rule to make target 'defconfig-brcmfmac'.  Stop.
make[1]: Leaving directory 'buildroot/output/build/linux-custom'
make: *** [package/pkg-generic.mk:293:
buildroot/output/build/brcm-modules-v4.14.77-2020_0115/.stamp_built] Error 2


so it cant seem to find the module default config, also looks like it goes
into the kernel build directory instead of the driver directory...
I can't seem to find examples that do this type of thing...

Any ideas?


Thanks

--000000000000ecfbe406039a7359
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am trying to build the brcm (broadcom) wifi modules=
 for my old 4.9 kernel (ancient by todays standards) and I need to do the &=
quot;make defconfig-brcmfmac&quot; followed by the make modules...</div><di=
v><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div>my package fi=
le started like this:</div><div><br></div><div>BRCM_MODULES_VERSION =3D v4.=
14.77-2020_0115<br>BRCM_MODULES_SITE =3D file:///$(TOPDIR)<br>BRCM_MODULES_=
SOURCE =3D cypress-backports-$(BRCM_MODULES_VERSION)-module-src.tar.gz<br><=
br>export BACKPORT_DIR=3D$(TOPDIR)/output/build/brcm-modules-v4.14.77-2020_=
0115<br>$(eval $(kernel-module))<br>$(eval $(generic-package))<br></div><di=
v><br></div><div>--------------------</div><div><br></div><div>But it does =
not work correctly (I get modules but it apparently does not use the compat=
.ko module when the drivers are loaded resulting in the ability to not scan=
...<br></div><div><br></div><div>So I then tried:</div><div><br></div><div>=
BRCM_MODULES_VERSION =3D v4.14.77-2020_0115<br>BRCM_MODULES_SITE =3D file:/=
//$(TOPDIR)<br>BRCM_MODULES_SOURCE =3D cypress-backports-$(BRCM_MODULES_VER=
SION)-module-src.tar.gz<br><br>define BRCM_MODULES_BUILD_CMDS<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 $(MAKE) -C $LINUX_DIR=C2=A0 m=3D$(@D) defconfig-brcmfmac<=
/div><div>#=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $LINUX_DIR=C2=A0 m=3D$(@D=
) modules</div><div>endef<br><br>$(eval $(kernel-module))<br>$(eval $(gener=
ic-package))<br></div><div><br></div><div>---------------------------------=
-</div><div><br></div><div>But then I get <br></div><div>&gt;&gt;&gt; brcm-=
modules v4.14.77-2020_0115 Building<br>/usr/bin/make -j17 -C buildroot/outp=
ut/build/linux-custom M=3Dbuildroot/output/build/brcm-modules-v4.14.77-2020=
_0115 defconfig-brcmfmac<br>make[1]: Entering directory &#39;buildroot/outp=
ut/build/linux-custom&#39;<br>make[1]: *** No rule to make target &#39;defc=
onfig-brcmfmac&#39;.=C2=A0 Stop.<br>make[1]: Leaving directory &#39;buildro=
ot/output/build/linux-custom&#39;<br>make: *** [package/<a href=3D"http://p=
kg-generic.mk:293">pkg-generic.mk:293</a>: buildroot/output/build/brcm-modu=
les-v4.14.77-2020_0115/.stamp_built] Error 2<br></div><div><br></div><div><=
br></div><div>so it cant seem to find the module default config, also looks=
 like it goes into the kernel build directory instead of the driver directo=
ry...<br></div><div>I can&#39;t seem to find examples that do this type of =
thing...<br></div><div><br></div><div>Any ideas?</div><div><br></div><div><=
br></div><div>Thanks<br><br></div><br></div></div></div></div></div>

--000000000000ecfbe406039a7359--

--===============8836389258204796891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8836389258204796891==--
