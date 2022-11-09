Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E64C4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 06:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22EF60E7C;
	Wed,  9 Nov 2022 06:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22EF60E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPgbDiLghhtG; Wed,  9 Nov 2022 06:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CFD360E77;
	Wed,  9 Nov 2022 06:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CFD360E77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 870391BF426
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 06:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F76A60E77
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 06:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F76A60E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19GrMvtevHDq for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 06:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 220A460E57
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 220A460E57
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 06:38:26 +0000 (UTC)
Date: Wed, 09 Nov 2022 06:38:21 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <J_17FFgukFHAJ3py1djEDl5_QUB5a7N6s8WiRvCebcD5k26wrppZ-MwXCL0fbyL7wjVDKiEm68QnEAHQqxwJFTxzCro-8iX0xwMCrheVP5I=@protonmail.com>
Feedback-ID: 6956783:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1667975904; x=1668235104;
 bh=ckSc/t7OrQwxyU6350cvr5C+1pt3OHgVh3Oga2d/agI=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Co71RPmDXbRZ8SD/J2QmrDvkPxCKIHYFi/lS9ES5famayOUshUxrQ7kKrPMspNmKy
 DOU/rwLiXbqqsBfs3OlwmYKHUfjsu+I/wUwRzILdymUA6yF1Bwzh9XfyqkZRv9lI+u
 +x9f3IpZ3O3kVV8eYrqQj+E4qS28ymkPK84mIOk/JZv2trObRO16mpR0W39vbqncqU
 yUs5OeqvLZM/ECYLDayYuuNiM76wJeZ6oQMps9I3jss1jgd9oTro6FNE0ZkvTRYdn+
 zNkezk/d2qEsBxXw8ONZTZVr9wIxo4/I6N0tPIpjLEutyWF711fNuDCkqO0xPJWXDN
 iCT0ZHGMjhL0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=Co71RPmD
Subject: [Buildroot] [PATCH] package/tpm2-pkcs11: bump version to 1.8.0
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
 package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index 1d5bcc7a54..b027bad72a 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  078a445ed0e9f5009675a162b4b7b88f3520436cfbc791bb2249f37bd1f475bd  tpm2-pkcs11-1.7.0.tar.gz
+sha256  79f28899047defd6b4b72b7268dd56abf27774954022315f818c239af33e05bd  tpm2-pkcs11-1.8.0.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index adb5a46f56..9d61340775 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-TPM2_PKCS11_VERSION = 1.7.0
+TPM2_PKCS11_VERSION = 1.8.0
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
 TPM2_PKCS11_DEPENDENCIES = host-pkgconf libyaml openssl sqlite tpm2-tss
 
 TPM2_PKCS11_CONF_OPTS += \
-		--disable-hardening
+		--disable-hardening \
+		--disable-ptool-checks
 
 # Fix tpm.c:746:5: error: 'for' loop initial declarations are only allowed in C99 mode
 # Fix implicit declaration of function 'strnlen'
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
