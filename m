Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F98FC64EC4
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 13:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 311CA606A9;
	Sat,  4 Mar 2023 13:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 311CA606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1CmUFivdUf9; Sat,  4 Mar 2023 13:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783E7606FF;
	Sat,  4 Mar 2023 13:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 783E7606FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F3B71BF3E3
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6648141554
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6648141554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxD_2urcnYmz for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 13:35:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D071741548
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D071741548
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 13:35:28 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E3994B0053A;
 Sat,  4 Mar 2023 14:35:23 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 14:35:16 +0100
Message-Id: <20230304133516.3412402-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677936925;
 bh=zVwiB90f8Gpn1Vir/WN7rJMaR0/EOb4iEPnvpTocjOI=;
 h=From:To:Cc:Subject:Date:From;
 b=IUlzJUDKehDMQeo6uUyDM/SalszHiyWKM5+KInLy9//qHrSBHjetyrsDxxxmE/4Ke
 uThlx8R3BXc/03sEGJqLEjuI2ioO5y2Stfzc1YF6IZzNVywdwX3jC8WOxsLd6Zqz1j
 G6PLeWVFjDNrRO4dse1W6URh4SrikT+PFwBqwppfjbPhlNJOJe0CF/CBb3k/FcF1C/
 6yliLD2APv++Cl+LzD/P8LP+gkJtP515dwmFSXuvbgB3toy7HH2eFGm8/GFJxxjKHx
 hmOMXonX74QIyQJTyVhpR8CdI60Xm5kF9K2kzPilFsK03gMvZInyolyKeWPiTEg/t8
 tCctUxvkrb2nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IUlzJUDK
Subject: [Buildroot] [PATCH next 1/1] package/ola: bump to version 0.10.9
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/OpenLightingProject/ola/releases/tag/0.10.9

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
This patch was tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_ola
    ...
    OK

    utils/test-pkg -p ola
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/ola/ola.hash | 2 +-
 package/ola/ola.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ola/ola.hash b/package/ola/ola.hash
index 7565adabde..a1a5577ed3 100644
--- a/package/ola/ola.hash
+++ b/package/ola/ola.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  102aa3114562a2a71dbf7f77d2a0fb9fc47acc35d6248a70b6e831365ca71b13  ola-0.10.8.tar.gz
+sha256  44073698c147fe641507398253c2e52ff8dc7eac8606cbf286c29f37939a4ebf  ola-0.10.9.tar.gz
 
 # License files (locally computed)
 sha256  e6b95dd336a57abb343e2988ac22b7e21b35c5b86003e6eb9e066ffbeeff9da7  COPYING
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 82615e8155..efaa5b6e3e 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OLA_VERSION = 0.10.8
+OLA_VERSION = 0.10.9
 OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
 OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
