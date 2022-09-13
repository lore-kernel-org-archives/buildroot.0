Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC4CC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3E8140A1E;
	Tue, 13 Sep 2022 12:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3E8140A1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpB8dKXaAN0l; Tue, 13 Sep 2022 12:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C727E40A0D;
	Tue, 13 Sep 2022 12:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C727E40A0D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF661BF3AD
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3435940A0D
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3435940A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dTe7rlzPTzl2 for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54AB6400F2
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54AB6400F2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 42AF78376C; Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 13:50:37 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: f2f19d3d45f51dba2ab849148043ac84e397b2a5
X-Git-Newrev: 4ac550227fff4c88336cd48e5447575eef1a17a1
X-Patchwork-Hint: ignore
Message-Id: <20220913123800.42AF78376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Makefile: enable checking
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ac550227fff4c88336cd48e5447575eef1a17a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Now that all hash files have been fixed, enable checking of hash
spacing in check-package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 64f1603bb805cd651d34a7cfe1a1c12c4242fed7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 412e1decd3..2c28f3cfc4 100644
--- a/Makefile
+++ b/Makefile
@@ -1246,7 +1246,7 @@ check-flake8:
 
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
