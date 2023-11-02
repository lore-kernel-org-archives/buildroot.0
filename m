Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AA3C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 13:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9BB043494;
	Thu,  2 Nov 2023 13:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9BB043494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vksJMYdh53JB; Thu,  2 Nov 2023 13:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5423B43478;
	Thu,  2 Nov 2023 13:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5423B43478
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B59141BF37A
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 13:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B7D143485
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 13:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B7D143485
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCnqLaLgiyAn for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 13:40:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8660343473
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 13:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8660343473
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F65886520; Thu,  2 Nov 2023 13:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Nov 2023 13:53:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c05f8d143f27a604ad51ab065b7047585e50c53
X-Git-Newrev: 522f25ed42006c5d7e68ef4431fab538ac0ddc17
X-Patchwork-Hint: ignore
Message-Id: <20231102134057.6F65886520@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opusfile: add
 OPUSFILE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=522f25ed42006c5d7e68ef4431fab538ac0ddc17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:xiph:opusfile is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/BB1B035B-FCF0-4854-AB18-0FD1181B0CC3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opusfile/opusfile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 63553a81e7..efd38c542c 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -9,6 +9,7 @@ OPUSFILE_SITE = https://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
+OPUSFILE_CPE_ID_VENDOR = xiph
 OPUSFILE_INSTALL_STAGING = YES
 
 # 0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
