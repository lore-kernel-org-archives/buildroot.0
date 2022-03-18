Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82500C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76F7415ED;
	Fri, 18 Mar 2022 13:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onf2CTUGVZui; Fri, 18 Mar 2022 13:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CBE14167A;
	Fri, 18 Mar 2022 13:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B15F1BF27E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A15B8267F
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvbL4MOkr2t6 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ED2481275
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647609059;
 bh=2IGPD2zBLSfH6M+g7/fk/6xEdRIzDy2hINbIJ8ahswY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=OoKG14xQs00Ap9wzqAk5h8xraqDqcubJPQv8lkm/vNDfgT8p1gz9vg8IQjyeDrieN
 8tApmRTMG/NrC4Ka8pyTge/33CmA8hVJnuLU4oPJlDzNNPrEzg1BZhEyHb+BZCab8r
 yyONZ71oWFiT60OUjXjUueHF4krAyYT4nJX5s0PI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.203]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M4s4r-1nUvGW1Thn-0022qY for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 14:10:59 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:10:57 +0100
Message-Id: <20220318131058.32240-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:2YbTrD8Un5OLNi548Lw01Rf15XsVBkVeV5M5VAhhLrYat1aJRmj
 YNInzm2OZengXb4h3OYTz1CNlpDogl2sV3jRsYibIrYsWRU4xWx83bQcZQrTIss/2Mvgicr
 j9AcbIgLYw35j0H2/wFgUw8jgl1usJCZF7X6uqqFjI+0dxcQwhKjEbL9iJJ4XXbDoWDZD0L
 mO32krWibCpLTNPf1aisA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3Qm+aE+tHO0=:J/JufHWYVrDHjZp+I090R8
 6/gi8CLW5Erc93G8YFqnrc+g4d3w5qc1f6FdWj+CC86UQY5LNKGaC1IDVAuxItHHfXq3j0t91
 rJYrm4WOAvkGUyoA6NZhYFh2bY6R8+NNcihz8qNRWKAfD9eLd6DlEeCoOIDqVxXscoEmYm9nb
 IHUhbVHj5TcF5Vt/okeJhxO9B5Nsh3mXsnb5jpONZa2gPIhUJlp+oKW4avuKO0m0I/lDt3DxC
 +8MdurYvrA/I2/TS6ExPAG3LyzEObs0Mdxe8flFJYUXP4iujVOuNXZ80ft4NtU3ZP3sx0Io3g
 OX45oXgi9C57m4WLGcb3AF8VI7bfJKiS4cZcQ8/3K0of8sfFNGub9Iv3hLtCyXd3Pes2afbCC
 ek/HqZ3IYDE55j3Zslsa9oliYx8/lZOAYGncfaUbJxonqUTFCJMslaYjQY2UgVBX1CIihS3qw
 jCNbwJjTUqbN9obwi2SYlV/zNAkpimy6XGpM/L0A7r5867NlzmtGm+/eGsBezPgsfqAh2OmPE
 oA6Z1O8jVlxZD3v++jh6d4upreySHajp+3z2BlYGsfIKGvrYM/+CqJzor/WabaWP8zd3xq12b
 lZ/9PAt/XbHW2qacmuXDbsBGB5dCVW8B6e4isA7DI+UpVaEdBGJbMjc+UCo5kVzlk0XVDpGk7
 ihmLgxml9X90GuQIKHgUI5i8AlCto02SialbJ83U0hfkC9PqqrpAhs5wiL/ebqMppo7oVVmLE
 v8jZ8qgMKU4ZIBY8Nf2iktz4qScI1KllGJPASPQiJ9VIPEgQAlCrbEIC0IxuV5V2xj16UDyOO
 rXdjwIjNd3ItygFghtRbWpju9Lsg0JQR0xvjdD9fY/31rdt0pitnQUcZoIbNAjRMdCTmJvqVE
 X/YZaE5UbfszUTBrRSLb9c6Kdwty8YpoMVYEplFDfkVzCQNOP/q41vlegLDvw9QAO1X1s/EGo
 tG1AjLcru6DX8ctg+n10P2g2bWLegjj4ygmOp+YyjCYb4O/myVJQ+5KnDisq4FEtlw9rR0Xhd
 krd4+KLRdYVLWtcmvfqe+a1vUwMGDuYRZNyQHgGQT6cHhVjV47HlzUssUoFCWFg6ivjeB3Coj
 STZ2tKlwEMW7po=
Subject: [Buildroot] [PATCH v1 1/2] package/libcamera-apps: X11 support
 needs libdrm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- X11 support needs libdrm (optional libdrm dependency already
  present in libcamera-apps.mk)

Fixes:

  http://autobuild.buildroot.net/results/5df48038df5deb4f1e85287cde9a403c5681c28e

  .../build/libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5/preview/egl_preview.cpp:18:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
     18 | #include <libdrm/drm_fourcc.h>
        |          ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera-apps/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index a1affc2d23..492a99cf55 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 	select BR2_PACKAGE_LIBEPOXY if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
