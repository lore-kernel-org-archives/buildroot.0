Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F12C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A896340199;
	Mon, 11 Sep 2023 19:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A896340199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBuCITnBmsFF; Mon, 11 Sep 2023 19:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD226414FD;
	Mon, 11 Sep 2023 19:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD226414FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF8E91BF95F
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A512B4188B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A512B4188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppz8g_rD5I3K for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E91E4187A
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E91E4187A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B18386C59; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:17:05 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 5e857a47437abf4929ad0cf77ded9d74acb5e56e
X-Git-Newrev: a472c7278a105f7de565ed517012b0299d2aea0f
X-Patchwork-Hint: ignore
Message-Id: <20230911190748.8B18386C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/aubio: add
 AUBIO_CPE_ID_VENDOR
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
Content-Type: multipart/mixed; boundary="===============4777496415683861716=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4777496415683861716==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a472c7278a105f7de565ed517012b0299d2aea0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

cpe:2.3:a:aubio:aubio is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=aubio

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 969bd6e3ddf3567495bab190e828dc9135d31e87)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aubio/aubio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index 64174a113d..bfc627fa91 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -9,6 +9,7 @@ AUBIO_SITE = https://aubio.org/pub
 AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
 AUBIO_LICENSE = GPL-3.0+
 AUBIO_LICENSE_FILES = COPYING
+AUBIO_CPE_ID_VENDOR = aubio
 AUBIO_INSTALL_STAGING = YES
 
 AUBIO_DEPENDENCIES = host-pkgconf

--===============4777496415683861716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4777496415683861716==--
