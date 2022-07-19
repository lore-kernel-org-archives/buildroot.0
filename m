Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2681EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC50040C6C;
	Tue, 19 Jul 2022 16:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC50040C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2GTROOjWuPj; Tue, 19 Jul 2022 16:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C992740C6B;
	Tue, 19 Jul 2022 16:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C992740C6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2702F1BF417
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C8B6415A5
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C8B6415A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSoNcVpQ8sNF for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:24:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF0A54154F
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF0A54154F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD56D83DB9; Tue, 19 Jul 2022 16:11:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 18:24:21 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2f7b6e39909e2ce007ad4c551b542461648064e8
X-Git-Newrev: a1ccba72dddebe2d15945fdef3ff4831ee5b0a6f
X-Patchwork-Hint: ignore
Message-Id: <20220719161126.CD56D83DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sofia-sip:
 security bump to version 1.13.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1ccba72dddebe2d15945fdef3ff4831ee5b0a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-31001, CVE-2022-31002 and CVE-2022-31003:
https://github.com/freeswitch/sofia-sip/security/advisories/GHSA-79jq-hh82-cv9g
https://github.com/freeswitch/sofia-sip/security/advisories/GHSA-g3x6-p824-x6hm
https://github.com/freeswitch/sofia-sip/security/advisories/GHSA-8w5j-6g2j-pxcp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d4b47d41cac1eaedefba73589a7cee361de76d48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 6f6ff6d052..ae2b3e725c 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d39a3287038f1c9a747c1abc94a1379a726a9dfaf969285f955141883f7b810f  sofia-sip-1.13.6-4152840260.tar.gz
+sha256  ebd006a98a7dff6e7f4d8357c5ebeee1d3bee3ac29ff213a4909e845f230fcbe  sofia-sip-1.13.8-756ab9b5c9.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index c52045091e..80e59057c4 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.6
-SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-4152840260.tar.gz
+SOFIA_SIP_VERSION = 1.13.8
+SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-756ab9b5c9.tar.gz
 SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
