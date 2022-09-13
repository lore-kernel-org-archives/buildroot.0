Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8297DC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 243BB40A17;
	Tue, 13 Sep 2022 12:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 243BB40A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNuiVW_WI30K; Tue, 13 Sep 2022 12:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFA3E4047C;
	Tue, 13 Sep 2022 12:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFA3E4047C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6A41BF9B5
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B4D482E95
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B4D482E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcftdyofabxL for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E70082BFD
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E70082BFD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D01883753; Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 13:50:30 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e8c86bf95cc3d92aad48f5920f4b597e72557b42
X-Git-Newrev: f18d87065387e58df9b751aaa7f6df52695e7ca3
X-Patchwork-Hint: ignore
Message-Id: <20220913123609.3D01883753@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Makefile: enable checking
 of hash spacing in check-package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f18d87065387e58df9b751aaa7f6df52695e7ca3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Now that all hash files have been fixed, enable checking of hash
spacing in check-package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 64f1603bb805cd651d34a7cfe1a1c12c4242fed7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 17f2f912a4..ff5d5bb151 100644
--- a/Makefile
+++ b/Makefile
@@ -1248,7 +1248,7 @@ check-flake8:
 
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
-		-exec ./utils/check-package --exclude=Sob --exclude=HashSpaces {} +
+		-exec ./utils/check-package --exclude=Sob {} +
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
