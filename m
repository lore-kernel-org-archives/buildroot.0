Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CD7C433FE
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:47:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1518C608FB
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1518C608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DACC380F86;
	Wed,  3 Nov 2021 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYoCJnLh6aPO; Wed,  3 Nov 2021 17:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50EC280F7D;
	Wed,  3 Nov 2021 17:47:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86F5B1BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 766D360AD8
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUpU9xmHLMSi for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:47:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7DD160630
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:47:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8FDE18A311; Wed,  3 Nov 2021 17:43:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 18:47:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f032973fc56ba4a73d95927384d2a5d185f2ddce
X-Git-Newrev: 1b31b4b9cef2f959915128babc5c00354f9e949f
X-Patchwork-Hint: ignore
Message-Id: <20211103174326.8FDE18A311@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to all
 Olimex Allwinner boards' defconfigs
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b31b4b9cef2f959915128babc5c00354f9e949f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Giulio Benetti to all Olimex Allwinner boards' defconfigs since I've
recently updated and tested them all and I'd like to receive possible
build failure from gitlab CI/CD.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4ddd855233..efc7344856 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1050,8 +1050,10 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
 F:	package/erlang-jiffy/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
