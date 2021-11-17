Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D054C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:19:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6041061BCF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6041061BCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DCF2414C4;
	Wed, 17 Nov 2021 22:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ue2dTZCPXjHk; Wed, 17 Nov 2021 22:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D85D405CB;
	Wed, 17 Nov 2021 22:19:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 523F01BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EFAF60BBB
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFOTGQgBx_Zx for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:19:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5184460A93
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:19:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 393ED8D64E; Wed, 17 Nov 2021 22:15:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:17:38 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 9b51a0758deba5ed882955e6cf6e3ad2c5fa99bb
X-Git-Newrev: 608c98510fe7b0918203c6d6740ffb18678bfd18
X-Patchwork-Hint: ignore
Message-Id: <20211117221505.393ED8D64E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] docs/manual: update the
 list of libffi unsupported archs
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

commit: https://git.buildroot.net/buildroot/commit/?id=608c98510fe7b0918203c6d6740ffb18678bfd18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

libffi supports ARC since commit 34c2afeb750 ("libffi: back-port support
for ARC") in 2014.

Add nds32 and ARMv7-M to the list.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fb89f8634915f12b047fe4c19b4cd60358f0a3df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/known-issues.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
index ae29a48b38..616430b91c 100644
--- a/docs/manual/known-issues.txt
+++ b/docs/manual/known-issues.txt
@@ -7,7 +7,7 @@
   if such options contain a +$+ sign. For example, the following is known
   to break: +BR2_TARGET_LDFLAGS="-Wl,-rpath=\'$ORIGIN/../lib'"+
 
-* The +libffi+ package is not supported on the SuperH 2 and ARC
+* The +libffi+ package is not supported on the SuperH 2, nds32, and ARMv7-M
   architectures.
 
 * The +prboom+ package triggers a compiler failure with the SuperH 4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
