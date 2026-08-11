Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7AAC5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E61A605EA;
	Tue, 11 Aug 2026 19:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hb2z-bGb0348; Tue, 11 Aug 2026 19:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30676605EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786476654;
	bh=wipWWCz1UkyxTni8PVwL+3xyakfSZbjvGfMpRPmAPE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X/md28X7kUcO6V6BgZWW8dkwn6nmOHXvC1izuY81y4u+vE2w7J6gP39ZcCK8Pu016
	 nXlWip5KMt7UQS4JDRn/8IlcmgcyFpLmbWbAfpOI1ps8JcA0tNUw+lKO8+0+gV7V98
	 sK35lCfm/G8YMgynYDa0FK7UcaOGPrdlQhEXjgContlsosEVoc4pLtAfiIvIF9Py6h
	 b/xbeuwEPTE2hzTCEelLTLNnongN9VbbnMPAz5aMELNTWzJP3Bg1VvWJblzjoH3yJJ
	 8n/1x8PxvX9NBZr1HKz/VeWMQkOKsIlA3gmvrdWD+JJ+z3ai9S95IZN39gQx+JKio1
	 CAvxZANBu0YUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30676605EE;
	Tue, 11 Aug 2026 19:30:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5D12E0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D067C80F42
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb6hYFuJYkyB for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A021280F28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A021280F28
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F12088D3D2; Tue, 11 Aug 2026 19:30:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 21:20:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19f9e2688f82e8c50d220cf5a221ce68d3d5c5ba
X-Git-Newrev: 6632b05900951d66750e888da353e98f44d89f80
X-Patchwork-Hint: ignore
Message-Id: <20260811193001.F12088D3D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pico{tool,
 -sdk}: security bump to 2.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6632b05900951d66750e888da353e98f44d89f80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/raspberrypi/pico-sdk/releases/tag/2.3.0

Fixes CVE-2026-25833 (via mbedtls udpate in pico-sdk)
Fixes CVE-2026-25834 (via mbedtls udpate in pico-sdk)
Fixes CVE-2026-25835 (via mbedtls udpate in pico-sdk)

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
[Julien: reword commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pico-sdk/pico-sdk.hash | 2 +-
 package/pico-sdk/pico-sdk.mk   | 2 +-
 package/picotool/picotool.hash | 2 +-
 package/picotool/picotool.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
index 7bb764a266..2cad5b4b6e 100644
--- a/package/pico-sdk/pico-sdk.hash
+++ b/package/pico-sdk/pico-sdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1a6a0f76cf312d528023d093f132e6c67930fc70c360533cf155998cc9594abd  pico-sdk-2.2.0-git4.tar.gz
+sha256  bbb60e768c1feeb1a4b7155da7361a135cba3ce197cef7cb93a300c559302897  pico-sdk-2.3.0-git4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index dfb29d2320..08760325f3 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICO_SDK_VERSION = 2.2.0
+PICO_SDK_VERSION = 2.3.0
 PICO_SDK_SITE = https://github.com/raspberrypi/pico-sdk.git
 PICO_SDK_SITE_METHOD = git
 PICO_SDK_GIT_SUBMODULES = YES
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
index 048a7f1e0d..f8589e3592 100644
--- a/package/picotool/picotool.hash
+++ b/package/picotool/picotool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  42558a239b3b8f99dfcb080300e849a2eacbd0f6571efb6ccc6e259fdfaef22b  picotool-2.2.0-a4.tar.gz
+sha256  97aaf36800d2317683528cba5762e3d4e7a5de0cba729d28011a6ee94b3b7538  picotool-2.3.0.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index cf8e294835..cf70cfc7f0 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOTOOL_VERSION = 2.2.0-a4
+PICOTOOL_VERSION = 2.3.0
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
 PICOTOOL_LICENSE = BSD-3-Clause
 PICOTOOL_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
