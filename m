Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571BDC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1019C83AA0;
	Tue, 30 Jan 2024 22:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1019C83AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjbqV5fRWM9v; Tue, 30 Jan 2024 22:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A29B83896;
	Tue, 30 Jan 2024 22:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A29B83896
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9FA1BF5DF
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65E4D613D1
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65E4D613D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oR4iGc9nXTVY for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A9F760D4F
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9F760D4F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61B4586735; Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 22:56:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e784eb8538bb3582f28572d1db640b89be2e86dd
X-Git-Newrev: 1dfa4c56fe5dd1b584791b3c0c61dcf0b623aad5
X-Patchwork-Hint: ignore
Message-Id: <20240130220739.61B4586735@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: bump to version 10.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=1dfa4c56fe5dd1b584791b3c0c61dcf0b623aad5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version contains a fix for aarch64 based systems.
On such systems, dhcpcd would crash without setting any IP addresses.
See https://github.com/NetworkConfiguration/dhcpcd/commit/6a36f96740f8fb9f9b615b157962505f1ad8a00c
and https://github.com/NetworkConfiguration/dhcpcd/issues/260 for more
details.

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.hash | 2 +-
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index b015dce4ac..fb4f6064bc 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
 # sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.4
-sha256  ced5bbde8da3726eac77b9e77e4f31a89c9849d811ef8a2c749664fc5f55a718  dhcpcd-10.0.4.tar.xz
+sha256  eb1f3cfef3069781ff8c896d7cea922639964afe22db28c069dc3f37f57eb428  dhcpcd-10.0.5.tar.xz
 # Locally calculated
 sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index ba1481e83d..ab3f98dd5a 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.0.4
+DHCPCD_VERSION = 10.0.5
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
