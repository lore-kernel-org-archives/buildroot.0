Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27A1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77286403E9;
	Sat,  4 Dec 2021 10:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FuWzXhMLdAyX; Sat,  4 Dec 2021 10:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D2C7403D4;
	Sat,  4 Dec 2021 10:25:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 110061BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4824A818DC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhBichxmDMo9 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D7A2819BC
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 25E618B7EE; Sat,  4 Dec 2021 10:19:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 11:15:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fffd2aade69a2f1db97c34d63fb05b6c8f9a31dc
X-Git-Newrev: d5d5d5593392e01e513c6c77ee2076790186b6d1
X-Patchwork-Hint: ignore
Message-Id: <20211204101906.25E618B7EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/motion: add MOTION_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5d5d5593392e01e513c6c77ee2076790186b6d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:motion_project:motion is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amotion_project%3Amotion

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/motion/motion.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index dae812b9a4..5d54ecea01 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -8,6 +8,7 @@ MOTION_VERSION = 4.4.0
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
+MOTION_CPE_ID_VENDOR = motion_project
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
