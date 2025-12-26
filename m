Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC7E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F544605F5;
	Fri, 26 Dec 2025 18:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDeWyJQdExSN; Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 914576060E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773259;
	bh=Zwy35EjlGDrscdCGRkdRzISBy4a1ya5j08gdFzmZmFo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PfPhTMFjfmjaFJA6Qh1FXxqgnXIEoMxF4fMFh04E2y3UFQkjYHay3n2/4TBIRT7DD
	 orNoS+2CZGAzxq5xqOXoXRLtR/mnkPI45012IGGOEl1mbShvl8ikD63VnnPAFybQnd
	 oTVprxzGSv5yVDd/Td6SZET43G6Iv2b92RQkTmJIIO1SGWSsX1f+KuVvgO7Rp+rWNl
	 rMH2QrHlNGj34jmopruK5gCvFTtLSXAK4A2gIWBzuwt87RrInA088eckLF27huuD/l
	 g+OSu3rMpGUD4/SAd9URANSnQx3WtrAVftuyqafw9VukVVGuxX2Eu5VCTMvkuyUXxa
	 RtaOYK48Rl+Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 914576060E;
	Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CF5630D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64DFD40447
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AflUA-L24W0h for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D81A40092
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D81A40092
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 685D6876DC; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d80031c7ee38e060e1465800e2269bb3e705fd25
X-Git-Newrev: 77b6899c7d7252514f3ef26c7137cba50c42c1b8
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.685D6876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-serial-test: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=77b6899c7d7252514f3ef26c7137cba50c42c1b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-serial-test/linux-serial-test.hash | 2 +-
 package/linux-serial-test/linux-serial-test.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-serial-test/linux-serial-test.hash b/package/linux-serial-test/linux-serial-test.hash
index 38b98a610f..d1ecef6fd5 100644
--- a/package/linux-serial-test/linux-serial-test.hash
+++ b/package/linux-serial-test/linux-serial-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bd612ad9c10cb8090765487d5e2969be09dd0d024e7215dc764e770fbb5cc9e0  linux-serial-test-bf865c37ccf9cbb1826ada61037c036dc1990b7b.tar.gz
+sha256  00001938766fa3cebace913907b3715f23d936636b75861ec95a8e9b1a1be041  linux-serial-test-e3461097252e51fc527839884e77449cfd976701.tar.gz
 sha256  a2a6760c2c6fa779a635e4a7ad00f668862ebcadb2a8a57d16662543e103e08c  LICENSES/MIT
diff --git a/package/linux-serial-test/linux-serial-test.mk b/package/linux-serial-test/linux-serial-test.mk
index ccb39280ec..7ef675834c 100644
--- a/package/linux-serial-test/linux-serial-test.mk
+++ b/package/linux-serial-test/linux-serial-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_SERIAL_TEST_VERSION = bf865c37ccf9cbb1826ada61037c036dc1990b7b
+LINUX_SERIAL_TEST_VERSION = e3461097252e51fc527839884e77449cfd976701
 LINUX_SERIAL_TEST_SITE = $(call github,cbrake,linux-serial-test,$(LINUX_SERIAL_TEST_VERSION))
 LINUX_SERIAL_TEST_LICENSE = MIT
 LINUX_SERIAL_TEST_LICENSE_FILES = LICENSES/MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
