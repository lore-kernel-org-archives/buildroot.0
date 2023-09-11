Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703D3EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25F0540A78;
	Mon, 11 Sep 2023 19:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25F0540A78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJfaCnP1SAHF; Mon, 11 Sep 2023 19:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55CC34117A;
	Mon, 11 Sep 2023 19:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55CC34117A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC5B81BF860
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B58C761055
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58C761055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwCPgtzrMM_o for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B684A61053
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B684A61053
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F06286C8E; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:18:37 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6bd5c5e19f3080b41e6de00be2b2797a6e599ea0
X-Git-Newrev: 562327441bd9677c9957ba815e9ab13566065a80
X-Patchwork-Hint: ignore
Message-Id: <20230911190748.9F06286C8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/ntpsec: security
 bump version to 1.2.2a
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

commit: https://git.buildroot.net/buildroot/commit/?id=562327441bd9677c9957ba815e9ab13566065a80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes CVE-2023-4012 (see [1] for details).

[1] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_2a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 642b42928eeaf74db7dc7d7bf6670f37b7b7d274)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntpsec/ntpsec.hash | 2 +-
 package/ntpsec/ntpsec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 44e04b2403..8d98b5c411 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ad45f5b88d08a159bc9f44ecb79e08358d26d3d22bb6c96ab7aaa3734de130e6  ntpsec-NTPsec_1_2_2.tar.bz2
+sha256  ef901df5a05d486563db22f4d0dad3840a3bf5d0a9aceb8c3ecaeb396c67a805  ntpsec-NTPsec_1_2_2a.tar.bz2
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2
 sha256  5fe38d8724c53ff4e69f0a3492a368b4a6719700ac16f706efeb01a45c62f2b5  LICENSES/BSD-3
 sha256  9ba9550ad48438d0836ddab3da480b3b69ffa0aac7b7878b5a0039e7ab429411  LICENSES/CC-BY-4.0
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index e612e982ec..f6262cdaca 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.2
+NTPSEC_VERSION = 1.2.2a
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT, CC-BY-4.0 (docs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
