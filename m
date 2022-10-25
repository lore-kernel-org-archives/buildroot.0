Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A1DFA373F
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 07:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D34F402B9;
	Tue, 25 Oct 2022 07:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D34F402B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyfNNEsiLqhV; Tue, 25 Oct 2022 07:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40271402B2;
	Tue, 25 Oct 2022 07:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40271402B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7007D1BF30B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 07:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57ECA60AE0
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 07:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57ECA60AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyxLRMS6ibFS for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 07:33:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2F14600C4
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2F14600C4
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 07:33:43 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so3903221fac.7
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 00:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jbFrf/q5zbJzWCMvDcuuOa3fxwtsDP8Pbrqw1tY9xoA=;
 b=RSgh2qXnoon6gvgsVAbvOsojIYOqZqlCpsmWqXrW9OQzO65prTwDsateFwNfYBpxlk
 IRJ23yTcmb6KfFQZIbc8134Vvy3epg0FWHZ5qrt9NDxNcc5RebseEe1+ju8iX4TtZZaU
 R31gsVOl59KaDEZO++vO2q9WBaULdiUD8GDBW3REBsUPfhaqXfIX3yG9JIO5N1B5d1yK
 QQ3F8vHGqzzL4MY/H66O2o3bvatR4Bid/gUL3dmpRnjfl7tzrecdlRqXqEaCRHPZ7i9Q
 QEu5dPOt0Wba+3jOXoAZOqqdaWbbskvTlgyVKyYJ1hYJeJ0116gPvBdXfyIpUhQx7KV5
 rm7g==
X-Gm-Message-State: ACrzQf3hdJJa4yHNKSdRaJX+Aq+CClmPgREmVM8BWWcVIs08DtPv+ZDI
 pDlRgVlK/AaWVejzaaDwdN9hnKNWRKmV2jG/79l7iQ==
X-Google-Smtp-Source: AMsMyM6DIHY09GKxl+DynNFBSGiZ0d922yQ+Tm9XoXpmxmPZxOTWW50tCmYXJAWWwmaTeolaMjmiXzk2QMhlH0as3AQ=
X-Received: by 2002:a05:6870:ea9e:b0:137:a7:3cae with SMTP id
 s30-20020a056870ea9e00b0013700a73caemr22373542oap.48.1666683222825; Tue, 25
 Oct 2022 00:33:42 -0700 (PDT)
MIME-Version: 1.0
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 25 Oct 2022 09:33:06 +0200
Message-ID: <CA+_SqVb8PiTaw9o5KSTohDQ_Ym5aT4o8u8s_KiFZZ9M_nv8tNg@mail.gmail.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jbFrf/q5zbJzWCMvDcuuOa3fxwtsDP8Pbrqw1tY9xoA=;
 b=n8yuWGP51a+nJqSGQJWgrTnz5n2MtIYUmMsei/L6dm1aJqaKWkXZtPMzGScsCcOyRy
 VcSD9R1uJfk+BUNHF1JzQ4h6eQwLZQlLf8ncJ4Lzu7TYKh93NSpJ/pJ2JpwjKDahmodY
 q6fk68umufDkmWtq10m/hcPdeA7qYewZnXL2A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=n8yuWGP5
Subject: [Buildroot] QT6 Qmake
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0405043251641051210=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0405043251641051210==
Content-Type: multipart/alternative; boundary="00000000000073327005ebd6ed87"

--00000000000073327005ebd6ed87
Content-Type: text/plain; charset="UTF-8"

Hello Jesse,

I was trying to port qt6knx to qt6, the project is not converted to cmake
but still based on qmake.
I was able to compile it on x86 using qt6 but qmake in buildroot QT6 is
somewhat broken, the following snip shows the differences between qmake for
QT5 and QT6:

angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/bin/qmake
-query
QT_SYSROOT:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot

QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr

QT_INSTALL_PREFIX/raw:/usr
QT_INSTALL_ARCHDATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr

QT_INSTALL_ARCHDATA/raw:/usr
QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr

QT_INSTALL_DATA/raw:/usr
QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/doc

QT_INSTALL_DOCS/raw:/usr/doc
QT_INSTALL_HEADERS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/qt5

QT_INSTALL_HEADERS/raw:/usr/include/qt5
QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib

