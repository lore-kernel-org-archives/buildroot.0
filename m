Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C506C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 13:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D83D681E2E;
	Wed,  8 Nov 2023 13:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D83D681E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Vq0OyLWhDl2; Wed,  8 Nov 2023 13:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12B8E81F47;
	Wed,  8 Nov 2023 13:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12B8E81F47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BABDD1BF3DE
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A007761087
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A007761087
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUBrVhsxglix for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 13:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 955E261046
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 13:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955E261046
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74B0A86CE0; Wed,  8 Nov 2023 13:45:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 14:30:39 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 311731068909b68ccda803eb03e090d84e6ada41
X-Git-Newrev: ffedde670193881edcf401faf49483c12bf78a3b
X-Patchwork-Hint: ignore
Message-Id: <20231108134559.74B0A86CE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/opusfile: add
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ffedde670193881edcf401faf49483c12bf78a3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:xiph:opusfile is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/BB1B035B-FCF0-4854-AB18-0FD1181B0CC3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 522f25ed42006c5d7e68ef4431fab538ac0ddc17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
