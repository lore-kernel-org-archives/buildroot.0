Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65576C54788
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 21:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07416605BB;
	Wed, 21 Feb 2024 21:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmxwjn4cAXfE; Wed, 21 Feb 2024 21:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD836062A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD836062A;
	Wed, 21 Feb 2024 21:40:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A95F41BF947
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A16446062A
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1P1Fs1W191D for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 21:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2BA6605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2BA6605BB
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2BA6605BB
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:40:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuJyrqwWLMMFBcuK1rhA5Q; Wed, 21 Feb 2024 22:40:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 22:40:02 +0100
Message-Id: <20240221214005.176433-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
References: <20240218230524.639348e6@windsurf>
 <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLpQJjz7ZiEaX+U8BUlPdc0P6Bd7pkMzozxJTSQgON/Q6QxBtpocsnIAg3GBEmkyykSQITG0RoeaED5GXBI8BHUidUWMAK1hl0bLJ6v64fp99dW7vlkp
 /dfCzeX+2TrqFWSIocbAe+eGh8LCQRTrH5s6fq7zBePGOG2n+dy7rBKr7mu74oeW9Oj07C+asuZQnkcgqoVbaSYv80Kjr/YOMEVrv+mpMngNCysBhauXrFGx
 fHmEVre5AZWnnwWuNglxeb038vn4t4f7V2CoQdj5RLGzZMIcusOOJVhl3TsYv78++2PIFYBmS3fmmS030Vm5xRoZOklZxjbBDdKHvvL9CmqBQUbOPZBEp0ae
 G+iv9AguXvTQ7sQfhYQOBfsxWVITfZ8cT35k0iszTfh0g+OjsQFiPoKUy2EkUzujVhDmACZE6GYPBdb0LF90CRYm8zDyEUzJgupoSbIBFvdnGC31mVJ0D88L
 4QaeF9MiFF2wY2su/F+d/gH6iAq3AqUf7eMWLZNCqNON7jbmJ0pTr6KSwQ7Jvszb+9YxlIedD7V/46HpwO7NKw0WspwzpxYkPcDxL0qbVBWjIKB54S8DN4vr
 S27QJJOlm5K6teBfhTgMbB9PyNyFOqy/LOeN7Nt2uT04FPmDHBL/fCzNcIdwjoig784=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708551609; bh=P3jatE99VzQ4Qzo/qov2KlkAvQGeyoLg/M7yatM0El4=;
 h=From:To:Subject:Date:MIME-Version;
 b=FBmRTCXK/9zmXRrK887383TgMJRyx6Ji7bRhtceTuwOXtfPVVhNLrjm/L6bra9HcV
 lfGdttFx5iKYyuH5GJM+f8M290Ebpb0lzyCyShb9DtAp4WLYgepSVgh9uGCuZqYxCP
 X/GgRULngUBD/RMAy8vriGgdEg+CTzpdPio3SO1wLnGbWgzTMeLJmcbA+iWOy4Z2fv
 ouFmbmBD/I2gqFiLgqP0a9TZeLbSWPM5DsXsQTc8y06Ywx+IlNm8GhQ3JJpF5hOQ3T
 1MqgiXGwc7Ylu8TvuBfJCJnoiRATqbUtpqkCoy5eGfkfRvNYZACQKip0TMPPDQigMh
 ya/6FQk05r2Tg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FBmRTCXK
Subject: [Buildroot] [PATCH v2 6/9] package/libgeos: drop nios2 binutils bug
 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 2a27c6f2a4..76cbb9bdcd 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -14,8 +13,7 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads not binutils bug 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
