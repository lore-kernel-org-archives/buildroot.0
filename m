Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAFEC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9328B81767;
	Sun, 29 Jan 2023 21:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9328B81767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfLEWhTv82hE; Sun, 29 Jan 2023 21:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF5258175F;
	Sun, 29 Jan 2023 21:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF5258175F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3341BF863
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A3A241626
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A3A241626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GontBxkOk9wh for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:30:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5239E4161B
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5239E4161B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3725F7FEEC; Sun, 29 Jan 2023 21:30:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 22:29:35 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e2914938c94ea80f3edabf55d37e824b7e5f8e5a
X-Git-Newrev: b299ee5f40247ce2ad7e67bcc1fba23d3502504a
X-Patchwork-Hint: ignore
Message-Id: <20230129213007.3725F7FEEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sudo: security
 bump to version 1.9.12p2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b299ee5f40247ce2ad7e67bcc1fba23d3502504a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix https://nvd.nist.gov/vuln/detail/CVE-2023-22809

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 51e98499ff54496126d89e34751297ea9e1f61bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index a3476df96b..c920b9fe74 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8  sudo-1.9.12p1.tar.gz
+sha256  b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539  sudo-1.9.12p2.tar.gz
 # Locally calculated
 sha256  d2f93a3b17ed5586fddd07be33ad767146c1a81a22682baa68bb4360a31d020a  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 0a8c873925..8bf1ce5e9c 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUDO_VERSION_MAJOR = 1.9.12
-SUDO_VERSION_MINOR = p1
+SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
