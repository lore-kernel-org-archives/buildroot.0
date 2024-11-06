Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E704D59F74
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0447D608DC;
	Wed,  6 Nov 2024 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByawA_twlrKs; Wed,  6 Nov 2024 20:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01E30608F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01E30608F6;
	Wed,  6 Nov 2024 20:41:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA5EA4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5A3B81096
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_zBtoXiI9gc for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:41:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D45E810FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D45E810FB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D45E810FB
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MV67o-1tI6DW2uIw-00Xh57; Wed, 06
 Nov 2024 21:41:28 +0100
To: buildroot@buildroot.org
Date: Wed,  6 Nov 2024 21:41:05 +0100
Message-ID: <20241106204108.4039479-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106204108.4039479-1-fiona.klute@gmx.de>
References: <20241106204108.4039479-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:pXMtu0YCzmysO5fWd46x1Cae45KY4kWv3GxS1SdqIYAa19eSurC
 ucBKkREvuXc11bDhNrBDkgU0neIsxJfna/+CUfsZWsyR6Gq2WyD6WKs3vtvw6vMAX+zElBF
 n4MNRgc7XYl2I97CPPLazLCOyVki29CfJVeJckMeqhWWc81ASzqcxp+Plz5JfttQIK9MvwM
 temsGZmOiiQFbSDZ6Z31g==
UI-OutboundReport: notjunk:1;M01:P0:ywLfjB+/+4k=;KgqUBspaida21lXw5l8pBcTQgqj
 uKlMIO9nbIHQt8x5lHOsABp3hmgzdDpgkNL9G364sNNPhDL2NfeLJ2kAwmdTysO+HS7pzqIE+
 mtwPgs/V+T5WZo7+NljfV7gJ5PDaeSYsxB6cMMMZxHaiWxOi+dxp8pxQbwTw4X15EqCaVL+bE
 BGWTwWaBGap5foOhPqJFtRs2ZZiSnCj/FpmOXWqAGeiWLmM76GmWQt6TYO3Xk++K5htroKJLx
 jFwwXkAdLnaWrFJVd1lPnfyE7dtBl80W+Ggvtco/dQrMhgrvXdl9y6pL05AChS+y9KCQyaAnz
 xXdnRexBq+Vj5iHwaLAbhCvzbFgoaj6uOpQHg+3zFjOLyUg3QYesQPk9fpETzFWFtpTgtqVfb
 5q8YREtbA+7vri5U17zSem/LWHNiC5mJ/Up5z3Z2eRw0dKMbMDX/i+X1/iNsby79b64iyim/X
 A5ima4K4Rk/k/A1E4Rye3PLepIAFGhCIhAPLv2yxGR1d6KlLYsHDJGIegeoGsr+fdLnM7BYsd
 DmH7Ih5oFdzvtd0yixjke3bsfrJuy2nWBIkyyK+qoGrDLRv76KlJQ3lIzev0RXA2wQW+DZFaf
 TuUr1yQK0JxRaWfzU6dBQSCvBmKnDVag7Ep/7Ta/jX/kpS0hqmZnNyGnusSYZSL7OYjQTPKEx
 DS86cCjDFy7EmJzJN6sQ3lOzIvPEBRPaYx8PGDYD+xDvAEvvuSpaEANf6oFhxVftFD95sS2Bx
 yIZg7fQtN93msL4J6IRddDHqubA50QI2xcUPR3siM7yq26JzEgxs4n9fwPPxoiQpYga/Brc8Z
 mWvhdTIoiWkReYVe+d/aeSVg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730925689; x=1731530489; i=fiona.klute@gmx.de;
 bh=4d+h3j03Aq1nOo1xqycw/nynac8fzLukrxArQElfmtI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=A08UoyKG48YqnWZ9/IRmzQC7l7eCR/1xmr2Qza799Wgk5aH6JnrEGWuDiABV3SH2
 ICkNnFrqUygooKvyi0Xc3y5uLF1YC3hazJdN3YQDsAMbiYZYSWPtkC8K8GXqm7rxh
 8Qn4mrKbsMy60IE9Ucs1tvNtQjmikzCE/zWeIMQGc2lSZMA0WcqVKols7z5R8orUv
 3EpMtRZESw823XuitXw+Of8pXp0SIQpuQCn8NoF/4XC/dNy3P8pevI5Vt8btFdNlm
 2Kp1HtOZZnpmVKjfNV3ngkG7Qz+KdXQjhH1UGq8d2VNKV75SLbz2Z7k6545Ghd6yY
 e9hm/NX99hOMF2Bk5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=A08UoyKG
Subject: [Buildroot] [PATCH v6 2/5] package/gobject-introspection: works
 with musl now
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Current versions of gobject-introspection build with musl (Alpine
dropped the last compatibility patch with the update to 1.80.1 [0]), so
relax the dependency on glibc.

[0] https://gitlab.alpinelinux.org/alpine/aports/-/commit/528c4ee63970fe6ee733b6ea99ef7a59a8f108ff

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[yann.morin.1998@free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 65e98bd5ff..e3e66d43a1 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
 	# cross-compiled python3 must be installed to staging. As there
@@ -43,9 +43,9 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "gobject-introspection needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
