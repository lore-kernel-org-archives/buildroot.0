Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C01EC43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 19:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38FEF82C5E;
	Mon, 13 Jun 2022 19:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9F5Afuutggj; Mon, 13 Jun 2022 19:56:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C4882C4D;
	Mon, 13 Jun 2022 19:56:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD5711BF2BF
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 19:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCB0160E48
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 19:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvwkK4e5iH9L for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 19:56:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF33B60E39
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 19:56:16 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w17so928005wrg.7
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a65Pc4Vrav+6Gqqtd0Z0A8ZhhhwvVYmBv2r/jZiU4h0=;
 b=aZQN/zSBf19ugTy5kDmhQpcSI+knsYkzPTeXARtIDX/TcWE65zIxsadjqLMyBKZnqT
 o0reoXAR8xp8pqdlEL3NUoJF5abuADaFx0TtRdU3DOoudGNlqbEH4tB5X250i0tQA81M
 Pfr5OrSXGQdg2kNzouRMFMRtwTbWLgW7WJcYtNqIHVvIFRnVwCFZgjH61fmW0mzSJcI7
 TJ1le+SL7g5y7EPh6eHHOLT36SCY5b4lDW2OZ31PDRQwjZCb16df+fKFcqyz9ZEbPrT/
 ZLLuLz8urLa3o32lIE6wgy58c4XaNrl+IhSPAkFVMcZxadqfPKW37RG4Hc3mDWZsNYXZ
 r2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a65Pc4Vrav+6Gqqtd0Z0A8ZhhhwvVYmBv2r/jZiU4h0=;
 b=2WnImH7l7cEPBkezYQezdEQKaY9/LUUPCz/TPO3IDuFDySooPrQ7el/M/sHCIXPxU0
 VG80wOhen1qk0YBtjo4SyL8+4h/PznUc+sLuKHYDGZ3d0QjlpjX7J9/EHH9mWMTqrtos
 nb//t/b8coLrzv3fcuo6lV9jKCfyYtxt4pXZSiT88eJlOO7CRGn9/R1s2J0A4WRu1p1F
 F8od7zyQtre3MNBLgDqeoYDDM8anbQu6Zm2pSMBPV2QNO5NiM2KsO3Rp0VcGXjxGrp2B
 aIJ2KxkK1MkIdy0GPNlGtlbBRfovLM0nSkJkr3foyMs/MnxP+cHc9ZYxEDzlrtSbSflN
 ws+A==
X-Gm-Message-State: AJIora8xSFFmhKDQEMEdsbajmPYLTDkCI9ZaWP7I6ux19WiCTGzPNTMD
 PBCv/QKaCvmDHrxp4BqvExoS4geNlH4=
X-Google-Smtp-Source: AGRyM1vggwPXI3JOxkk/sjRV8G+RHar/I/lFizPy/JTzrpjSoH3NzRtuSAwit+QUMh/BM7nvIVZFTw==
X-Received: by 2002:adf:f68f:0:b0:216:10c6:b389 with SMTP id
 v15-20020adff68f000000b0021610c6b389mr1356767wrp.251.1655150174553; 
 Mon, 13 Jun 2022 12:56:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d4e8a000000b00210320d9fbfsm11159586wru.18.2022.06.13.12.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 12:56:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 21:53:25 +0200
Message-Id: <20220613195325.290672-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613195325.290672-1-fontaine.fabrice@gmail.com>
References: <20220613195325.290672-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/sofia-sip: security bump to version
 1.13.8
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-31001, CVE-2022-31002 and CVE-2022-31003:
https://github.com/freeswitch/sofia-sip/security/advisories/GHSA-79jq-hh82-cv9g
https://github.com/freeswitch/sofia-sip/security/advisories/GHSA-g3x6-p824-x6hm
https://github.com/freeswitch/sofia-sip/security/advisories/GHSA-8w5j-6g2j-pxcp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 6f6ff6d052..ae2b3e725c 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d39a3287038f1c9a747c1abc94a1379a726a9dfaf969285f955141883f7b810f  sofia-sip-1.13.6-4152840260.tar.gz
+sha256  ebd006a98a7dff6e7f4d8357c5ebeee1d3bee3ac29ff213a4909e845f230fcbe  sofia-sip-1.13.8-756ab9b5c9.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index c52045091e..80e59057c4 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.6
-SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-4152840260.tar.gz
+SOFIA_SIP_VERSION = 1.13.8
+SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-756ab9b5c9.tar.gz
 SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
