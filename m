Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C2DC433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 20:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E24E40571;
	Fri, 30 Sep 2022 20:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E24E40571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkSigab2Mtuv; Fri, 30 Sep 2022 20:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18E2F40556;
	Fri, 30 Sep 2022 20:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E2F40556
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2722F1BF2F3
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 20:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0262460C28
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 20:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0262460C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kcQPMhWePK2 for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 20:50:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C62160B5D
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C62160B5D
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 20:50:45 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y136so5236611pfb.3
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 13:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=idshzZ6L2J7Gy4pXjrcyBAZdIiQMB29DggwEhN9imIA=;
 b=3dj9slxs1OS7hNN1GBYfU7Hx36YVphYc6h7vECgru8toqFGlPg4/hGTUQ2INgQoLXY
 ZOTMVOrP9MDPfSRKLv9Dgj8SQHah2pdEucfVo3PcC/L9oRyNXlGeM6FzahJv4zUhHzD6
 J3SW3csdNMSBejBAa61vWkkgsdoX4AVu3iQCkHhF22zjDjAJFIvw0KLOC46SkBR6ETFl
 1TffO8Dvwt/otTjkCuNuKB2GCMK16E4aApFApL/x8sIfFSqeHbxpBEBVm1d2PxXm3TCD
 vJ1WQ/ComkCzBQNVio0K9jvQyGuMB2JvGpE0y3YYeYG4ikEm/gDtiS4HYxM7xMoq8zJt
 hi7g==
X-Gm-Message-State: ACrzQf0gfpiUwqdBG25cFSwz6mBT2jdmGFZgLOLXIBmgP1wbl3QUPMJb
 0L/1aJG3Q3hl6E0yy1C8oDLXsqf1UD16HbW84G8=
X-Google-Smtp-Source: AMsMyM7MsofOI6hOt806k1ltc1pRXkUpYQsOzYWH/NCwu2eZTL+iY8NtFE38/5tunYUGlVTH8A09Y30oMXlQaDpLiek=
X-Received: by 2002:a05:6a00:114f:b0:528:2c7a:634c with SMTP id
 b15-20020a056a00114f00b005282c7a634cmr10873903pfm.41.1664571044886; Fri, 30
 Sep 2022 13:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220930181741.8749-1-pevik@seznam.cz>
In-Reply-To: <20220930181741.8749-1-pevik@seznam.cz>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 30 Sep 2022 22:50:33 +0200
Message-ID: <CAB1t1CxW3rsZeuP4dppTZ1ZQ659gO-5AEc0VWFU4tUEW7EhFQQ@mail.gmail.com>
To: Petr Vorel <pevik@seznam.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=idshzZ6L2J7Gy4pXjrcyBAZdIiQMB29DggwEhN9imIA=;
 b=LtMmnTr1jLVoDsgOzA73jQes93KUOiQklEnNxGUDByienBOoaN6VljyEQYkHgU0zpM
 UgkCsWtq2+ctr4ftVq8xP4yvEb3/8FopzrWlVfpcV1lXtpCDvhEZRXoEdc3UH8Up/UZz
 O/g0TvLDkzIyC/F7f8bOHPjSEK2HqBqGSfTioPb6+TtWZxPeInzd0iXsRZF0w7YpBuzM
 qtudufrOtU1GXttJHYbmBqI2b+SzVhM/hw6Fk+5KN5RYOaFCGPtSuMvhF3ZzAFqApZVP
 ZaiSt5nLFZVE+H+86Y4jO6QCneePuq7sQ855YO0Io3ZA4fEVswJWQEKBkSWEilQVjfMG
 BSxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LtMmnTr1
Subject: Re: [Buildroot] [PATCH 1/1] ltp-testsuite: bump version to 20220930
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3254027134160071211=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3254027134160071211==
Content-Type: multipart/alternative; boundary="000000000000d5804505e9eb25e8"

--000000000000d5804505e9eb25e8
Content-Type: text/plain; charset="UTF-8"

Hi all,

tested.

