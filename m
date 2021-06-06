Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD22C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:56:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97E9604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B97E9604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A40F404F1;
	Tue,  3 Aug 2021 22:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHgCo_QsnRAG; Tue,  3 Aug 2021 22:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 431C84052E;
	Tue,  3 Aug 2021 22:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1748C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D86F40630
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjPAa0Fe2kQp for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC98640608
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2D9EF85F62; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 09:25:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f1e014655da6b77c9e1768cb0d6fb78f1321ae5b
X-Git-Newrev: 6f63917485b109dc050aee65c9b98b1cb814b350
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.2D9EF85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/beaglev-ddrinit: update
 to include upstream fixes
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6f63917485b109dc050aee65c9b98b1cb814b350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update commit ID to include recent upstream fixes:

- Fix I and D cache synchronization issue (2e2f6faaf105)
- Add carriage return to correct menu formatting (2f6ea51dbb51)
- Add copyright info (7d3413d2ffd9)
- Expand the limit on the size of uboot when update it (623888127a0e)

Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/beaglev-ddrinit/beaglev-ddrinit.hash | 2 +-
 boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
index 5bbbe28f07..7f43346696 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  0809b72e1e8e40f82acdcfd4c8a6a120e14bd9ed395592e075bb54acc8c07271  beaglev-ddrinit-15b80de81263996affb2a29332aa681925709983.tar.gz
+sha256  df58c3da7a6f429095f4d56e7f1f5b7c855a0cbe82a2569586ce0c5fdd1bf256  beaglev-ddrinit-2e2f6faaf1059b61bb06ea00404199d1de55f201.tar.gz
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
index 02df0613ee..2f1ce3ee87 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_DDRINIT_VERSION = 15b80de81263996affb2a29332aa681925709983
+BEAGLEV_DDRINIT_VERSION = 2e2f6faaf1059b61bb06ea00404199d1de55f201
 BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
 BEAGLEV_DDRINIT_INSTALL_TARGET = NO
 BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
