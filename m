Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC19C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C701840B9A;
	Fri, 19 Apr 2024 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rG_Iv1k_V6nB; Fri, 19 Apr 2024 21:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE43641A52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE43641A52;
	Fri, 19 Apr 2024 21:52:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D56A91BF977
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1E44606D0
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCvuH65NeqlQ for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:52:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6015160680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6015160680
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6015160680
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:52:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9A8FFB0037C;
 Fri, 19 Apr 2024 23:52:18 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:52:12 +0200
Message-ID: <20240419215212.1025654-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713563540;
 bh=b+XWthabHO1dGWNe1ocpGcRFX9NQ6mSoc6TvGY558C0=;
 h=From:To:Cc:Subject:Date:From;
 b=vD7svOBEs+ZRfS8CKkiO/MpAOSMXkzl5trdNFkp1HAtbJm5bBQVg0EkQV7/odE9hQ
 58SdEK1vTOx7YJebi3mu9WPcEaZSHYmSeasNrG+wiIrfg3dVhuv4dflQhPwePyqkLq
 q1mZ4WmSVgNPQFI/NSGBJC8IdA31+C/n05SGhRSb3omnmNpCZFQfV9ndRCbXA7G2/j
 Vaopzm3qPWNs3sIO7o7GAcL5vp2v4QfPm4W1ycuhE4mYfq2rqCm+4nUn8lzSEbN0/l
 cv2il7KptTh5iR4uNmEwZnkbzZ5KwfNnjzejIf2IV4Qsz9BwPgyv6ozuiB4zM6SmG9
 c/+1TAqFDy78Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vD7svOBE
Subject: [Buildroot] [PATCH 1/1] package/acpica: bump to version 20240321
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

For change log since 20230628, see [1].

License file hash changed in [2], due to year update.

The upstream download page also changed the published hash from sha1
to sha256. This change is reflected in the hash file.

[1] https://github.com/acpica/acpica/blob/G20240322/documents/changes.txt
[2] https://github.com/acpica/acpica/commit/c18edfb1abfb50521a363f811bc8e1e64213bd00

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on master branch at commit 256aa8e with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p acpica
    ...
    42 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_acpica
    ...
    OK

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.boot.test_edk2
    ...
    OK
---
 package/acpica/acpica.hash | 5 ++---
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index dd9f8a1d22b..4170587f3a3 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,5 +1,4 @@
 # From: https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html
-sha1  3b893fb771cf3fbd3531de3036e1a5bfc624c9d2  acpica-unix-20230628.tar.gz
+sha256  54a299487925fd3e0551c95f9d5cee4f4984930273983eff67aa5cd46f8f338b  acpica-unix-20240321.tar.gz
 # locally computed hash
-sha256  86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce  acpica-unix-20230628.tar.gz
-sha256  905d6f191f3c29aa673602d9c66eb8df00f7e1b35064a081e0de81284ff17ee6  source/include/acpi.h
+sha256  b28f54dc421531bbe269afd8c28bf6fdfd6affbe50c2831464f777ec1766d4a5  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index bbabd9de69a..a3d682257d6 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20230628
+ACPICA_VERSION = 20240321
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://downloadmirror.intel.com/783534
+ACPICA_SITE = https://downloadmirror.intel.com/819451
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
