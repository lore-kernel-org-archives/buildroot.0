Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8722DCE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 412126118F;
	Mon, 25 Sep 2023 12:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 412126118F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qB_cZHcD244A; Mon, 25 Sep 2023 12:03:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 829D761166;
	Mon, 25 Sep 2023 12:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 829D761166
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7CA1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC9F881B9A
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC9F881B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zzEEN6F9smZ for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1EE581FD4
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1EE581FD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C07D887745; Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:59:40 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 54496cbcdc3cc58af2626c1682789ec55227063f
X-Git-Newrev: 7b18c5c56be1b2ca68272a8b0d6a7a65f0923ea1
X-Patchwork-Hint: ignore
Message-Id: <20230925120252.C07D887745@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/tar: drop
 CVE-2007-4476 from IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b18c5c56be1b2ca68272a8b0d6a7a65f0923ea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

As off 2021-05-17 NVD added 1.19 as the first version that isn't
affected by CVE-2007-4476.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 487c12a1f29140bf61abcf4cc575bd83b1fc933b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
