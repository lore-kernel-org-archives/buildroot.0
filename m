Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6D1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 08:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC78827E0;
	Fri, 31 Dec 2021 08:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cf31VIX39CQ9; Fri, 31 Dec 2021 08:29:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0FD1827C5;
	Fri, 31 Dec 2021 08:29:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 348F41BF297
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 08:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23494827C5
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 08:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eflT91OJPsg for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 08:29:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31B0C82741
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 08:29:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s1so54948969wrg.1
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 00:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NqFVBTIgBjiSYYN3hycBXX8hqbq4beRseMwzhBHJENE=;
 b=TPCVb0AS2hpw4/l3Tv7/Dt19lf6O6uMN4Fm+y0G9X9DwtKiUimTBuXxy88mRU03DH3
 4Qiw7vYnoJLldHM+fqBP5K6RubPLaeEkzfu2O8i+XEY+S6zXdywAFwllgsRGDmCmOaoS
 kwzGBJfwTEosDDm1i5+B3oSG0mR89SlTCjbu1tw7efkF/aHYSAYXx9PSPJw6X24CjUt6
 NzbCamEHkz2nwR/pqXQplOnpQx1UjaEt07DeoD6eR2lbeZsg/MnrrVZG9KEd6R9BuzyA
 OffRnRy15T4FkGaPXyv9BTEjv8oFHFCNE8wU5fiovw35giFquTAZXqnvrhAbo4JcRlvE
 GyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NqFVBTIgBjiSYYN3hycBXX8hqbq4beRseMwzhBHJENE=;
 b=xcrgCrk0iTTlBFzBZh87Ie1ojrwOvy1T0NArgn8ppl76Ynf5f39O144+/mvRi9QKW1
 9I09nIH0ExkifCi+dTh2ammxpvuY9f+6dVcMXiG+Ita8e46VnrG0RHnRRjjulcXXL1NY
 NM68Movc+HVvRP8mflKFeuzeMC8EvA9IysCyAnsohaMkLIJqw/99BJlFT6H9H44kCxXH
 wlgmZmGJPcscsmcugoBgh26FD9KMOtdZJDcXLDRiuAeZgl9unvzDBcFq1xJ9ADxK4ddv
 SnWZpt3SaFGv6RomCImWnc3i8w91kO8Tma9zXJoed3kclyDyuXSFpdChACHuEX3/CAZ/
 iT+Q==
X-Gm-Message-State: AOAM53358waA5l4s2xTEnpmCPfY/0eHduq84zNAiIsdYYHH6tsc0cqH0
 QXjcNBFVPiPTRZSECs/285Nb2P71z/0=
X-Google-Smtp-Source: ABdhPJxRw+I55QdJMG6IhQCH3UoPk6mSmhgNvzog6HroFugdZmntczmg+3KU7FCZ+0NiPrxYdyYa5w==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr28235841wrm.30.1640939384291; 
 Fri, 31 Dec 2021 00:29:44 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o9sm11600553wri.97.2021.12.31.00.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 00:29:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 09:28:57 +0100
Message-Id: <20211231082857.3210018-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libexecinfo: needs dynamic library
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit eea8ba446c10701a273432552108d80fb2224ef4:

execinfo.c:32:10: fatal error: dlfcn.h: No such file or directory
   32 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ea33c8c6aa5091983837609eec5d129902183ef1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libexecinfo/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libexecinfo/Config.in b/package/libexecinfo/Config.in
index 473a4f7181..e90dfc4e87 100644
--- a/package/libexecinfo/Config.in
+++ b/package/libexecinfo/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBEXECINFO
 	bool "libexecinfo"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Library for inspecting program's backtrace
 
 	  https://github.com/mikroskeem/libexecinfo
+
+comment "libexecinfo needs a musl or uclibc toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
