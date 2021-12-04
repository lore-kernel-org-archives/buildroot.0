Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C10C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF9A400E9;
	Sat,  4 Dec 2021 22:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVKskEH9qa83; Sat,  4 Dec 2021 22:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8572E401AF;
	Sat,  4 Dec 2021 22:51:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E270C1BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE69A401AF
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FlKkMNeAVNFc for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:51:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05CC7400E9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:51:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B53D693625; Sat,  4 Dec 2021 22:46:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:50:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca9008c7ad609345fa761dcb4a5c5162883ca020
X-Git-Newrev: 3c4cd280eb720b095efdf1bb78a502d246a5601a
X-Patchwork-Hint: ignore
Message-Id: <20211204224617.B53D693625@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hplip: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c4cd280eb720b095efdf1bb78a502d246a5601a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:hp:linux_imaging_and_printing_project is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahp%3Alinux_imaging_and_printing_project

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hplip/hplip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 9eac83d567..59a0f8ace0 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -10,6 +10,8 @@ HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
 HPLIP_LICENSE = GPL-2.0, BSD-3-Clause, MIT
 HPLIP_LICENSE_FILES = COPYING
+HPLIP_CPE_ID_VENDOR = hp
+HPLIP_CPE_ID_PRODUCT = linux_imaging_and_printing_project
 
 HPLIP_CONF_OPTS = \
 	--disable-qt4 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
