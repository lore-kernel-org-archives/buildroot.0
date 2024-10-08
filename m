Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72F5CEFC56
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21342607A3;
	Tue,  8 Oct 2024 20:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nS6AEVUKuuD7; Tue,  8 Oct 2024 20:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1831860894
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1831860894;
	Tue,  8 Oct 2024 20:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FEFC1BF31C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E61F4050A
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0LJ6KnaXp-K for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C975D404E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C975D404E7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C975D404E7
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:26:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42f6bec84b5so62539235e9.1
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 13:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728419177; x=1729023977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=heUzRc9J6Q8Lz5bQi5TLrAWMMmHol6Cq69kuRI0AaKQ=;
 b=GNCc/U+CREwkPD6JpzahaqdxO7PQIXnrRvTpHxee0bIGSF6LW4flRApozSHYWfKINy
 uVZzh89U2CaOcDTb3197AH2frXQcXOM6WUxHw/fugi4PvcmHGM2usyZ2xnCNaLdHUPzN
 juQ3aGDzrfupbIJ60htqk2CwdcNP/OiEtOgnBWdB+xZRDDTpAe6LeMmq/Ij7FeNf4jYS
 4Wr9HrSPcQnpDUqAUl5kIeB8Pfyn961TojNrZbuJ08x6FM4e1zdYE0qxeiUUyjvke+FZ
 5yBXLipu9j5e2sA49khAmFWqPu8NZAYLL6fUB78ggvrkdlzcDDV2ubtsx/TDf9WD1phb
 JdEQ==
X-Gm-Message-State: AOJu0YxPnkkO84ZDse5eYh/sh6D04lgUi7X9modvfHvztjgFE5UQoEJC
 Qc1kEVtiKok8LYa7LZ0f2tbv1dWZGJ55K9ee+e2atDeI+PyYuOECPEQpo5WLee7bfEo04jEPv2o
 dU/8=
X-Google-Smtp-Source: AGHT+IGEg84FTRm30driUOHicrYPxK7Qa6yAlFBWQ3mS+G3smB/ZgfNF4Ri+HEHdz7xH73y2eeafNg==
X-Received: by 2002:a05:6000:148:b0:37d:2ea4:bfc9 with SMTP id
 ffacd0b85a97d-37d3a9d7e61mr57330f8f.21.1728419176593; 
 Tue, 08 Oct 2024 13:26:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1695eee7sm8793948f8f.82.2024.10.08.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 13:26:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 22:26:09 +0200
Message-ID: <20241008202609.3832478-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008202609.3832478-1-dario.binacchi@amarulasolutions.com>
References: <20241008202609.3832478-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728419177; x=1729023977;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heUzRc9J6Q8Lz5bQi5TLrAWMMmHol6Cq69kuRI0AaKQ=;
 b=hOqo5Bnowrhd8zxIXNh9N+pHhDIAk/xSeXEtIddlI+sFAwIsaN1rooV6ZiTAqC41Sj
 Sex9BFV/LSDkVK2iq7NtTN6CMVHsTUbMKQf6DCwkOwqjIGuWZ/OVVJgPvYJNoYtOgbUt
 5m31hlCJGXxgzBQd7UDX+v+qHBrZDAR6HCsWU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hOqo5Bno
Subject: [Buildroot] [PATCH 2/2] package/acpica: bump to version 20240927
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 20240321, see:
https://github.com/user-attachments/files/17171011/changes.txt

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/acpica/acpica.hash | 3 +--
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 4170587f3a3a..c3e7fda3406e 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,4 +1,3 @@
-# From: https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html
-sha256  54a299487925fd3e0551c95f9d5cee4f4984930273983eff67aa5cd46f8f338b  acpica-unix-20240321.tar.gz
 # locally computed hash
+sha256  57988fb55541e694dfa3323bd19db74b65d37e942bebef559ed51e8cd9348b43  acpica-unix-20240927.tar.gz
 sha256  b28f54dc421531bbe269afd8c28bf6fdfd6affbe50c2831464f777ec1766d4a5  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 5b1dfbbba2e7..a2abcf755817 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20240321
+ACPICA_VERSION = 20240927
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/acpica/acpica/files/14718333
+ACPICA_SITE = https://github.com/user-attachments/files/17171019
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
