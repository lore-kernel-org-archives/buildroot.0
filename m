Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCFD606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K2GSPZ58
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F349C607D5;
	Wed,  4 Nov 2026 22:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_QKHfNKzW6r; Wed,  4 Nov 2026 22:44:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0BC7B607F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793832287;
	b=krnwc7tXm1ITE9WiDT2qa/W7h38vkiq3g/qETfQ2aEEddtXNe8fQDr6AEsyBAhf8LmYk
	 UEcdK6GAfZC4yOh7cP6wxKk5huS4kxOrXOXhXBzFgTwnJA1oMuAPrBpGoBLcunvumoUn+
	 m5XpUbUNyUtPd8u3/jwiF3bH2j08+u8u85MKmx9FJm9a4A3A2/1apQ0DwNehAvOjnSgfO
	 XlWLkdPdh8I5JpcmvFBw/Ph22gdE4yeq7/uPJasE843+e3czVlP/gKdi+IRLRIgCrG1Ac
	 1vp//tngfjOmomV7krtUzpfQZdfLWp3Z0uuqdJi6JuJFd1ScQZVDWRXDIUWj18aNrpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793832287;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g5e5AZQKMd1+f5VMfzbFfUie9ZdTkqZtDr4Q3yGHmS8=;
	b=lB102A52FNM0hwZm1m6rI7RAZksHPGnNGJPQ8KQVpHAV9mXWK/GC6mU65zYDFLRTTN0u
	 FksfK3n0PnyrCnvyrUlOYVm84xvBgRqloigbcNYACmEw/t1EExZVJ5W5IfUiQnQakBE5k
	 oGqiA++59XuVIKIUK9gVL0ursLKQbmVvDfX0rxFvzMcar6DvdMPZQ7UjQOCECy2MBwRYZ
	 JQtrX2IKPoepXhAsfzpmySKDkZkk3ij4/LGFody1kMOKJ9g+ZrDrPaYJjJzGPTdk+rYtb
	 aEcmVr62vOfL5+7NHxoAlBjy7Y5opLdAca+m2KworGDdaGA4ywihreZ3T1fiXpWIN/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793832287;
	bh=g5e5AZQKMd1+f5VMfzbFfUie9ZdTkqZtDr4Q3yGHmS8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K2GSPZ58RFfPO4AWQ+j0ZpGuZCkE7aAKHCkWA3LI6M3D1+MIOSvvqwp43DK07urpy
	 ZcujbOw53LUTIeOrwB1qV/KP7dmxl2G7/9WeS3HtD0jkOiJ8thIjgJsDW7LrF+XXRX
	 HeUaeUeeoHWUuo76nfXr5kC7SkSrg7suu6p+NrUYbJTJQNiGCvnVMQ7bgRjXsTor31
	 y++7wjBzT5OEdN18WDxCqbWCbiZ+ovxfBD+Bnb3NX2NpfVse+cQaL65ZifgMs3P3gV
	 JDOcBPrNos+NFOYaAj9zcUPC0VNoADam27qWGmcUURKLJeDGzxV/iz0/aypVDxna7/
	 X8vBoxK7yinEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC7B607F7;
	Wed,  4 Nov 2026 22:44:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5994537B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F0CE40858
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWe8gTEhUZqg for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:44:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53BE140856
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53BE140856
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:44:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 636859DE52; Wed,  4 Nov 2026 22:43:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:40:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6df483656000c1fdc262038d3011e5dfc2c25f6b
X-Git-Newrev: 683f63f3bd3d4cc88d8262a3fd8f135e290deb83
X-Patchwork-Hint: ignore
Message-Id: <20261104224313.636859DE52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pico{tool,-sdk}: bump to 2.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/683f63f3bd3d4cc88d8262a3fd8f135e290deb83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here:
pico-sdk: https://github.com/raspberrypi/pico-sdk/releases/tag/2.3.1
picotool: https://github.com/raspberrypi/picotool/releases/tag/2.3.1

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pico-sdk/pico-sdk.hash | 2 +-
 package/pico-sdk/pico-sdk.mk   | 2 +-
 package/picotool/picotool.hash | 2 +-
 package/picotool/picotool.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
index 2cad5b4b6e..17bdfbea0d 100644
--- a/package/pico-sdk/pico-sdk.hash
+++ b/package/pico-sdk/pico-sdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bbb60e768c1feeb1a4b7155da7361a135cba3ce197cef7cb93a300c559302897  pico-sdk-2.3.0-git4.tar.gz
+sha256  85165f85152e00b4003d19a3e9052a7505bbcb3ce971e267e5db95364d86cc42  pico-sdk-2.3.1-git4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 08760325f3..bfa8a5cae3 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICO_SDK_VERSION = 2.3.0
+PICO_SDK_VERSION = 2.3.1
 PICO_SDK_SITE = https://github.com/raspberrypi/pico-sdk.git
 PICO_SDK_SITE_METHOD = git
 PICO_SDK_GIT_SUBMODULES = YES
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
index f8589e3592..89c75397bd 100644
--- a/package/picotool/picotool.hash
+++ b/package/picotool/picotool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  97aaf36800d2317683528cba5762e3d4e7a5de0cba729d28011a6ee94b3b7538  picotool-2.3.0.tar.gz
+sha256  07946d294ab5c474b610660c53c5d94216e4ab13555de075ed521f98afc4f44c  picotool-2.3.1.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index cf70cfc7f0..caf1186e77 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOTOOL_VERSION = 2.3.0
+PICOTOOL_VERSION = 2.3.1
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
 PICOTOOL_LICENSE = BSD-3-Clause
 PICOTOOL_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
