Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082DDC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B864A40C1B;
	Tue,  8 Aug 2023 16:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B864A40C1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGchtgdv_sZv; Tue,  8 Aug 2023 16:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD23F40C0E;
	Tue,  8 Aug 2023 16:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD23F40C0E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03E561BF5A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCDCB4062E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCDCB4062E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P898JE0zo0_s for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:49:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5FF6405CE
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 16:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5FF6405CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A57EA84A59; Tue,  8 Aug 2023 16:49:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 18:49:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 262849c518cdd1357b99ef0143bd9434fd563569
X-Git-Newrev: 969bd6e3ddf3567495bab190e828dc9135d31e87
X-Patchwork-Hint: ignore
Message-Id: <20230808164942.A57EA84A59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aubio: add AUBIO_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9076772141810147759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9076772141810147759==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=969bd6e3ddf3567495bab190e828dc9135d31e87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:aubio:aubio is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=aubio

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============9076772141810147759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9076772141810147759==--
