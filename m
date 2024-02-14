Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E107C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 09:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B00416BE;
	Wed, 14 Feb 2024 09:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVOKoQxcVrBa; Wed, 14 Feb 2024 09:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FAEB4171C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FAEB4171C;
	Wed, 14 Feb 2024 09:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9170E1BF398
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B8D860EFC
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHt3CvVVkuzA for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 09:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A02AF60ECC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A02AF60ECC
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:11:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 730CC8794A; Wed, 14 Feb 2024 09:11:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 10:02:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e889a1c9e983753dd0fa5062d3b9475a8cba6072
X-Git-Newrev: 4bcce65f634dfce8e6ee1961ed68df3e778cd945
X-Patchwork-Hint: ignore
Message-Id: <20240214091150.730CC8794A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-ele-imx:
 fix dependency comment condition
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4908105568593545448=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4908105568593545448==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4bcce65f634dfce8e6ee1961ed68df3e778cd945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency comment must be shown when the platform has no ELE and
not when the platform has no VPU.

Fixes: 69d127fe29dc ("package/freescale-imx/firmware-ele-imx: new package")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/firmware-ele-imx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
index 241ad3942d..a99cbc3392 100644
--- a/package/freescale-imx/firmware-ele-imx/Config.in
+++ b/package/freescale-imx/firmware-ele-imx/Config.in
@@ -1,5 +1,5 @@
 comment "firmware-ele-imx needs an i.MX platform with EdgeLock Secure Enclave"
-	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
 
 config BR2_PACKAGE_FIRMWARE_ELE_IMX
 	bool "firmware-ele-imx"

--===============4908105568593545448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4908105568593545448==--
