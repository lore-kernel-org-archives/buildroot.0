Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6869C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A39DB823E8;
	Sun, 12 Dec 2021 22:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id btow_aAjGLzN; Sun, 12 Dec 2021 22:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDEB28174F;
	Sun, 12 Dec 2021 22:28:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A496A1BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9494F4030D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65r7KNOQISCg for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B3EE4030B
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D18848375C; Sun, 12 Dec 2021 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:21:44 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 5c0d52eba83b545cdae9710fb31b83a39ea9c1ac
X-Git-Newrev: 2bfa334e0e373f0ca95a7d45dd724d408f1c5595
X-Patchwork-Hint: ignore
Message-Id: <20211212221828.D18848375C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/hplip: add CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bfa334e0e373f0ca95a7d45dd724d408f1c5595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:hp:linux_imaging_and_printing_project is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahp%3Alinux_imaging_and_printing_project

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3c4cd280eb720b095efdf1bb78a502d246a5601a)
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
