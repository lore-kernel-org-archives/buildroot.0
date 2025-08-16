Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728D4CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48E3C61573;
	Sat, 16 Aug 2025 20:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTUl_Y2OZlNI; Sat, 16 Aug 2025 20:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4CBF6155E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4CBF6155E;
	Sat, 16 Aug 2025 20:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A7F6197
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4335B414DE
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXxh5jUyjbvv for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2375414EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2375414EC
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:55:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E20168768E; Sat, 16 Aug 2025 20:55:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 22:55:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a46810838a57ed82dd2b794600ecc22995776d87
X-Git-Newrev: 0fc81120335e3fc2161e409dc94afff162167bf3
X-Patchwork-Hint: ignore
Message-Id: <20250816205522.E20168768E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcue: add CPE vendor
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fc81120335e3fc2161e409dc94afff162167bf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lipnitsk is a valid CPE vendor ID for libcue, see
https://nvd.nist.gov/products/cpe/detail/79A927B3-A7E5-476D-94C9-0FA0AB71D182

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcue/libcue.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 7ef27f5a17..8eac4725c9 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -10,5 +10,6 @@ LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
 LIBCUE_LICENSE_FILES = LICENSE
 LIBCUE_DEPENDENCIES = host-bison host-flex flex
 LIBCUE_INSTALL_STAGING = YES
+LIBCUE_CPE_ID_VENDOR = lipnitsk
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
