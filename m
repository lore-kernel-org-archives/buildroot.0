Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2088C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3C441CD7;
	Sun, 12 Mar 2023 22:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3C441CD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wy6JJoX7rT29; Sun, 12 Mar 2023 22:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43536417A7;
	Sun, 12 Mar 2023 22:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43536417A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E08F1BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8E704058B
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8E704058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGfLa5pxLPer for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CFEB40610
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CFEB40610
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C7D587045; Sun, 12 Mar 2023 22:15:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:13:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dfa40b9ab3d0425c7760f0b27e5ecc91c659bac
X-Git-Newrev: 0d8b27841fe6aad8e9bb4a083c3aeb863d3e0913
X-Patchwork-Hint: ignore
Message-Id: <20230312221502.1C7D587045@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kexec: add KEXEC_CPE_ID_{PRODUCT,
 VENDOR}
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d8b27841fe6aad8e9bb4a083c3aeb863d3e0913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:kexec-tools_project:kexec-tools is a valid CPE identifier
for this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akexec-tools_project%3Akexec-tools

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kexec/kexec.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index c1411f6ab7..562b09012b 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -9,6 +9,8 @@ KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
 KEXEC_LICENSE_FILES = COPYING
+KEXEC_CPE_ID_PRODUCT = kexec-tools
+KEXEC_CPE_ID_VENDOR = kexec-tools_project
 KEXEC_SELINUX_MODULES = kdump
 
 # Makefile expects $STRIP -o to work, so needed for !BR2_STRIP_strip
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
