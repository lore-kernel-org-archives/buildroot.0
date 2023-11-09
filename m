Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA77C4167D
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 17:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63F94400AF;
	Thu,  9 Nov 2023 17:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F94400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTn2LHrSZsY8; Thu,  9 Nov 2023 17:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59CF941714;
	Thu,  9 Nov 2023 17:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59CF941714
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 378E41BF990
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10D8C60F2F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D8C60F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id veB70Q2xZxzN for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 17:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C1B160F0B
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 17:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C1B160F0B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B8C386E2C; Thu,  9 Nov 2023 17:26:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 18:18:41 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: be438a4eaea24ced11a508f12e300e58e8755362
X-Git-Newrev: 9ae8fee8e86c8ca417a30413375cb6b1d0b3aed3
X-Patchwork-Hint: ignore
Message-Id: <20231109172655.1B8C386E2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/traceroute:
 security bump to version 2.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ae8fee8e86c8ca417a30413375cb6b1d0b3aed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2023-46316: In buc Traceroute 2.0.12 through 2.1.2 before 2.1.3,
the wrapper scripts do not properly parse command lines.

https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.1
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.2
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 604573a625d46eed00043fbe71215109ec19f735)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/traceroute/traceroute.hash | 2 +-
 package/traceroute/traceroute.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/traceroute/traceroute.hash b/package/traceroute/traceroute.hash
index 83791c18a4..cf2eb127a2 100644
--- a/package/traceroute/traceroute.hash
+++ b/package/traceroute/traceroute.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6  traceroute-2.1.0.tar.gz
+sha256  05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412  traceroute-2.1.3.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index 155e134c68..133f8d3c3e 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACEROUTE_VERSION = 2.1.0
+TRACEROUTE_VERSION = 2.1.3
 TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/traceroute-$(TRACEROUTE_VERSION)
 
 TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
