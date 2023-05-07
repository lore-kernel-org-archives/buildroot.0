Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B07C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 20:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA31613F0;
	Sun,  7 May 2023 20:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA31613F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S77qrs7chVug; Sun,  7 May 2023 20:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED40760F51;
	Sun,  7 May 2023 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED40760F51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA2C1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5A5E82298
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 20:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A5E82298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpEe2Pfnihi6 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 20:17:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3E3982279
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3E3982279
 for <buildroot@buildroot.org>; Sun,  7 May 2023 20:17:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.225.6.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MRTRN-1pbD8718sf-00NRkn; Sun, 07 May 2023 22:17:10 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 22:16:36 +0200
Message-Id: <20230507201636.52947-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:fZT2LJXVT3oljgPgQbTDAOrdtbfuZwTAWrYlH7OPxBjLfBadL4v
 Ie5h/jk7g3bYyYsAEf018HZrhCs1ashXT0fcdsXlsRdqe912ni3s6I1SFH3oWvc8uusjDtW
 lwBT6MTPIdu3jHtzQWojbTJfdAS2AouFNTFgJJuF3qyImwuDwS8hd6+SfGYBwE9GELNWvoG
 tUzshzUOB1JkgRurvZl/w==
UI-OutboundReport: notjunk:1;M01:P0:Rxs0VS6tj/k=;KgGjlHgxlTF/1i+/Z5uKfP1hvvE
 gqRPsupW7o9NRjeyRuapDDJLIoKFgXpPb+NZZcyVjUPJA+VvhWyeWsl3ySeK76TMpDveTO6Ei
 fk97MiUdWcVASQD07CtdQE/skkHrjnpCG5iOY+POlkFkvVQDF9qJ2tdYoO49OpTQk4Zwtty3V
 yB4R5wnyNzuTojxIj6m1w5gF7JrxfWs2R/X+vyuL+VKAhNCHj8DoSiFRRHCqeTjb8u0ywaMGk
 GMHvfMHySEeBosMu8Kx9uqvYjXQIeOyKuBU5OB7JrQ8FYr6h01EG7n/zM66nr+ZM3xYi5kmpw
 mfW655+mdMbPp3AAzbNeay75I/6wx7Wb8J7uU1LKeP5jRSW44/x+3qzMYBgFHPIS7YPn5xrUt
 N6NFlJnHs9ZxiLDmR4pTUZfnoJsvHNMfRCUEFPqUzmVgDeONwFm94kKLoXNw/2aDMuqtkeVEn
 d8pO9qNGzhSKlX4G80Sf4X9vTf22gPGf1xMc3kKaQ8NOqMw4rXiBpf7PnplnEzFtLD4xuzaDx
 WsMCAXOfqHM8ZgyLWG27usxs2bnabyPo7ij0vNHNcHXR144S5JSfozAms8c+U9HzNsqLkiXdL
 kYeALesWMkMxhs2FNTW7rr20LCCJ9frejQEh6igex/UBO36YSyTNfTO2B2OFE30gidlJpQgvE
 EzuTSBlVLiMAmg1wSPYNgZrL8VTr2Nct1IO2+qp6qS+AhWho7qifQFc63XP2S4oL8iJD7A3HG
 08RI6Y4EJUFhRYx8LPIwl5ZfvC8PjwnLJ7/TldXBeNNeat0rT02YXBVlspTIp9dnfpAurmGBy
 P1hTsA1I0CaaQFxeVwHSokZpn0HJtgLJlfvsYoyx5G1qWCwciafVsISlwEg3yE/3PrR13V+Fo
 NCcvAioRQKQbSIUanH67SbBpzLu/o5NSfxyaDpDWBtzTOgtkvny59MfHXiIhHco9nH7zsukXu
 yrAOKlgHlejVorWh8cXMnRQN5BA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683490630; i=dalang@gmx.at;
 bh=wnxePhAfK13cE8WqojDvXy9+5pvu+oASJs2hy/xc524=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ho0Y2IP+bJ5NX+A+c0Xfa5Q7IFs95uaXa8C4nzbd78B59hrMu+0jaJSxcdRJdf6a2
 sc4B0iSBR6Dq5VLTs+UuRgI0WjPPA9K3iczUt1ngicprsN5kX3Aqv9ZMZ6UCkNGRTy
 JsgVpk00fjEycmFlI3E2Fs/gy7+2ihZ2n5VNcgX++1eHK3ZXhliR6TwGAMqgMvk6rG
 ZMHYoQGAlbAUo+bw1UfoF8/s5VmMuasUeQKI3FKyyJ1K9+Gy54C1j4SD0OOPP2TGFH
 9UB1n7qkjDNRbXRkuJZcabb4i4Mxw5u84ohGgt5Cx++f2fLLRLgXssIQEJm/l0LvbI
 9R/fxmZRFfuaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=ho0Y2IP+
Subject: [Buildroot] [PATCH] package/cairomm1_14: use official website
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
Cc: Daniel Lang <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The website [1] states that the released version can be downloaded from
the cairo release area [2], which also features a sha1 hash.

[1]: https://www.cairographics.org/cairomm/
[2]: https://www.cairographics.org/releases/

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v1 -> v2:
- split patch from unrelated cairomm patches
---
 package/cairomm1_14/Config.in        | 2 +-
 package/cairomm1_14/cairomm1_14.hash | 5 ++++-
 package/cairomm1_14/cairomm1_14.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/cairomm1_14/Config.in b/package/cairomm1_14/Config.in
index 6e767d2428..e369aa6f4a 100644
--- a/package/cairomm1_14/Config.in
+++ b/package/cairomm1_14/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_CAIROMM1_14
 	  This is the last version before the API and ABI change
 	  introduced in 1.16.0 which requires C++17.
 
-	  http://www.gtkmm.org/
+	  https://www.cairographics.org/cairomm/
 
 comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
index 521e7cc546..6d58de360a 100644
--- a/package/cairomm1_14/cairomm1_14.hash
+++ b/package/cairomm1_14/cairomm1_14.hash
@@ -1,3 +1,6 @@
+# From https://www.cairographics.org/releases/cairomm-1.14.4.tar.xz.sha1
+sha1  a58419bb9792a2c998631704ce5671c38e0c82a1  cairomm-1.14.4.tar.xz
+
 # Locally computed
-sha256  ee12b920b2d47cea1b6e20c367690d726eb22b4ca9fc711db329d03adcc0c8e0  cairomm-1.14.4.tar.gz
+sha256  4749d25a2b2ef67cc0c014caaf5c87fa46792fc4b3ede186fb0fc932d2055158  cairomm-1.14.4.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
index 5d076ddf0a..6502d34c5a 100644
--- a/package/cairomm1_14/cairomm1_14.mk
+++ b/package/cairomm1_14/cairomm1_14.mk
@@ -7,8 +7,8 @@
 CAIROMM1_14_VERSION = 1.14.4
 CAIROMM1_14_LICENSE = LGPL-2.0+
 CAIROMM1_14_LICENSE_FILES = COPYING
-CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.gz
-CAIROMM1_14_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM1_14_VERSION)
+CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.xz
+CAIROMM1_14_SITE = https://cairographics.org/releases
 CAIROMM1_14_INSTALL_STAGING = YES
 CAIROMM1_14_DEPENDENCIES = cairo libglib2 libsigc2 host-pkgconf
 CAIROMM1_14_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
