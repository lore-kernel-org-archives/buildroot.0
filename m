Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF52C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 01:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0813423F9;
	Sat,  2 Dec 2023 01:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0813423F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqQzFq4l5MtH; Sat,  2 Dec 2023 01:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB596423F4;
	Sat,  2 Dec 2023 01:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB596423F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8A081BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 01:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AC4260BEF
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 01:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC4260BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnrbGzKSkRhD for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 01:50:03 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97C3460ADE
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 01:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C3460ADE
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9F8prKWYnwUld9F8qrOaTm; Sat, 02 Dec 2023 02:50:00 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 02:49:59 +0100
Message-Id: <20231202014959.2609255-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFqLg4/75wI7YAnFKkEx7Ta0YZrmSAg7JYvAEdrzr5whZJxjhBzAyCuNi+w/cF7QzbEiE5eqbQYyBAn8zMAR0fdWyEjqqiOlvyKl7b1mhxQ0vMs77/ma
 NqPKXNobeFzRdkzvpUJZYXGaY3rG3Pbv6zkxB8mU0AJ5sZvWohNcI/JzGJiouG1C9Zkeb/BwuRQVXS9sY777oAOB/SBMmN70hatc0lAihyXZtsZ/IavMSShs
 JhiT33xA/LtaC6gbmwL/Dg7HXLrAaddAmdqjSL4bGQb2TsrrEhy1pZi+6xQuCJ6ex86Yaq2m7XjIoVkDzJq/Iw/EPLbpbHV+2N/CWLPAfJRg6O6BAnTQxiux
 j4hoW8y9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701481800; bh=/kRG5VAdlZ5bCw2Ag7uKBpc8+TFsC7OEvndAF74HM/M=;
 h=From:To:Subject:Date:MIME-Version;
 b=DwLONzDZT18CGQ+k3fkpDFhlZutX7mlNiBKBwd1oxPY9y/qyh+Ozhqzo5OwMAqQyo
 A8ceQWFQPeqtt+eGrtTunh6ROnb31olH16azqXICTLzvfDhnoRLzhnh6FiOW1G5RAc
 SoYxf21wUjzyNXrxbFXiL5XsJDxCEmdZ6+ANMkd+g9gzdKgtY4zFLXBGUFY1S9Y2fY
 7SYL3zDHUEapqdPtQL+XBnBVrpkamdKBqLe+Vc0xIDnedskhp11noMUYjoe+qGm/n5
 CYXbuJSbuZurahsFZ/VbZ/zXsekwuR09f4DVhtByg8UwZni7KP0wdR/Pms2yWtnHLJ
 JuJmdC5yInmRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DwLONzDZ
Subject: [Buildroot] [PATCH] package/freescale-imx: append /imx6ulz to
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

imx6ulz supports freescale-imx too so let's add it to the bool name for
completeness.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/freescale-imx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index fe3f265941..1c26b3cc6f 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	bool "imx6sl/imx6sx"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
-	bool "imx6ul/imx6ull"
+	bool "imx6ul/imx6ull/imx6ulz"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	bool "imx7d/imx7ulp"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
