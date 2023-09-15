Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68F4CD37AD
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5657E61404;
	Fri, 15 Sep 2023 22:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5657E61404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Woz7r6iloaDU; Fri, 15 Sep 2023 22:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E500613F0;
	Fri, 15 Sep 2023 22:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E500613F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0831BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7537383ED6
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7537383ED6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxuXdhN6w-bM for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:22:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA74083ECB
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA74083ECB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B649C870A6; Fri, 15 Sep 2023 22:22:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 00:21:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ccfb2561f2a1e3ec874301e786f30d85307051d
X-Git-Newrev: bdab457768b336a442897137c4f62d4e387b3d10
X-Patchwork-Hint: ignore
Message-Id: <20230915222207.B649C870A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdadm: add MDADM_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdab457768b336a442897137c4f62d4e387b3d10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mdadm_project:mdadm is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/A4FAEC6A-3572-48E9-ABB8-C96D8C8B91AF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mdadm/mdadm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index c61937306a..ef518cd238 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -9,6 +9,7 @@ MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
+MDADM_CPE_ID_VENDOR = mdadm_project
 
 MDADM_CXFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
