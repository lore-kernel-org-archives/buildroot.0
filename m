Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055A0C3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 21:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE97360FA0;
	Tue,  3 Jan 2023 21:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE97360FA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aswBRPWn0DLQ; Tue,  3 Jan 2023 21:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0932760D4F;
	Tue,  3 Jan 2023 21:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0932760D4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4781BF2FC
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26256401F3
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26256401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlMA-tvsMtlo for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 21:26:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FC83400BF
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 21:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FC83400BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AF46873A3; Tue,  3 Jan 2023 21:26:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Jan 2023 22:21:33 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b11cdaff45e00f8e0315942561a1baab099fd586
X-Git-Newrev: a0d4d2c3f44f3904be2b3b606546fbdb82224e74
X-Patchwork-Hint: ignore
Message-Id: <20230103212635.4AF46873A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/freescale-imx:
 update SITE to directly use https
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0d4d2c3f44f3904be2b3b606546fbdb82224e74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

http://www.nxp.com/ has a redirect to https://www.nxp.com/ for quite
some time now. It is also quite common to directly hit https:// urls
now.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dc23c61e4d3fa9557db4977b8d30905a3f55e83d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/freescale-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 5f32a098a2..b119d90ec3 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,6 +4,6 @@
 #
 ################################################################################
 
-FREESCALE_IMX_SITE = http://www.nxp.com/lgfiles/NMG/MAD/YOCTO
+FREESCALE_IMX_SITE = https://www.nxp.com/lgfiles/NMG/MAD/YOCTO
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
