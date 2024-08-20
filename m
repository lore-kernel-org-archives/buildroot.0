Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99064C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A93940B91;
	Tue, 20 Aug 2024 21:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qOKmAk8LfTi; Tue, 20 Aug 2024 21:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AEE540B9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AEE540B9D;
	Tue, 20 Aug 2024 21:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B13E1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47BE24067F
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8T5Zzg_GJ43v for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D8240679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40D8240679
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:33:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F201861E8; Tue, 20 Aug 2024 21:33:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 23:33:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 46d9fdff48c106c22f6d96cad8b9011f28baf653
X-Git-Newrev: ac837c91ff979b49fe569962e1bd657d17a96e75
X-Patchwork-Hint: ignore
Message-Id: <20240820213357.8F201861E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/batctl: update to
 2024.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac837c91ff979b49fe569962e1bd657d17a96e75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/batctl/batctl.hash | 6 +++---
 package/batctl/batctl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
index 7bc6fee67f..b5d71fe894 100644
--- a/package/batctl/batctl.hash
+++ b/package/batctl/batctl.hash
@@ -1,6 +1,6 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2023.1/batctl-2023.1.tar.gz.sha1
-sha1  8d899c6323e228b9b370caf28e6d67621cb7d35d  batctl-2023.1.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2024.2/batctl-2024.2.tar.gz.sha1
+sha1  a0eb5c0d55ee04518db7b2ee5da14bc4c912e30f  batctl-2024.2.tar.gz
 # Locally calculated
-sha256  e5bf47305d955abb199244bd0e5fffab96108b1affabd0d9705533f8059395f1  batctl-2023.1.tar.gz
+sha256  cb02953093ffc2c700d122c03a3d9e4d867f646d3038f31d0a901e58ff995d07  batctl-2024.2.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 197e4beb72..182f32c71c 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATCTL_VERSION = 2023.1
+BATCTL_VERSION = 2024.2
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
 BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
 BATCTL_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