Kind regards,
Petr

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
                      bootlin-armv7-musl [ 7/44]: OK
             bootlin-microblazeel-uclibc [ 8/44]: OK
                   bootlin-mipsel-uclibc [ 9/44]: OK
                bootlin-mipsel32r6-glibc [10/44]: OK
                bootlin-m68k-5208-uclibc [11/44]: SKIPPED
               bootlin-m68k-68040-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: SKIPPED
                 bootlin-openrisc-uclibc [14/44]: OK
           bootlin-powerpc-e500mc-uclibc [15/44]: OK
        bootlin-powerpc64le-power8-glibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                    bootlin-sparc-uclibc [21/44]: SKIPPED
                   bootlin-sparc64-glibc [22/44]: OK
                   bootlin-xtensa-uclibc [23/44]: FAILED
                    bootlin-x86-64-glibc [24/44]: OK
                     bootlin-x86-64-musl [25/44]: OK
                   bootlin-x86-64-uclibc [26/44]: OK
                            br-arm-basic [27/44]: OK
                    br-arm-full-nothread [28/44]: SKIPPED
                      br-arm-full-static [29/44]: OK
                br-i386-pentium-mmx-musl [30/44]: OK
                   br-i386-pentium4-full [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                           sourcery-mips [42/44]: OK

--000000000000d5804505e9eb25e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgYWxsLDxkaXY+PGJyPjwvZGl2PjxkaXY+dGVzdGVkLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+S2luZCByZWdhcmRzLDwvZGl2PjxkaXY+UGV0cjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYm9vdGxpbi1hcm12
NS11Y2xpYmMgWzEvNl06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9v
dGxpbi1hcm12Ny1nbGliYyBbMi82XTogT0s8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06IFNLSVBQRUQ8YnI+wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBib290bGluLXg4Ni02NC1tdXNsIFs0LzZdOiBPSzxicj7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBici1hcm0tZnVsbC1zdGF0aWMgWzUvNl06IE9LPGJy
PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNvdXJjZXJ5LWFybSBb
Ni82XTogT0s8YnI+NiBidWlsZHMsIDEgc2tpcHBlZCwgMCBidWlsZCBmYWlsZWQsIDAgbGVnYWwt
aW5mbyBmYWlsZWQsIDAgc2hvdy1pbmZvIGZhaWxlZDxicj48YnI+wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhcm0tYWFyY2g2NCBbIDEvNDRdOiBPSzxicj7CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb3RsaW4tYWFyY2g2NC1nbGliYyBbIDIvNDRdOiBP
Szxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb3RsaW4tYXJjbGUtaHMzOC11Y2xpYmMgWyAz
LzQ0XTogT0s8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYm9vdGxpbi1hcm12NS11
Y2xpYmMgWyA0LzQ0XTogT0s8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBib290
bGluLWFybXY3LWdsaWJjIFsgNS80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYm9vdGxpbi1hcm12N20tdWNsaWJjIFsgNi80NF06IFNLSVBQRUQ8YnI+wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgYm9vdGxpbi1hcm12Ny1tdXNsIFsgNy80NF06IE9LPGJyPsKg
IMKgIMKgIMKgIMKgIMKgIMKgYm9vdGxpbi1taWNyb2JsYXplZWwtdWNsaWJjIFsgOC80NF06IE9L
PGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vdGxpbi1taXBzZWwtdWNsaWJjIFsg
OS80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJvb3RsaW4tbWlwc2VsMzJyNi1n
bGliYyBbMTAvNDRdOiBPSzxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBib290bGluLW02OGst
NTIwOC11Y2xpYmMgWzExLzQ0XTogU0tJUFBFRDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJv
b3RsaW4tbTY4ay02ODA0MC11Y2xpYmMgWzEyLzQ0XTogT0s8YnI+wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBib290bGluLW5pb3MyLWdsaWJjIFsxMy80NF06IFNLSVBQRUQ8YnI+wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBib290bGluLW9wZW5yaXNjLXVjbGliYyBbMTQvNDRdOiBP
Szxicj7CoCDCoCDCoCDCoCDCoCDCoGJvb3RsaW4tcG93ZXJwYy1lNTAwbWMtdWNsaWJjIFsxNS80
NF06IE9LPGJyPsKgIMKgIMKgIMKgIGJvb3RsaW4tcG93ZXJwYzY0bGUtcG93ZXI4LWdsaWJjIFsx
Ni80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vdGxpbi1yaXNjdjMy
LWdsaWJjIFsxNy80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vdGxp
bi1yaXNjdjY0LWdsaWJjIFsxOC80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGJvb3RsaW4tcmlzY3Y2NC1tdXNsIFsxOS80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGJvb3RsaW4tc2g0LXVjbGliYyBbMjAvNDRdOiBPSzxicj7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBib290bGluLXNwYXJjLXVjbGliYyBbMjEvNDRdOiBTS0lQ
UEVEPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vdGxpbi1zcGFyYzY0LWdsaWJj
IFsyMi80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vdGxpbi14dGVu
c2EtdWNsaWJjIFsyMy80NF06IEZBSUxFRDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBib290bGluLXg4Ni02NC1nbGliYyBbMjQvNDRdOiBPSzxicj7CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGJvb3RsaW4teDg2LTY0LW11c2wgWzI1LzQ0XTogT0s8YnI+wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBib290bGluLXg4Ni02NC11Y2xpYmMgWzI2LzQ0XTogT0s8YnI+
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnItYXJtLWJhc2ljIFsy
Ny80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyLWFybS1mdWxsLW5v
dGhyZWFkIFsyOC80NF06IFNLSVBQRUQ8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgYnItYXJtLWZ1bGwtc3RhdGljIFsyOS80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGJyLWkzODYtcGVudGl1bS1tbXgtbXVzbCBbMzAvNDRdOiBPSzxicj7CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJyLWkzODYtcGVudGl1bTQtZnVsbCBbMzEvNDRdOiBPSzxicj7CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBici1taXBzNjQtbjY0LWZ1bGwgWzMyLzQ0XTog
T0s8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBici1taXBzNjRyNi1lbC1oZi1nbGliYyBb
MzMvNDRdOiBPSzxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyLXBvd2VycGMtNjAzZS1iYXNp
Yy1jcHAgWzM0LzQ0XTogT0s8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBici1wb3dlcnBjNjQt
cG93ZXI3LWdsaWJjIFszNS80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgbGluYXJvLWFhcmNoNjQtYmUgWzM2LzQ0XTogT0s8YnI+wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgbGluYXJvLWFhcmNoNjQgWzM3LzQ0XTogT0s8YnI+wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbGluYXJvLWFybSBbMzgvNDRd
OiBPSzxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNvdXJjZXJ5LWFybS1hcm12
NHQgWzM5LzQ0XTogT0s8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgc291cmNlcnktYXJtIFs0MC80NF06IE9LPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc291cmNlcnktYXJtLXRodW1iMiBbNDEvNDRdOiBPSzxicj7CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNvdXJjZXJ5LW1pcHMgWzQyLzQ0XTogT0s8YnI+PC9k
aXY+PC9kaXY+DQo=
--000000000000d5804505e9eb25e8--

--===============3254027134160071211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3254027134160071211==--
