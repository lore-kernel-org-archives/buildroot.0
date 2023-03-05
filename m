Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096FCC678DB
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 23:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FC5D4015F;
	Sun,  5 Mar 2023 23:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FC5D4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WjJSAZaK-yR; Sun,  5 Mar 2023 23:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC06740158;
	Sun,  5 Mar 2023 23:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC06740158
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 560D11BF42E
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 23:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 309D940137
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 23:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 309D940137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdryVz4ECxuj for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 23:25:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9BD4400D2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9BD4400D2
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 23:25:16 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.46.221])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C40E513F85F;
 Mon,  6 Mar 2023 00:25:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Mar 2023 00:25:04 +0100
Message-Id: <20230305232504.232860-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678058713;
 bh=FV6TeSjuhlAQBv5PGB86E5wrDfO50Mzv0i7ZfvO1+T0=;
 h=From:To:Cc:Subject:Date:From;
 b=B301E8AYPsDRRHck4WXGi0eA6bLDmUTv3QJqI1UHLA7T7BeID1poXin3JL+r2byTp
 wscKJw1oUKdpRpPDaEe2CFaZweCLH7kajA7yDIobOJhMp5KwbWko+cg3ohD+h2cXKe
 ghkbBijr06LWDo8YwuF7HXTtlZxu7S2q3pw/FzwW+Cl2J7Lu7uIYJkCjGzsR1HAsrf
 PYjZ4AAQHFXNAPZ9LMDtLXy+aIAq5NkG+5Z89/8mebedveO0oFw+9HYFCYh0wmODQ8
 2+OOnvojNYoQLS6g91NJHs8u+T/LpeIur03Ib25Xx+SjV4+yOg0tx4VSjFk8qfpW4e
 QRS0M7JzxirBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B301E8AY
Subject: [Buildroot] [PATCH next 1/1] package/bridge-utils: update project
 URL in Config.in help text
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

The old URL no longer works and shows "No repositories found".
Replace it with:
https://wiki.linuxfoundation.org/networking/bridge

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bridge-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
index de5883f063..2d886e2cb0 100644
--- a/package/bridge-utils/Config.in
+++ b/package/bridge-utils/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_BRIDGE_UTILS
 	  added. Instead use the bridge command from the iproute2
 	  package which supports more features.
 
-	  https://git.kernel.org/cgit/linux/kernel/git/shemminger/bridge-utils.git/
+	  https://wiki.linuxfoundation.org/networking/bridge
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
