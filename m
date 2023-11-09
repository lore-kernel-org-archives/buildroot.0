Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F300C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 11:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3570D41598;
	Thu,  9 Nov 2023 11:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3570D41598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXwOEPoDF9sW; Thu,  9 Nov 2023 11:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A0464155F;
	Thu,  9 Nov 2023 11:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A0464155F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D19111BF28A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6CB5409F3
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6CB5409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bv1Uy1ze11Pq for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 11:19:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCA8040119
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 11:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCA8040119
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A79C886DD9; Thu,  9 Nov 2023 11:19:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 12:15:19 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ea2695a1b0032425c7e2d42b368699e7ba230d92
X-Git-Newrev: 4f7bf0937b47cb7fdcc7cb2b1e5d6fa6ef414e80
X-Patchwork-Hint: ignore
Message-Id: <20231109111952.A79C886DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] Makefile: drop
 gen-missing-cpe leftovers
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f7bf0937b47cb7fdcc7cb2b1e5d6fa6ef414e80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

In 6fa3a239 the gen-missing-cpe support script was removed together with
"make missing-cpe".
Remove the leftover path variable and drop it from "make clean".

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8a307fbac92181caf333289c031ec9eb7680203b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index aea73878c0..6abbca4414 100644
--- a/Makefile
+++ b/Makefile
@@ -227,8 +227,6 @@ LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
-CPE_UPDATES_DIR = $(BASE_DIR)/cpe-updates
-
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -1098,8 +1096,7 @@ show-vars:
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(CPE_UPDATES_DIR) \
-		$(O)/pkg-stats.*
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(O)/pkg-stats.*
 
 .PHONY: distclean
 distclean: clean
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
