Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E45C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B30CE4059B;
	Tue,  7 Jun 2022 19:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAFicHGJKvgl; Tue,  7 Jun 2022 19:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCE5240639;
	Tue,  7 Jun 2022 19:17:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3033C1BF9B6
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F1260F6F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7oquE3I4Hu5 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D09E160F1D
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C3B9786E22; Tue,  7 Jun 2022 19:04:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 21:20:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b298db82fa7b108053f08110d50f4650fcc74ac
X-Git-Newrev: d35ba174095b86a0cf724179f7d4e8d0e3d9c127
X-Patchwork-Hint: ignore
Message-Id: <20220607190455.C3B9786E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-serial: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=d35ba174095b86a0cf724179f7d4e8d0e3d9c127
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed by the upcoming python-kflash package.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
[Thomas: split from a larger patch from Damien Le Moal]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-serial/python-serial.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index 249ea9d5a3..87cd9392f1 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -12,3 +12,4 @@ PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
