Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFF5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 03:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F52B6126A
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 03:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F52B6126A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3589483C7C;
	Tue,  5 Oct 2021 03:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oakS2vQ4yTS0; Tue,  5 Oct 2021 03:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F1A583C76;
	Tue,  5 Oct 2021 03:51:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F54E1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 03:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7692683C76
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 03:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OWSFOcZ9VjSA for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 03:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AB8483C75
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 03:51:49 +0000 (UTC)
Date: Tue, 05 Oct 2021 03:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1633405905;
 bh=rzA5IvfS4LJHMjlCiZOw6KQMYy7KlI52RfuC88IMUAM=;
 h=Date:To:From:Reply-To:Subject:From;
 b=NG5mocj8AAGGtIJJTZBJLTbd/c1JSsP7PEStro4cyJTBmctAfWDOOx5meJhuzCpD1
 wMKVnQ1t1XK8APFBV8/2L1XLmNUYZeo2yyYidETo+9qFOY55nubZmopkD8cEzbOLKO
 5ohvL5FMI6Yl8YrNrqsnCPEZAvAFm8q15nf7JSQs=
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <_RmhgNVMgtrsVopY3AeqALjWg7uewZqVb70Ga8dAjZha83pkHao3m4qhlFNJaYEfhPKbTarpn4AeVvccpQ9ZqH62OCgiiaiDINh_fgJ6m1Y=@protonmail.com>
MIME-Version: 1.0
Subject: [Buildroot] package/pcsc-lite: bump version to 1.9.4
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

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 4d31b25aaa..b4f9e09b32 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  73c4789b7876a833a70f493cda21655dfe85689d9b7e29701c243276e55e683a  pcsc-lite-1.9.1.tar.bz2
+sha256  8a8caac227e0a266015298dda663e81576a0d11d698685101e6aa6c9fdb51c4b  pcsc-lite-1.9.4.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 94f38b3d85..2536a49e5d 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-PCSC_LITE_VERSION = 1.9.1
+PCSC_LITE_VERSION = 1.9.4
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
--
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
