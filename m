Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD3C00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3156061159;
	Tue,  1 Aug 2023 21:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3156061159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-thG7JaSSTO; Tue,  1 Aug 2023 21:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7433A60E7E;
	Tue,  1 Aug 2023 21:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7433A60E7E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2CB1BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C15534008E
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C15534008E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlMS-Eq8xpE6 for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:04:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E228A4018B
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E228A4018B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD02483F99; Tue,  1 Aug 2023 21:04:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 22:49:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ca683b105f3192b3a56db1ecbb88635b6a6af39
X-Git-Newrev: 60fedc6c1d434d3e125c564f6d4f199bfb3b15a4
X-Patchwork-Hint: ignore
Message-Id: <20230801210427.CD02483F99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oniguruma: add a host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=60fedc6c1d434d3e125c564f6d4f199bfb3b15a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for the creation of an host-php package.

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/oniguruma/oniguruma.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index f5ac810c10..e81190c0c6 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -14,3 +14,4 @@ ONIGURUMA_CPE_ID_VENDOR = oniguruma_project
 ONIGURUMA_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
