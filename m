Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352D0C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 21:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5FD540993;
	Wed, 27 Jul 2022 21:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5FD540993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6cIuwjTFhbD8; Wed, 27 Jul 2022 21:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6FF240487;
	Wed, 27 Jul 2022 21:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6FF240487
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F78C1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7663641682
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7663641682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4JePi5mNysbV for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 847D041573
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 847D041573
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9C8888673F; Wed, 27 Jul 2022 21:09:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:06:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5c0eaef1f7c3b705cc1cf3087bd83ad9098aa2f
X-Git-Newrev: af13345d434b20e6ce878e4a034bcd389be8c836
X-Patchwork-Hint: ignore
Message-Id: <20220727210911.9C8888673F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fixed CSS
 cascade
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

commit: https://git.buildroot.net/buildroot/commit/?id=af13345d434b20e6ce878e4a034bcd389be8c836
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the .version-needs-update class being overridden by .correct class.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 91a1a1622d..b2a8ddd446 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -818,12 +818,12 @@ function sortGrid(sortLabel){
 .centered {
   text-align: center;
 }
- .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
-   background: #ff9a69;
- }
  .correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
    background: #d2ffc4;
  }
+ .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
+   background: #ff9a69;
+ }
  .somepatches, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
    background: #ffd870;
  }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
