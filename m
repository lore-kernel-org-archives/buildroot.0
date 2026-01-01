Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA45EED603
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6A6060781;
	Thu,  1 Jan 2026 15:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jRKN9ohxh4o; Thu,  1 Jan 2026 15:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB5E60786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767280073;
	bh=Y/LcU58lBgqwkhPFPDByP+QJkXwNxQyDBu0JKfvnFk0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z2e+uYYUYj4Tm38Nt5u3SlHCyGtVE3BdUQru2VIb5dX6G3rxWb3GTbfKYgnwiW1ni
	 +6DSM0rhtZp2ecJuf2ZWwrXgwb2VnGFhDGnKwIFhvTDegiKousywixfoCZfXw/vSvl
	 b2oLCyO0+PzlAlCrxGPnYpP+j+bMU0vTRJpBl1pepRff9vzCzL+29IWohlixuhgKIg
	 pmVsAbkNZcE3O9DIvNqpXx/aXm1Rgm4fXQRXprvROP62bxY+nCuTeAhkycEb3EIKbR
	 8S5hs3alT1TSD49itOWQ/XNsIqNpOLGh7zQ6iFwEURPrYBHpwDUYMSPr4TY7md2+RT
	 v9CX0NXtEZQNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB5E60786;
	Thu,  1 Jan 2026 15:07:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CCC7351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C449407D4
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7DYPyoddDIE for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A7D4070C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84A7D4070C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8096E87DD0; Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 15:49:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2cf998b8d610b9894467e0a6e4e57397e99ed34
X-Git-Newrev: 25b5ecf30bd652c8164359d1eaee4dfd3d2ea44d
X-Patchwork-Hint: ignore
Message-Id: <20260101150751.8096E87DD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-modules: bump to version
 2.14.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=25b5ecf30bd652c8164359d1eaee4dfd3d2ea44d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A changelog for lttng-modules 2.14.3 can be found here:

  https://git.lttng.org/?p=lttng-modules.git;a=blob;f=ChangeLog;h=be6148022eca5084d05d959bccf27d88e2ed2073;hb=refs/heads/stable-2.14

The license files have changed due to upstream commit:

  https://git.lttng.org/?p=lttng-modules.git;a=commit;h=61baff6e8de2462f45006662bc34bcbf5f645ba0

Signed-off-by: Devin Steffler <devin.buildroot@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd:
 - bumped to 2.14.3, updated changelog link
 - Updated license files and hashes due to upstream commit:
   https://git.lttng.org/?p=lttng-modules.git;a=commit;h=61baff6e8de2462f45006662bc34bcbf5f645ba0]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-modules/lttng-modules.hash | 12 ++++++------
 package/lttng-modules/lttng-modules.mk   |  7 +++++--
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index ad2a641cc8..3cf11dae32 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,8 +1,8 @@
-# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.22.tar.bz2.sha256
-sha256  8741802711050b7c1e865598c4d39ed9ba72e505b7e69c7887f9751e112517ef  lttng-modules-2.13.22.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.14.3.tar.bz2.sha256
+sha256  35a1875ad96e8b4b6aa8729f59af350bfc788ba65c6856deaa84d33acc0f28c2  lttng-modules-2.14.3.tar.bz2
 
 # Hash for license files
-sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
-sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
-sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
-sha256  dc47dc17b111f67f52549d4f9649aead142f84317b269ecce80deb1b64e7d023  LICENSE
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-only.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  04c0f62f5088b9f794f803730878da9fe1ddc9a91f1b83b045b720e05adcf7af  LICENSE
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 23258a46df..b51fb5dd96 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.13.22
+LTTNG_MODULES_VERSION = 2.14.3
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
 LTTNG_MODULES_LICENSE_FILES = \
-	LICENSES/LGPL-2.1 LICENSES/GPL-2.0 LICENSES/MIT LICENSE
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/MIT.txt \
+	LICENSE
 LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
 define LTTNG_MODULES_LINUX_CONFIG_FIXUPS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