QT_INSTALL_LIBS/raw:/usr/lib
QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/libexec

QT_INSTALL_LIBEXECS/raw:/usr/libexec
QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin

QT_INSTALL_BINS/raw:/usr/bin
QT_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/tests

QT_INSTALL_TESTS/raw:/usr/tests
QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/plugins

QT_INSTALL_PLUGINS/raw:/usr/lib/qt/plugins
QT_INSTALL_IMPORTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/imports

QT_INSTALL_IMPORTS/raw:/usr/imports
QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/qml

QT_INSTALL_QML/raw:/usr/qml
QT_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/translations

QT_INSTALL_TRANSLATIONS/raw:/usr/translations
QT_INSTALL_CONFIGURATION:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr

QT_INSTALL_CONFIGURATION/raw:/usr
QT_INSTALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/examples

QT_INSTALL_EXAMPLES/raw:/usr/lib/qt/examples
QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/examples

QT_INSTALL_DEMOS/raw:/usr/lib/qt/examples
QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host

QT_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host

QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/bin

QT_HOST_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/lib

QMAKE_SPEC:linux-g++
QMAKE_XSPEC:devices/linux-buildroot-g++
QMAKE_VERSION:3.1
QT_VERSION:5.15.8
angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt6base/host/bin/qmake
-query
QT_SYSROOT:
QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host

QT_INSTALL_ARCHDATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host

QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host

QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/doc

QT_INSTALL_HEADERS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/include

QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/lib

QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/libexec

QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/bin

QT_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/tests

QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/plugins

QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/qml

QT_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/translations

QT_INSTALL_CONFIGURATION:
QT_INSTALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/examples

QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/examples

QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host

QT_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host

QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/bin

QT_HOST_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/libexec

QT_HOST_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/lib

QMAKE_SPEC:linux-g++
QMAKE_XSPEC:linux-g++
QMAKE_VERSION:3.1
QT_VERSION:6.4.0


Any clue?

I'm looking into fixing qmake for QT6 anyway

Thanks!
-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--00000000000073327005ebd6ed87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Jesse,</div><div><br></div><div>I was trying to=
 port qt6knx to qt6, the project is not converted to cmake but still based =
