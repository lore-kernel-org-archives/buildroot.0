Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28010C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 21:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B580960FAC;
	Wed,  9 Mar 2022 21:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VoxaFSTT0BS; Wed,  9 Mar 2022 21:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D560B60F88;
	Wed,  9 Mar 2022 21:35:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 098201BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE116415F8
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8-65WqzfH3l for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 21:35:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10615415EA
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 21:35:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t11so5033826wrm.5
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 13:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HGq/npOQ8Y/vZnUP72zzUHBR7pTAeI3KlNg42seZdeo=;
 b=aByjsjZxoJwa63ilUs3RUdyKLUJ+coeh7fiHwWJhLzJVxJN/dSwcjx3gkRJ1WRSI8K
 0W78GinbfS5CixY5bWYyZxKUoXzY/KzlwF5cfB7gEFsKsx12TlWwx/c5Pdo5T2AbMUyU
 OID2r2eHJzzecF4/8TIXXS0NOdzgZ2KGldKiFY5OXqnvZq2UYVoq/chSQ4S+WOt5HAMd
 QxDm7keZN6TsmjnrMT2kgAJjq4Ecm/27NIpoQE3kwik7nUFt0+TBRh/hTSuXg7aLb50U
 XNXOE5gBXH0svPvNmvVnYPXASCPiAG6tUNqQcVKiuwJdUfQc39U74PM9PhdbPB1weyvm
 nOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HGq/npOQ8Y/vZnUP72zzUHBR7pTAeI3KlNg42seZdeo=;
 b=Esv2hFLIKLpuj43qeVlO1tyRjlw4enGxYMoaUF/rwcd2d+dllHrQHCglzjeuKmNISR
 99I2QIN5zgAl0bE9WQaBRhHoY+kvLbe8WgKr8IPtGY5F74d9Hhcmw4djBejsFeRGdrJm
 rCrWIgPlwDiZZacBbL2H0bJzA9m2TpHvL17On0SuvljiICVFJ7nS3KXwRuW/WMMdjAgs
 P243beZEBkpzgtoRmU0/fvIG+KEvYxHjHObcwzkHlK6AUo7OnC/84mu5zpC+qjZOXXHB
 viwad01vWISh3eJfBDO4/gZ4AU/Bb1w8XGEABCcxizH625Og8z+t/thLxIJIpJvEHG/g
 /Qrw==
X-Gm-Message-State: AOAM530aH2thZFN291s4c1S3Tj+7qpd4MrSC7XjEs6SebuJq3rK0Sf99
 aGm01IdkPJr5SJpTDQ0/6tuyz/brH3U=
X-Google-Smtp-Source: ABdhPJyKsUoEeQ97q7qg3K93fyewKnBIGet+jUF/lfddxItycSvNkD7yH5ZXjOf3o5SIlNxYAxikgw==
X-Received: by 2002:a5d:4d4b:0:b0:203:75dc:b1a2 with SMTP id
 a11-20020a5d4d4b000000b0020375dcb1a2mr1189314wru.167.1646861748907; 
 Wed, 09 Mar 2022 13:35:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c19ca00b00389860c6d3asm6877516wmq.23.2022.03.09.13.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 13:35:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 22:34:59 +0100
Message-Id: <20220309213459.677932-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbguard: add USBGUARD_CPE_ID_VENDOR
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:usbguard_project:usbguard is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ausbguard_project%3Ausbguard

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/usbguard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 8df8aedeb3..54a4031056 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -8,6 +8,7 @@ USBGUARD_VERSION = 1.0.0
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
+USBGUARD_CPE_ID_VENDOR = usbguard_project
 USBGUARD_SELINUX_MODULES = usbguard
 USBGUARD_CONF_OPTS = \
 	--with-bundled-catch \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
