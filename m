Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FA5C61DE5
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 13:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291C983F00;
	Sat, 21 Feb 2026 13:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rH7GQPe-wYfZ; Sat, 21 Feb 2026 13:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D5483F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771680805;
	bh=mRkuMomECdBVl4sfuGGJzRbroXoVLIJXk6Eg57+teUM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gkBQQoM4UOgRhDupYG15+/BcyhHQN2xeuAby8ZIrQbJf1Ho6aldJ37OYmy4pjMNWh
	 oE4gY7DKwmO5Yrg5C2tOHoHKozPURhNovUiHy7ktk+UpHpWeLzoIMCOq/T3dH2kKGo
	 vLfMNP306aGejmq/j0pQIF4QlOlEk30CO9jvE2yepe2x/zDVpvpuc3gRBlcrKvYcuM
	 rIU826TDLUccMWvaWr6Ak2y2VQAhKfWc9L1vPury0B88e/IkvtV+0cMM//imiYTAEj
	 MWTTaDw9Bi57XYtVT4C2dMaLWXcEzrM5jbeFs4rOpy/1m7mzw3ulyMWqSa57ZWzmVt
	 kGBmyiExzpqZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D5483F02;
	Sat, 21 Feb 2026 13:33:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DA48183
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D901418AD
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U53x2CZ4pMpL for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 13:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE97040697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE97040697
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:33:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAE2186EC1; Sat, 21 Feb 2026 13:33:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 21 Feb 2026 14:28:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07008c8f2ad9484a1d6df8a31622a109bbd86e1f
X-Git-Newrev: f90d38dafcadf959e6a0383376639a137a8bae4d
X-Patchwork-Hint: ignore
Message-Id: <20260221133322.BAE2186EC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wmctrl: fix tarball URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f90d38dafcadf959e6a0383376639a137a8bae4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Current site is down, switch to Debian.

Fixes:
https://autobuild.buildroot.net/results/679/679a9f6224d1771ec2ab52e45fd74af8d03c1604/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wmctrl/wmctrl.hash | 2 +-
 package/wmctrl/wmctrl.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wmctrl/wmctrl.hash b/package/wmctrl/wmctrl.hash
index 531f64a0d8..86b04d0c01 100644
--- a/package/wmctrl/wmctrl.hash
+++ b/package/wmctrl/wmctrl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl-1.07.tar.gz
+sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl_1.07.orig.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
index 36ad3513ff..e948f7a939 100644
--- a/package/wmctrl/wmctrl.mk
+++ b/package/wmctrl/wmctrl.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 WMCTRL_VERSION = 1.07
-WMCTRL_SITE = https://sites.google.com/site/tstyblo/wmctrl
+WMCTRL_SOURCE = wmctrl_$(WMCTRL_VERSION).orig.tar.gz
+WMCTRL_SITE = https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/wmctrl
 WMCTRL_LICENSE = GPL-2.0+
 WMCTRL_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
