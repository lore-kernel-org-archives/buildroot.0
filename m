Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DE4C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 14:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 085CB610AE;
	Thu, 19 Jan 2023 14:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 085CB610AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFaplj5Iy63e; Thu, 19 Jan 2023 14:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8B1F60F3C;
	Thu, 19 Jan 2023 14:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8B1F60F3C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6D451BF372
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 14:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF616404B3
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 14:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF616404B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMV5dafPvkC6 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 14:22:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04EA0400D9
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04EA0400D9
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 14:22:03 +0000 (UTC)
Date: Thu, 19 Jan 2023 14:21:51 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <VBwNLuJA6_zFEAtMG_B8NHN22C-vUtTiXkB1BRCnP2LxbBrsBrOhgAA0q3PPW-zR7mJL324mht-Cbf-XZzb0o9bldpk1PY199lzihCbNmVo=@protonmail.com>
Feedback-ID: 6956783:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1674138121; x=1674397321;
 bh=W6IwgDjJw3L0ruFE7WlGaVNgUgJRSqai3l2//dxza7k=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=o9l2YXAig5mXcFe9jE1/M/3ZpL5Jzev89LUBU8TfBaqwaJaYU4Rbe9RejvQx54l30
 ygJ5WpN26DRQg2N1YnuwoxBIdu0a5ajdICjO/hhldHIYC/5pXHMXanB8SJ278lDSkF
 BXb1PqQ4p74MDEhuBOOzWDghfZUCHiJtNaailZtkWmHEChdOnAe9jGOlaInyMmo52Z
 lRzo1NEgvCjriucp0QIHAcUzxLSpj73TGhe0XxWFBUBy0q0TX4IIQ0kdqnmseQL47e
 3YhPwVMjTlTdlzQv5k2+k5avSWsJzL2n9ob+y3GtYY0vWH1oJRw1TiUBaTSaBtDxpj
 XPQ5zDRBRPUbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=o9l2YXAi
Subject: [Buildroot] [PATCH] package/sudo: security bump to version 1.9.12p2
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
From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Reply-To: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix https://nvd.nist.gov/vuln/detail/CVE-2023-22809

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
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
index a16b6863aa..c4eaafa6b1 100644
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
-- 
2.30.2



Yair Ben-Avraham
yairba@protonmail.com
+31.6.1316.5535
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
