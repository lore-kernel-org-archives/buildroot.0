Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CBBC001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 09:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6577240BD6;
	Tue, 15 Aug 2023 09:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6577240BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Snh5COqHjMpi; Tue, 15 Aug 2023 09:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A413140BEA;
	Tue, 15 Aug 2023 09:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A413140BEA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C47341BF2FF
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 09:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C5680C1B
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 09:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C5680C1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aeZVT6TtMhi for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 09:54:28 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 084C780310
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 09:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 084C780310
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 12F2513F8D4;
 Tue, 15 Aug 2023 11:54:24 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 11:54:17 +0200
Message-ID: <20230815095417.15951-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692093265;
 bh=MZPGFEEnINJQRdwFGlE3Or9MljxFYuFi+UfVNJNdKOo=;
 h=From:To:Cc:Subject:Date:From;
 b=gOrbNYeJ5I2LGFekdWtQfHrJ/4UWRdEtMysdYDrotk0ySL3jXRBU/l0dXY5C1jaj+
 MrGsHAhZjZbtw39Hb8W3K4uK7js2cNO2rej2v1Rj/8JkvHnjux1gYAKCkKaUH0+uMX
 wMhLzD/Guj9LFSZO3Ca6l/DTplYU9kfDt0oYiafG21Z7t9+NILLXqU4J+q15CHYje7
 QiIir+7wKh25EiWBmYJIxKBgkJ0Xd970uFe1zZjxJCWBI3x8ncCm/wjYkT1R6sNejT
 727Jf5XYcV/zALJvYX8X7vNnAWd5jo+qCLBKcPm4/qk8xtrT8FANsq1N6bVlW38IM9
 BMcYFdvScsQuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gOrbNYeJ
Subject: [Buildroot] [PATCH next 1/1] DEVELOPERS: fix entry for
 board/firefly/roc-rk3399-pc/
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit b86adfb89a "configs/roc_rk3399_pc: new defconfig" introduced an
incorrect DEVELOPERS file entry for the directory
"board/firefly/roc-rk3399/". The correct directory name is
"roc-rk3399-pc".

Using the get-developers script on any file generates a warning,
for example:

    utils/get-developers DEVELOPERS
    WARNING: 'board/firefly/roc-rk3399/' doesn't match any file, line 2584
    git send-email --to buildroot@buildroot.org

This commit fixes the issue by putting the correct directory name.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 69ab723c0c..705aae9501 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2581,7 +2581,7 @@ N:	Robert Rose <robertroyrose@gmail.com>
 F:	package/grpc/
 
 N:	Roberto Medina <robertoxmed@gmail.com>
-F:	board/firefly/roc-rk3399/
+F:	board/firefly/roc-rk3399-pc/
 F:	configs/roc_pc_rk3399_defconfig
 
 N:	Rodrigo Rebello <rprebello@gmail.com>
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
