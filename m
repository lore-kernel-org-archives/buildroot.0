Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330A2C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F223360EE8;
	Tue,  7 Jun 2022 19:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDRJHkiM4ev8; Tue,  7 Jun 2022 19:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F96660F93;
	Tue,  7 Jun 2022 19:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABC101BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A51998408D
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7fkjqit8GpG for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2723684005
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A8FA86E22; Tue,  7 Jun 2022 19:04:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 23:22:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dac6e3011883ce3b35cbf64ec156186153bf0032
X-Git-Newrev: f31696e1a114883c363bf7bf3bde5bff89de6fac
X-Patchwork-Hint: ignore
Message-Id: <20220607190458.1A8FA86E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtasn1: add build support for
 host
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

commit: https://git.buildroot.net/buildroot/commit/?id=f31696e1a114883c363bf7bf3bde5bff89de6fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtasn1/libtasn1.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index ba86081df9..11ab223962 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -29,3 +29,4 @@ endef
 LIBTASN1_POST_INSTALL_TARGET_HOOKS += LIBTASN1_REMOVE_PROGS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