on qmake.</div><div>I was able to compile it on x86 using qt6 but qmake in =
buildroot QT6 is somewhat broken, the following snip shows the differences =
between qmake for QT5 and QT6:<br></div><div><br></div><div><div class=3D"g=
mail-de1">angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$ /home/angelo/DEV/BUIL=
DROOT/br_qemu_arm/per-package/qt5base/host/bin/qmake -query
</div><div class=3D"gmail-de1">QT_SYSROOT:/home/angelo/DEV/BUILDROOT/br_qem=
u_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot
</div><div class=3D"gmail-de1">QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT=
/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/s=
ysroot/usr
</div><div class=3D"gmail-de1">QT_INSTALL_PREFIX/raw:/usr
</div><div class=3D"gmail-de1">QT_INSTALL_ARCHDATA:/home/angelo/DEV/BUILDRO=
OT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf=
/sysroot/usr
</div><div class=3D"gmail-de1">QT_INSTALL_ARCHDATA/raw:/usr
</div><div class=3D"gmail-de1">QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sys=
root/usr
</div><div class=3D"gmail-de1">QT_INSTALL_DATA/raw:/usr
</div><div class=3D"gmail-de1">QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sys=
root/usr/doc
</div><div class=3D"gmail-de1">QT_INSTALL_DOCS/raw:/usr/doc
</div><div class=3D"gmail-de1">QT_INSTALL_HEADERS:/home/angelo/DEV/BUILDROO=
T/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/=
sysroot/usr/include/qt5
</div><div class=3D"gmail-de1">QT_INSTALL_HEADERS/raw:/usr/include/qt5
</div><div class=3D"gmail-de1">QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sys=
root/usr/lib
</div><div class=3D"gmail-de1">QT_INSTALL_LIBS/raw:/usr/lib
</div><div class=3D"gmail-de1">QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDRO=
OT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf=
/sysroot/usr/libexec
</div><div class=3D"gmail-de1">QT_INSTALL_LIBEXECS/raw:/usr/libexec
</div><div class=3D"gmail-de1">QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sys=
root/usr/bin
</div><div class=3D"gmail-de1">QT_INSTALL_BINS/raw:/usr/bin
</div><div class=3D"gmail-de1">QT_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/=
br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sy=
sroot/usr/tests
</div><div class=3D"gmail-de1">QT_INSTALL_TESTS/raw:/usr/tests
</div><div class=3D"gmail-de1">QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROO=
T/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/=
sysroot/usr/lib/qt/plugins
</div><div class=3D"gmail-de1">QT_INSTALL_PLUGINS/raw:/usr/lib/qt/plugins
</div><div class=3D"gmail-de1">QT_INSTALL_IMPORTS:/home/angelo/DEV/BUILDROO=
T/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/=
sysroot/usr/imports
</div><div class=3D"gmail-de1">QT_INSTALL_IMPORTS/raw:/usr/imports
</div><div class=3D"gmail-de1">QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br=
_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysr=
oot/usr/qml
</div><div class=3D"gmail-de1">QT_INSTALL_QML/raw:/usr/qml
</div><div class=3D"gmail-de1">QT_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUI=
LDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnuea=
bihf/sysroot/usr/translations
</div><div class=3D"gmail-de1">QT_INSTALL_TRANSLATIONS/raw:/usr/translation=
s
</div><div class=3D"gmail-de1">QT_INSTALL_CONFIGURATION:/home/angelo/DEV/BU=
ILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnue=
abihf/sysroot/usr
</div><div class=3D"gmail-de1">QT_INSTALL_CONFIGURATION/raw:/usr
</div><div class=3D"gmail-de1">QT_INSTALL_EXAMPLES:/home/angelo/DEV/BUILDRO=
OT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf=
/sysroot/usr/lib/qt/examples
</div><div class=3D"gmail-de1">QT_INSTALL_EXAMPLES/raw:/usr/lib/qt/examples
</div><div class=3D"gmail-de1">QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/=
br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sy=
sroot/usr/lib/qt/examples
</div><div class=3D"gmail-de1">QT_INSTALL_DEMOS/raw:/usr/lib/qt/examples
</div><div class=3D"gmail-de1">QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br=
_qemu_arm/per-package/qt5base/host
</div><div class=3D"gmail-de1">QT_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_q=
emu_arm/per-package/qt5base/host
</div><div class=3D"gmail-de1">QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_q=
emu_arm/per-package/qt5base/host/bin
</div><div class=3D"gmail-de1">QT_HOST_LIBS:/home/angelo/DEV/BUILDROOT/br_q=
emu_arm/per-package/qt5base/host/lib
</div><div class=3D"gmail-de1">QMAKE_SPEC:linux-g++
</div><div class=3D"gmail-de1">QMAKE_XSPEC:devices/linux-buildroot-g++
</div><div class=3D"gmail-de1">QMAKE_VERSION:3.1
</div><div class=3D"gmail-de1">QT_VERSION:5.15.8
</div><div class=3D"gmail-de1">angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
</div><div class=3D"gmail-de1">angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$ =
/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt6base/host/bin/qmake -=
query
</div><div class=3D"gmail-de1">QT_SYSROOT:
</div><div class=3D"gmail-de1">QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT=
/br_qemu_arm/per-package/host-qt6base/host
</div><div class=3D"gmail-de1">QT_INSTALL_ARCHDATA:/home/angelo/DEV/BUILDRO=
OT/br_qemu_arm/per-package/host-qt6base/host
</div><div class=3D"gmail-de1">QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/host-qt6base/host
</div><div class=3D"gmail-de1">QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/host-qt6base/host/doc
</div><div class=3D"gmail-de1">QT_INSTALL_HEADERS:/home/angelo/DEV/BUILDROO=
T/br_qemu_arm/per-package/host-qt6base/host/include
</div><div class=3D"gmail-de1">QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/host-qt6base/host/lib
</div><div class=3D"gmail-de1">QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDRO=
OT/br_qemu_arm/per-package/host-qt6base/host/libexec
</div><div class=3D"gmail-de1">QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/host-qt6base/host/bin
</div><div class=3D"gmail-de1">QT_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/=
br_qemu_arm/per-package/host-qt6base/host/tests
</div><div class=3D"gmail-de1">QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROO=
T/br_qemu_arm/per-package/host-qt6base/host/plugins
</div><div class=3D"gmail-de1">QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br=
_qemu_arm/per-package/host-qt6base/host/qml
</div><div class=3D"gmail-de1">QT_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUI=
LDROOT/br_qemu_arm/per-package/host-qt6base/host/translations
</div><div class=3D"gmail-de1">QT_INSTALL_CONFIGURATION:
</div><div class=3D"gmail-de1">QT_INSTALL_EXAMPLES:/home/angelo/DEV/BUILDRO=
OT/br_qemu_arm/per-package/host-qt6base/host/examples
</div><div class=3D"gmail-de1">QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/=
br_qemu_arm/per-package/host-qt6base/host/examples
</div><div class=3D"gmail-de1">QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br=
_qemu_arm/per-package/host-qt6base/host
</div><div class=3D"gmail-de1">QT_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_q=
emu_arm/per-package/host-qt6base/host
</div><div class=3D"gmail-de1">QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_q=
emu_arm/per-package/host-qt6base/host/bin
</div><div class=3D"gmail-de1">QT_HOST_LIBEXECS:/home/angelo/DEV/BUILDROOT/=
br_qemu_arm/per-package/host-qt6base/host/libexec
</div><div class=3D"gmail-de1">QT_HOST_LIBS:/home/angelo/DEV/BUILDROOT/br_q=
emu_arm/per-package/host-qt6base/host/lib
</div><div class=3D"gmail-de1">QMAKE_SPEC:linux-g++
</div><div class=3D"gmail-de1">QMAKE_XSPEC:linux-g++
</div><div class=3D"gmail-de1">QMAKE_VERSION:3.1
</div>QT_VERSION:6.4.0</div><div><br></div><div><br></div><div>Any clue?</d=
iv><div><br></div><div>I&#39;m looking into fixing qmake for QT6 anyway</di=
v><div><br></div><div>Thanks!<br></div><div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;font-family:Arial;color:#000000;background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap"=
></span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:#=
000000;background-color:transparent;font-weight:500;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr" style=3D=
"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span sty=
le=3D"font-size:10pt;font-family:&#39;Ubuntu Mono&#39;,monospace;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;wh=
ite-space:pre-wrap">Software Engineer</span></p><p dir=3D"ltr" style=3D"lin=
e-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&#39;Ubuntu Mono&#39;,monospace;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap"><a href=3D"mailto:angelo@amarulasolutions.com" target=3D"=
_blank">angelo@amarulasolutions.com</a>=C2=A0<br></span><span style=3D"font=
-size:10pt;font-family:&#39;Ubuntu Mono&#39;,monospace;color:#f1c232;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:=
pre-wrap">__________________________________</span><span style=3D"font-size=
:10pt;font-family:&#39;Ubuntu Mono&#39;,monospace;color:#000000;background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-w=
rap"><br></span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif=
;color:#000000;background-color:transparent;font-weight:500;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:10pt;font-family:&#39;Ubuntu Mono&#39;,monospace=
;color:#000000;background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre;white-space:pre-wrap">Via le Canevare 30, 31100 Treviso, Veneto, I=
T</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&#39;Ub=
untu Mono&#39;,monospace;color:#000000;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre;white-space:pre-wrap">T. +39 (0)42 243 531=
0</span><span style=3D"font-size:10pt;font-family:&#39;Ubuntu Mono&#39;,mon=
ospace;color:#000000;background-color:transparent;font-weight:400;font-styl=
e:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;w=
hite-space:pre;white-space:pre-wrap"><br></span><span style=3D"font-size:10=
pt;font-family:&#39;Ubuntu Mono&#39;,monospace;color:#000000;background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap=
"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amaru=
lasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999=
999999998;margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulaso=
lutions.com/" style=3D"text-decoration:none" target=3D"_blank"><span style=
=3D"font-size:10pt;font-family:&#39;Ubuntu Mono&#39;,monospace;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap">www.amarulasolutions.com</span></a></p><div>[`as] <a href=
=3D"https://www.amarulasolutions.com" target=3D"_blank">https://www.amarula=
solutions.com</a>|</div></div></div></div></div>

--00000000000073327005ebd6ed87--

--===============0405043251641051210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0405043251641051210==--
