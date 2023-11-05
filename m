Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B475EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6524240AB2;
	Sun,  5 Nov 2023 20:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6524240AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IA5kZ9-kx3RS; Sun,  5 Nov 2023 20:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B32C40AAE;
	Sun,  5 Nov 2023 20:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B32C40AAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDAB1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5BE740A6F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BE740A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ImLBQd3cJ3XR for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:30:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EACD040A98
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EACD040A98
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9F23867ED; Sun,  5 Nov 2023 20:29:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 21:26:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 707c2c70bcded1d2af51a764f6e2ab963d5705d6
X-Git-Newrev: 604573a625d46eed00043fbe71215109ec19f735
X-Patchwork-Hint: ignore
Message-Id: <20231105202959.C9F23867ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/traceroute: security bump to
 version 2.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=604573a625d46eed00043fbe71215109ec19f735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-46316: In buc Traceroute 2.0.12 through 2.1.2 before 2.1.3,
the wrapper scripts do not properly parse command lines.

https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.1
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.2
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
