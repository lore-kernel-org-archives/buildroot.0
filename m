Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E2AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D2060F46
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48D2060F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D0A80E62;
	Sun, 14 Nov 2021 14:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDHp3gE3I9FH; Sun, 14 Nov 2021 14:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5002080E5A;
	Sun, 14 Nov 2021 14:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6EE71BF973
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B65FF4022B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Iymh6Z1cWxS for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:02:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC31E400DA
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:02:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7B9D48D1B2; Sun, 14 Nov 2021 13:58:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:02:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1faa87f4a9817f8a1cbbc1e33a02bd6d8577b292
X-Git-Newrev: fb89f8634915f12b047fe4c19b4cd60358f0a3df
X-Patchwork-Hint: ignore
Message-Id: <20211114135807.7B9D48D1B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: update the list of libffi
 unsupported archs
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb89f8634915f12b047fe4c19b4cd60358f0a3df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libffi supports ARC since commit 34c2afeb750 ("libffi: back-port support
for ARC") in 2014.

Add nds32 and ARMv7-M to the list.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
