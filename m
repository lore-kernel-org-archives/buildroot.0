Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5328C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3916360E3B;
	Sun, 19 Jun 2022 15:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3916360E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMBz8vKfMzAD; Sun, 19 Jun 2022 15:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60D2460E48;
	Sun, 19 Jun 2022 15:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60D2460E48
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FECD1BF990
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEFB681401
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEFB681401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGu1VgA-mLXn for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49106813E5
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49106813E5
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 11C62873C2; Sun, 19 Jun 2022 15:45:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b77ee6ce55455f5895502ada254909a00ff47944
X-Git-Newrev: 978800fadbb7b3d1383e7cd7e166b1f0a35eb999
X-Patchwork-Hint: ignore
Message-Id: <20220619154530.11C62873C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sofia-sip: fix version
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

commit: https://git.buildroot.net/buildroot/commit/?id=978800fadbb7b3d1383e7cd7e166b1f0a35eb999
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix version to better match what is expected by NVD NIST database,
release-monitoring.org as well as upstream github
(https://github.com/freeswitch/sofia-sip/tags)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sofia-sip/sofia-sip.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index c7698c9a11..c52045091e 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.6-4152840260
+SOFIA_SIP_VERSION = 1.13.6
+SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-4152840260.tar.gz
 SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
