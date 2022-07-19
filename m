Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D7BC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D6B611A9;
	Tue, 19 Jul 2022 16:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D6B611A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SG4xUYubBLOB; Tue, 19 Jul 2022 16:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CC461198;
	Tue, 19 Jul 2022 16:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37CC461198
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2991BF9B5
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B796104A
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B796104A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcY-QKngzCCF for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:26:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9972560C27
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9972560C27
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8A88F83DDC; Tue, 19 Jul 2022 16:12:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 18:23:35 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 055fffe6a27ad39dfd0195d3cee9197d096e1ccc
X-Git-Newrev: 2f337dedfa3e3868de96c20094e40eb0e4b80f08
X-Patchwork-Hint: ignore
Message-Id: <20220719161254.8A88F83DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/sofia-sip:
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f337dedfa3e3868de96c20094e40eb0e4b80f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
