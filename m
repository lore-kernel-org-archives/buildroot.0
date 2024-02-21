Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9BAC54788
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 21:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC85B60F79;
	Wed, 21 Feb 2024 21:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YM8bDhifHcNh; Wed, 21 Feb 2024 21:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3966760856
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3966760856;
	Wed, 21 Feb 2024 21:40:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5C821BF36F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D1DD40310
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szaQ8Kg2rfxU for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 21:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E257640259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E257640259
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E257640259
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:40:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuJyrqwWLMMFBcuK0rhA5C; Wed, 21 Feb 2024 22:40:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 22:40:01 +0100
Message-Id: <20240221214005.176433-6-giulio.benetti@benettiengineering.com>
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
 t=1708551609; bh=QLHSPkcuEh2Yn8D//nH2YtuZnggryDj+tBO1VlkeUr0=;
 h=From:To:Subject:Date:MIME-Version;
 b=cjRPITknA7hzhREiYVry7zXNjJq2CuDkTUodr+uZPcqCVj9CivE0aePD0sRRNxJ6B
 Ac4KQSG5WN7uMhknINnsWCyLOAbwzsiiYZa4xgOnJFMIdVAiALpdiQDzw/uOwU8IdO
 xws9THTzoFuGm0SqxYDhJV06brhckuc3K9aCFvjt63kDlx/wPsoCwROKXRNuX/DNNX
 8AyGKcxfsi1qxptMxmtpFzyWiSSZIcO3jf8KRNcrrHRscn+46PAPxnyiInHSBdh1QT
 A54tMe/zlN0ucnQxBs9tbSeUv1Ciuwp3PlRzz6NO9f5lEkp9pmKkNEFhKTJFj7b1lb
 J8ctSAwEnMz4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=cjRPITkn
Subject: [Buildroot] [PATCH v2 5/9] package/libcamera: drop nios2 binutils
 bug 27597 dependency
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
---
 package/libcamera/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index ccb5281b4b..e84b8d342e 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	default y
 	# Invalid packing size of ControlValue struct on m68k
 	depends on !BR2_m68k
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 
 menuconfig BR2_PACKAGE_LIBCAMERA
 	bool "libcamera"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
