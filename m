Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE78EC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9849140216;
	Sun, 14 Jul 2024 21:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOlBMOgn22jh; Sun, 14 Jul 2024 21:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72904403A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72904403A1;
	Sun, 14 Jul 2024 21:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 366EE1BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 312E781191
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htip9DL7eHFW for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 21:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C34C8118D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C34C8118D
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 21:02:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5019C86A25; Sun, 14 Jul 2024 21:02:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 22:59:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16abf80368b660b4ec59778ca5060529b77a42c5
X-Git-Newrev: 8fc504e3849cc463da5ec7a581f2cf8fc6ed5eab
X-Patchwork-Hint: ignore
Message-Id: <20240714210255.5019C86A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chicken: add CHICKEN_CPE_ID_VENDOR
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8fc504e3849cc463da5ec7a581f2cf8fc6ed5eab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:call-cc:chicken is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/6F55B09D-8D4B-4F1C-889C-9B65048AB632

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/chicken/chicken.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 9f296a1ce3..2667f7823d 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -8,6 +8,7 @@ CHICKEN_VERSION = 5.3.0
 CHICKEN_SITE = https://code.call-cc.org/releases/$(CHICKEN_VERSION)
 CHICKEN_LICENSE = BSD-3-Clause
 CHICKEN_LICENSE_FILES = LICENSE
+CHICKEN_CPE_ID_VENDOR = call-cc
 CHICKEN_INSTALL_STAGING = YES
 
 # If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
