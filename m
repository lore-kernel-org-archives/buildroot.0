Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0122C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 08:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E1D404E8;
	Tue,  7 May 2024 08:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-Ed4EuDv28z; Tue,  7 May 2024 08:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D583C4078E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D583C4078E;
	Tue,  7 May 2024 08:05:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A283E1BF31B
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 08:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E3834078E
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 08:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiZOrppjuIuy for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 08:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0CC3404E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0CC3404E8
 for <buildroot@buildroot.org>; Tue,  7 May 2024 08:05:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03A0086920; Tue,  7 May 2024 08:05:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 09:51:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6ef948f298dcfe68942787c0ce5040105f65395
X-Git-Newrev: 818b6270a845df43d03d85622d4dfc1d48248bf6
X-Patchwork-Hint: ignore
Message-Id: <20240507080516.03A0086920@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/batctl: update to 2023.1 to match
 batman-adv
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

commit: https://git.buildroot.net/buildroot/commit/?id=818b6270a845df43d03d85622d4dfc1d48248bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although the kernel interface has not changed, it is convenient to
have the batctl match the batman-adv version. So, bump the package
to match 01ec4a39f5ceb83c62b0040067ba53197a0a6843 batman-adv bump.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/batctl/batctl.hash | 6 +++---
 package/batctl/batctl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
index 56bea3c5da..7bc6fee67f 100644
--- a/package/batctl/batctl.hash
+++ b/package/batctl/batctl.hash
@@ -1,6 +1,6 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.0/batctl-2021.0.tar.gz.sha1
-sha1  87d0bb34950cb70578a0ca5ce706513a8279a01c  batctl-2021.0.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2023.1/batctl-2023.1.tar.gz.sha1
+sha1  8d899c6323e228b9b370caf28e6d67621cb7d35d  batctl-2023.1.tar.gz
 # Locally calculated
-sha256  9cec8bf1952f885192749a9dc0318a54633b717aaf05c438d504efd83f5201e4  batctl-2021.0.tar.gz
+sha256  e5bf47305d955abb199244bd0e5fffab96108b1affabd0d9705533f8059395f1  batctl-2023.1.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 8ff591844d..197e4beb72 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATCTL_VERSION = 2021.0
+BATCTL_VERSION = 2023.1
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
 BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
 BATCTL_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
