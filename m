Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE2AC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 19:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CA67404F9;
	Sat, 24 Feb 2024 19:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVdhuwJkRrkl; Sat, 24 Feb 2024 19:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 982A140112
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 982A140112;
	Sat, 24 Feb 2024 19:27:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E46671BF289
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 19:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1C8D4064E
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 19:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SM9URAfThuq2 for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 19:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1447740637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1447740637
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1447740637
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 19:27:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:48ec:5da2:e30:94b9])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5C97919F5AF;
 Sat, 24 Feb 2024 20:27:39 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 20:27:32 +0100
Message-ID: <20240224192732.1298236-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708802860;
 bh=SbEuglarYlSHmuxg6sTKIFE423Q/21uh5a5T8F7WPzU=;
 h=From:To:Cc:Subject:Date:From;
 b=KZYIHgy2nha2tERZOXap/oI5qVWSDqUmwgGraXVhgR+zhRsrMgB01pHA7y+ys3Tqb
 X9rjrSnDLOLY0y7X3P6+ENZVo0fvb1ALDmVIM8WxqG0kWY+1FMKW0M49bBU+ue05bG
 nn36+VIFcrdLcSBSHuz2LtTuhpa0pKZf+1aXbFYvSoMELdYwHIJypmNTXNdx+inA88
 B3waouhQhkL4s5GlY3YBKqCNRb+jzQoMf9EX/C4i3ppire316Ve7dAueAYBdsyCgr0
 1Z1QfHCFaBn/T7DNzLJ8d60t927vwWLtKRZnWRG1g4vZGmk2xoOw25m4JQVUMAJqVs
 /le7ksPtGOyVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KZYIHgy2
Subject: [Buildroot] [PATCH 1/1] package/xz: bump to version 5.6.0
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

This commit changes the version branch from 5.4.x to 5.6.x. This old
stable 5.4.x branch is expected to be end-of-life. The release note
mention in [1]:

"""
There currently are no plans to maintain the 5.4.x branch, but
releases could be made if there is community interest.
"""

For a change log since 5.4.5, see [2].

The COPYING licence file hash has changed. Most public domain files
are now licensed under the Zero-Clause BSD license. This release
explicitly set the XZ logo under the CC-by-SA-4.0 license. Due to
those changes, the new license files COPYING.0BSD and
COPYING.CC-BY-SA-4.0 are added to _LICENSE_FILES and in the hash file.

The package homepage URL https://tukaani.org/xz/ now redirects to
https://xz.tukaani.org/xz-utils/. This commit updates the homepage
URL accordingly in Config.in.

Finally, the package download URL moved to Github. This commit changes
the _SITE to reflect that change.

[1] https://github.com/tukaani-project/xz/releases/tag/v5.6.0
[2] https://github.com/tukaani-project/xz/blob/v5.6.0/NEWS

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit fb6274f with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_xz
    ...
    OK

    utils/test-pkg -a -p xz
    ...
    45 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/xz/Config.in |  2 +-
 package/xz/xz.hash   |  8 +++++---
 package/xz/xz.mk     | 14 ++++++++++----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/xz/Config.in b/package/xz/Config.in
index 687bd554821..7130fa5e8e4 100644
--- a/package/xz/Config.in
+++ b/package/xz/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_XZ
 	  invoked via appropriate symlinks will emulate the behavior
 	  of the commands in the lzma package.
 
-	  https://tukaani.org/xz/
+	  https://xz.tukaani.org/xz-utils/
diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 3d93ad6b5ee..46edd336bc9 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,9 +1,11 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.4.5.tar.bz2.sig
-sha256  8ccf5fff868c006f29522e386fb4c6a1b66463fbca65a4cfc3c4bd596e895e79  xz-5.4.5.tar.bz2
+# https://github.com/tukaani-project/xz/releases/download/v5.6.0/xz-5.6.0.tar.bz2.sig
+sha256  88c8631cefba91664fdc47b14bb753e1876f4964a07db650821d203992b1e1ea  xz-5.6.0.tar.bz2
 
 # Hash for license files
-sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
+sha256  0864e508475f20b43a2393957fdb5a966558099ffa8fed1e3e73fe2b3eebb145  COPYING
+sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  COPYING.0BSD
+sha256  23ee78c8bae49cf08ea2f0c84945c66b987ebe4520881fb51b3dad4fb43d07c2  COPYING.CC-BY-SA-4.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 547959c743d..88c79254943 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,13 +4,19 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.5
+XZ_VERSION = 5.6.0
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
-XZ_SITE = https://tukaani.org/xz
+XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
-XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
+XZ_LICENSE = Public Domain, 0BSD, CC-BY-SA-4.0 (logo), GPL-2.0+, GPL-3.0+, LGPL-2.1+
+XZ_LICENSE_FILES = \
+	COPYING \
+	COPYING.0BSD \
+	COPYING.CC-BY-SA-4.0 \
+	COPYING.GPLv2 \
+	COPYING.GPLv3 \
+	COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
