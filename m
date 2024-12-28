Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A38E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 19:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 750DB4052A;
	Sat, 28 Dec 2024 19:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzLJ25Prgi7h; Sat, 28 Dec 2024 19:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1A240523
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1A240523;
	Sat, 28 Dec 2024 19:24:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1950FE0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 19:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E32D980ED4
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 19:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8IJJY8XfCD6f for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 19:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBFB780ED3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFB780ED3
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBFB780ED3
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 19:24:41 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 0DE37240B4B;
 Sat, 28 Dec 2024 20:24:40 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id D9966240578;
 Sat, 28 Dec 2024 20:24:39 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 3F760240AC1;
 Sat, 28 Dec 2024 20:24:38 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, alistair@alistair23.me,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Sat, 28 Dec 2024 20:23:41 +0100
Message-ID: <20241228192341.929080-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2085
X-purgate-ID: 154282::1735413879-7953D89E-B15D9317/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735413879;
 bh=5XRKWzCRCWiv1YMvlWjhhWuJad+8JEzoIqrfZPV/VWs=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=oWSdNljHzXjIe+te8FdW4UxraMsOaMZNT2wzKirYqKroH2j7Qir2Y58rKSuql4utn
 CRmzEQ5w8P5zbwQpFcP8GPOjif/V0q48JWrYZRlfSMmh/CO44eyS9VvlVCoCDg7Qrk
 ++NIDZNDoRBaQirWopdfMbaK8NKGDZvytvQNX/XBEKfe2dsgVGkPj4mRH3OQDA3aD0
 QRAexna14Mwxn0l5am393iqhh5OFqvinrplSeIMqL3Nl6NSZiaSs719xkxg0gCNpgU
 XJkmy57deic3BzNIHfjGmWEB5SN6Wt/nvTmVgwmkmSITQ5TMrQoJa7TcrM/Izmdn6L
 P3jXEEYxAzDtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=oWSdNljH
Subject: [Buildroot] [PATCH 1/1] boot/opensbi: bump version to 1.6
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kilian Zinnecker <kilian.zinnecker@mail.de>

Release notes at:
https://github.com/riscv-software-src/opensbi/releases/tag/v1.6

From release notes:
"Overall, this release adds more ISA extensions, drivers, and other
improvements."

The version bump was tested with the qemu_riscv64_virt_defconfig.
Howerver, due to a ROM region overlapp issue, the
qemu_riscv64_virt_defconfig had to be modified for the test. Still
the OpenSBI v1.6 does work. The qemu defconfigs will be adjusted in
future patches. For more info regarding the issue, also refer to:

https://github.com/riscv-software-src/opensbi/issues/372

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Tested-by: Julien Olivain <ju.o@free.fr>
---
 boot/opensbi/Config.in    | 4 ++--
 boot/opensbi/opensbi.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 7604be29d9..98d6103ed6 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "1.5"
+	bool "1.6"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.5" if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.6" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index c69bcf7150..84ad67b2e3 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9880485672a3a2c48a81d373df6707517b568402f2d3f9eecbfa9d83f8e6f22f  opensbi-1.5.tar.gz
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
