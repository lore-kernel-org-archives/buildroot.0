Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFBFC3DA7A
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 13:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 954C060AC1;
	Sat, 31 Dec 2022 13:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 954C060AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9fG03DSzAki; Sat, 31 Dec 2022 13:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF1460774;
	Sat, 31 Dec 2022 13:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF1460774
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B17CE1BF2EF
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D46E60A99
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D46E60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJkRWZqzU-8a for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 13:56:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EAE860644
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EAE860644
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 13:56:26 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.133.83])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D18135FF9E;
 Sat, 31 Dec 2022 14:56:19 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 14:55:58 +0100
Message-Id: <20221231135559.34464-3-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231135559.34464-1-ju.o@free.fr>
References: <20221231135559.34464-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672494984;
 bh=Ee2LefrV//WESOpAEAMTWUbiLbW/WsnS+TVWwwB0efc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YBEHRhZtaKd7UqW22//CMLCHXdb1tABA8orjtrgpvk4AbhnC4ZDSsy+osoDLw53LZ
 BKwWB5WJfyd4vNVSop10PtsdRBWv7U9dlHiCKDKtLHMM1LDawqvB8XGA1QPGy5jIzK
 1eqOeo/kAZxMKEu1Scy/u6AeJWRacnNBOYqnu0yso11n2LYpNEgaJPghDgdAzEmqLP
 IHhDr6pfiLZjDikfYl9SpNFC+5eJje7pKMYdTUuDpcDnL9iBEcf0G2JocD84VLc0e5
 dovONeSz3Cz6eURF51YeeDdE8EBrGvmxaNE6l/J/7mQIAqZn5TU5xuRs6wsnnXEp0Y
 Z3vqp9jLtslPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YBEHRhZt
Subject: [Buildroot] [PATCH 3/4] board/freescale/imx6sabre/readme.txt:
 update broken urls
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://freescale.com/ urls are all redirected to the NXP homepage
https://www.nxp.com/

Even if the links are not broken in the sense of a 404 http error, the
pointed resources are not found.

This commit updates the old freescale links to the correct nxp.com
locations.

Note: the link to the SABRE for Automotive Infotainment Quick Start
Guide now requires a free registration to be accessed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/imx6sabre/readme.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
index 4b8db5233a..320ee463e2 100644
--- a/board/freescale/imx6sabre/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -8,15 +8,15 @@ as well as the Freescale SABRE Board for Automotive Infotainment.
 
 Read the i.MX 6 SABRESD Quick Start Guide for an introduction to the
 board:
-http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
+https://www.nxp.com/files-static/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
 
 Read the i.MX 6 SoloX SABRESD Quick Start Guide for an introduction to
 the board:
-http://cache.freescale.com/files/32bit/doc/user_guide/IMX6SOLOXQSG.pdf
+https://www.nxp.com/files-static/32bit/doc/quick_start_guide/IMX6SOLOXQSG.pdf
 
 Read the SABRE for Automotive Infotainment Quick Start Guide for an
 introduction to the board:
-http://cache.freescale.com/files/32bit/doc/user_guide/IMX6SABREINFOQSG.pdf
+https://www.nxp.com/webapp/Download?colCode=IMX6SABREINFOQSG
 
 Building with NXP kernel and NXP U-Boot
 =======================================
@@ -166,6 +166,6 @@ Enjoy!
 References
 ==========
 
-https://community.freescale.com/docs/DOC-95015
-https://community.freescale.com/docs/DOC-95017
-https://community.freescale.com/docs/DOC-99218
+https://community.nxp.com/docs/DOC-95015
+https://community.nxp.com/docs/DOC-95017
+https://community.nxp.com/docs/DOC-99218
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
