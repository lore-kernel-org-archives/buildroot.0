Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAB2C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8577D60EE6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8577D60EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6299D6059B;
	Sat,  4 Sep 2021 21:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slP7sY0JQVXS; Sat,  4 Sep 2021 21:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD3A5605E0;
	Sat,  4 Sep 2021 21:05:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0871BF28F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEB2580EF8
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcpyfLG4KcGb for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:03:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38F2580EE7
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:03:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AC9B5884F6; Sat,  4 Sep 2021 21:02:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:58:16 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: a2f6f62ca068e5ec1878f694d8588c9fa64c5415
X-Git-Newrev: d6d36d6bf267de882a375053bba7e9a17526a49e
X-Patchwork-Hint: ignore
Message-Id: <20210904210214.AC9B5884F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/iozone: update
 IOZONE_VERSION
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6d36d6bf267de882a375053bba7e9a17526a49e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Update IOZONE_VERSION to reflect what is used by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1e75050bbb9180b2d0861ca10a4c86fd004670dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iozone/iozone.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index ebb6243651..32d57ea76e 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_490
-IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
+IOZONE_VERSION = 3.490
+IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # IOzone license details can be found at:
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
