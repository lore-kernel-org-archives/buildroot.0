Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE02ECA0FF3
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 19:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFFC60AF2;
	Fri,  1 Sep 2023 19:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFFC60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veG591wE_xtP; Fri,  1 Sep 2023 19:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99A3360BCA;
	Fri,  1 Sep 2023 19:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99A3360BCA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 682451BF576
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D5883C15
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D5883C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIbGLPcAGC0t for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 19:28:09 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D08DC83C10
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 19:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D08DC83C10
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MHoNC-1qPSVj15PS-00EsEv; Fri, 01 Sep 2023 21:28:01 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 21:27:09 +0200
Message-ID: <20230901192719.102415-1-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KbmrL2XWiM1qXYN0TMeEntKs8a4RHWO4fcxCpWU27EZGRBkPY4L
 rLnksKOVPo3Ini+yrrnxzg+G8jrSxaI9PB73geU4uNOIqcTTQS59HN7Xt/y6QEjIsqxtUlN
 NWpNFO7Y7jDkzTghuUOab46h7HaBC9mCmXcRVawfQWBD6iX0Q9eTbX2NG3sqm65dgro3QmL
 iDIUgf3aJWczA29b0UJtg==
UI-OutboundReport: notjunk:1;M01:P0:5vjKpFDWbsA=;I5RbAM3Yqk+EZEp9JO3ie74sCcr
 qz101xzZ/7WaJ6f1EZd4bpEvxzoKxd//Gplq4JvQQAWIiPHWEyF05FpYTtS3XNmgCKtRZOvFh
 LTQE6SA8vTqRY/iCoTB06YCuXJDhCYRtEIYgzyShvX2/JYUBy02YUTzdZ0BauCj7FtyttjGXB
 0NHznIt0h9Y8pfc2tl/Vx+V2b8R40uDeo47WmnuU5dxwrOAVYKL/RpXZ2V/iHJ+8WqkYsT/f8
 v+iJllF23M6CE82movuRBzePOQh/abqnXOfbh7aFtYBW7zsn6/jIovcM6NSDHWrXLmeF90m4P
 IczpmaswBT7hVodKIaqWH8yHqC2RZ8t5kIdodIatZxM422DDUrQPfYUiihxxG2jWkYUj6zARg
 1626kFHlQVdnHqVfSxbLHwYSGAsVbaTNZUE0LobUm94EsrJR0Pa+i6xuxvEf3pcu/jzTGEhMk
 F55NjADtuC53zV3hH87N+Xhwui+9Y67OSUB3H3ThVQqBxgDkCywlQGRz+3omH0rm4v22GH1V5
 dUAxCLlcoVP+4WZHclZ214dPbsu1BGPazFIvlY9EVpBE3Qq9wF8BAs3USq7IC5nEuD1Sp47IK
 M+aGRjG6GGJuz5RV0EtI3v3dhtCj7YjwdsPmjiAAVyjSqElFXETDBThv8YL2axiUL5Pp0Nfqf
 hMWhGrwuw0+CYScUyvgS7JNgEfmPbHRLFiMfy4za5DKMukKaiNiz0L878gH1P0NlhENk1x9HO
 9QWYvNQIwqSjK6019Q5sbbnQ5p9VZr42qozPoKpyRgE7xj9lC1VIYgpjX2wGlokjFRuRnXbIf
 f3zZKA6ndl9w+ijAyEWpok5Ngm85fstBrQZByPwxQzaFmT2DaShIyB92IqNlDiO2qc8J84XjG
 q3qCAv+icamAZZGhsyW8JxY0maC9uVAvQ+mYawywdlgren9BASeG8YN7SdCR9xBicWILDwMEV
 sRlVFqnXkGYWs822CzMf+zADFms=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693596481; x=1694201281; i=dalang@gmx.at;
 bh=1mftVqpU5+3ribfwH+oabbNSWSC2UkxCBzeC24r/NgU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=EbgJVGZXmFY/mO9j1wOrHVYK867sJetm21kPSaYb+LQz+htF6twefGPjgxGFADymhlIFPX7
 7qj2zs0kMJnjnLf11sMg3MKozmZlfK7LFRDdffoyV9kkLdTkEbjHOvp4C5Wnuf6nAuoSDdBCg
 nZXlTqhGTqpP9Jtx6I0SZhhSZl7g8onYklkNGMz9k7pshYRnFO72kKI/gaFBuSfPZ4nY/fsd6
 SSyKoGxtQG9MXbpioCAyQL2m/epB3ARsmj8NTNcde26xpCILozuEx4hPmoDmiSk+mbU+JY/nA
 Ys5FVtMYWYjYWuLTmnIIdaAvu3mGcy999+sjMHnapq03m22/FhfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=EbgJVGZX
Subject: [Buildroot] [PATCH v4 1/6] support/scripts/pkg-stats: ignore more
 makefiles that aren't packages
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages are grouped and have a general makefile that defines
reusable variables. These makefiles have no relevant information for
pkg-stats and should be excluded.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v3 -> v4:
- Added more packages to ignore list, not just llvm-project
---
 support/scripts/pkg-stats | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 28f5a0789c..eca638f396 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -338,16 +338,21 @@ def get_pkglist(npackages, package_list):
     package_list: limit to those packages in this list
     """
     WALK_USEFUL_SUBDIRS = ["boot", "linux", "package", "toolchain"]
-    WALK_EXCLUDES = ["boot/common.mk",
+    WALK_EXCLUDES = ["boot/barebox/barebox.mk",
+                     "boot/common.mk",
                      "linux/linux-ext-.*.mk",
+                     "package/fftw/fftw.mk",
                      "package/freescale-imx/freescale-imx.mk",
                      "package/gcc/gcc.mk",
                      "package/gstreamer/gstreamer.mk",
                      "package/gstreamer1/gstreamer1.mk",
                      "package/gtk2-themes/gtk2-themes.mk",
+                     "package/kf5/kf5.mk",
+                     "package/llvm-project/llvm-project.mk",
                      "package/matchbox/matchbox.mk",
                      "package/opengl/opengl.mk",
                      "package/qt5/qt5.mk",
+                     "package/qt6/qt6.mk",
                      "package/x11r7/x11r7.mk",
                      "package/doc-asciidoc.mk",
                      "package/pkg-.*.mk",
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
