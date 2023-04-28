Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8712C77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 23:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FCE4843D8;
	Fri, 28 Apr 2023 23:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FCE4843D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvqvpARe0NIa; Fri, 28 Apr 2023 23:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC16843E0;
	Fri, 28 Apr 2023 23:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC16843E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54F8B1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 23:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EBCD842EB
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 23:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EBCD842EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dN0EBJkUJi4f for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 23:06:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 607E384300
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 607E384300
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 23:06:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-304935cc79bso254839f8f.2
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 16:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682723185; x=1685315185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HvqJGXgvaGXsMKdKtYZy000jo1HJ84dnSFobR/cQb/I=;
 b=fYvk3YERx0CQsPGDD7yGacOa/F/yb7iHHm/w+SAG4B681BOeQAKZVk+ISiwsnanNTP
 6lDRZb8myLCFjkTohRXTTJcsNq6UoX8RFU1oRUdr5sRH4/f8mmCB/UkHPORs5LJRMyq2
 KYqfvcUDUZC5XfVUDSAN9k397h/qrdajJ6wW79K8EeHqqd9uH8vR6ALsz4ce23XpTly1
 PUaZoE3tS8wc+AUZcmBtoi5HbdjBuyWwkW/OARRaczGvkJXc7dHI+huP6fwSH/HPepWg
 4MmteMiWDQwMBFd3HA7CW7Xx+m3DrBds0zjnPAM4d1uvZVgXzqp2uVgYCO+6BviTFXj9
 bRmg==
X-Gm-Message-State: AC+VfDyU1wl5mYLDAScJqm0q7Y46D9fqVjdir4+ht5wmednJ1S5KajqE
 3kOH/lj75atDABbk6dy9SBkvRQz9yK8=
X-Google-Smtp-Source: ACHHUZ53eHZANqZNiyOATJN9TKmX6ci/acBXbRVW0/BrsKB6yimbFXu+BSMGoytaeNcQBSJnoWue+Q==
X-Received: by 2002:a5d:534a:0:b0:301:2452:e53 with SMTP id
 t10-20020a5d534a000000b0030124520e53mr5023883wrv.67.1682723185364; 
 Fri, 28 Apr 2023 16:06:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 n16-20020adfe350000000b002c71b4d476asm22146330wrj.106.2023.04.28.16.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 16:06:24 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 01:06:18 +0200
Message-Id: <20230428230618.261911-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230428230618.261911-1-romain.naour@gmail.com>
References: <20230428230618.261911-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682723185; x=1685315185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HvqJGXgvaGXsMKdKtYZy000jo1HJ84dnSFobR/cQb/I=;
 b=IKYj6/n+YlyKX+BZok9yD5yvGAjjl8KKgwF4gQq9xcKRTmkxOXjftRJoV1birz6/H4
 /7wVJ6xjBlBF4/5PcpjKg+0dyu1ZdwwnEY0kc9OCFYJ7ACIv1RlpgmesO6Cv4qNzc5f4
 4JNhsCGZ9+hpoAoXWgJ0Pegr1D1/IoSsOWK/N1qsIkPEyXgROg9vhvOMugAq30lpcYTb
 ER/4BiLN/9AD/5FQL/bJYnniO016YLYpsGyhWFQBKxTG8eJC1KdQS762kc3PVwFGyijS
 m/EJV7/ryfAAKoEjOYdKtWcN8Mq8YoE+8NHUrHiQ8TkyAQN6ukm9qo//Y5qjMeSiZqS+
 d4LQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=IKYj6/n+
Subject: [Buildroot] [PATCH]
 support/config-fragments/autobuild/br-arm-internal-glibc: update to
 bleeding edge components
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The br-arm-internal-glibc.config used to be generally used as a configuration
to test the bleeding edge versions of components. However, it has been
lagging behind somewhat and produce invalid configuration since binutils 2.36
removal... so let's bring it up-to-date:

- Binutils 2.39.x
- GCC 12.x

Since Buildroot 2022.02, the autobuilders doesn't use the csv file anymore
but the test-pkg script still use it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../config-fragments/autobuild/br-arm-internal-glibc.config   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
index fb930cbef7..cd148f32e6 100644
--- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_BINUTILS_VERSION_2_36_X=y
-BR2_GCC_VERSION_11_X=y
+BR2_BINUTILS_VERSION_2_39_X=y
+BR2_GCC_VERSION_12_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
