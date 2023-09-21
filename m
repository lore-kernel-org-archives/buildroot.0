Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77802E7070E
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDB783C74;
	Thu, 21 Sep 2023 10:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDB783C74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKee_AGPTlme; Thu, 21 Sep 2023 10:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791E483C5E;
	Thu, 21 Sep 2023 10:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 791E483C5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E61C11BF3C2
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBFEC4048C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBFEC4048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2_z9MetQnSI for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:32:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B4A54014D
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B4A54014D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A4EB87425; Thu, 21 Sep 2023 10:32:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 12:32:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43dbfe4670c3283ea1b2f9a884a09ea6f8f9dcb9
X-Git-Newrev: 487c12a1f29140bf61abcf4cc575bd83b1fc933b
X-Patchwork-Hint: ignore
Message-Id: <20230921103226.0A4EB87425@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: drop CVE-2007-4476 from
 IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=487c12a1f29140bf61abcf4cc575bd83b1fc933b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As off 2021-05-17 NVD added 1.19 as the first version that isn't
affected by CVE-2007-4476.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tar/tar.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 80d7495b00..690a5952ba 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,8 +13,6 @@ TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
-# only tar <= 1.16
-TAR_IGNORE_CVES += CVE-2007-4476
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
