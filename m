Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72332C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 14:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3BDE81BC2;
	Sun, 17 Mar 2024 14:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ez3NuvD5hDEE; Sun, 17 Mar 2024 14:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A862817AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A862817AD;
	Sun, 17 Mar 2024 14:36:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD1491BF868
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A720A60635
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qP0w_GthR-3S for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 14:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFA9060606
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFA9060606
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDD3582751; Sun, 17 Mar 2024 14:36:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 15:35:27 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d129f6d8ee76e1409e0412cf574b9a4d4f045bdb
X-Git-Newrev: eddba7834f90a6e2fc827e923caa266106495fff
X-Patchwork-Hint: ignore
Message-Id: <20240317143626.CDD3582751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/nodejs: security
 bump to version 16.20.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=eddba7834f90a6e2fc827e923caa266106495fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issues:

CVE-2023-32002: Policies can be bypassed via Module._load (High)
CVE-2023-32006: Policies can be bypassed by module.constructor.createRequire (Medium)
CVE-2023-32559: Policies can be bypassed via process.binding (Medium)
CVE-2023-30581: mainModule.__proto__ Bypass Experimental Policy Mechanism (High)
CVE-2023-30585: Privilege escalation via Malicious Registry Key manipulation during Node.js installer repair process (Medium)
CVE-2023-30588: Process interuption due to invalid Public Key information in x509 certificates (Medium)
CVE-2023-30589: HTTP Request Smuggling via Empty headers separated by CR (Medium)
CVE-2023-30590: DiffieHellman does not generate keys after setting a private key (Medium)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6ab4c53e79..e24d86db31 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v16.20.0/SHASUMS256.txt
-sha256  e0990f992234e40a51fe11f92c3816c93a77e1b081145d3dd762cd1026345349  node-v16.20.0.tar.xz
+# From https://nodejs.org/dist/v16.20.2/SHASUMS256.txt
+sha256  576f1a03c455e491a8d132b587eb6b3b84651fc8974bb3638433dd44d22c8f49  node-v16.20.2.tar.xz
 
 # Hash for license file
 sha256  ba325815d3df8819bebaf37cad67d6e1f82271e1e4a1189b53abd28e261977d6  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 13a68a25be..b0b782f219 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.20.0
+NODEJS_VERSION = 16.20.2
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
