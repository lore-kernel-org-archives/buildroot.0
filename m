Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C80CD98E2
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A6240AC1;
	Mon, 15 Jun 2026 20:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQq1aN-kyvZM; Mon, 15 Jun 2026 20:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E6F408D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781556350;
	bh=Trzy1Fvu/Tg525AyUtkBWuo1P4iv2V+63Cs/1vAIkrY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GccAk0GJtuGV2vz1aBYWZe945nT9EmlF7zPMaANvC/XyDBJW9X1yaJ3mC2tPXkTk7
	 lihZpHDxKWTo6goIwW4gysMdPxad2Lfv6JV2cW9aMXu+Ac+oBc8SvrgJJubGzOmfvh
	 ocX7GcU4MNsgV06xNq7CN0A/X7gfbKZj/5ah70B/qLU+Sex0xXk2jBpBfsDzMjz3lF
	 cwyq2o1u4hToE+zew63dVH39/YIeqv5gZ1dTMePsvkEBemKM+dghKlimNxikIoGPAO
	 y3lJbzgoWzd3rRfT+18aTbS9ZhHfpamtHMQ9BLZR9hjrHW+2yc+Bs8+Fizzxl1dJ55
	 K/3pIMIfJo4eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E6F408D5;
	Mon, 15 Jun 2026 20:45:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FA542A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FF35408D5
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJ-7qg3IFXqC for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B8E0408C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B8E0408C7
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82AD27FF08; Mon, 15 Jun 2026 20:45:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 22:39:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d9cf49f8a79bb64eb26fbf35cb3e451d13b8d26
X-Git-Newrev: 9b18cdc3dc52ca23dcb906a0d26b658cbfdf5acf
X-Patchwork-Hint: ignore
Message-Id: <20260615204527.82AD27FF08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 21.5.19-Omega
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b18cdc3dc52ca23dcb906a0d26b658cbfdf5acf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.19-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index c2339a3d33..d05e1c217f 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  a62ef86fc616c37ff7fa53ff7dfe2a73ee21f48af306a9f82c5bb5fe05245dad  kodi-inputstream-adaptive-21.5.18-Omega.tar.gz
+sha256  20922de1891c9980f9807a10edbe2d1ae9224c298c438a3458d7b7105d5b7c21  kodi-inputstream-adaptive-21.5.19-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 3e0ead12c9..6afbb241a1 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.18-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.19-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
