Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BE8D637C4
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 21:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD6BF40696;
	Wed, 13 Nov 2024 21:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLtQZtCqjUMi; Wed, 13 Nov 2024 21:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84BE14060E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BE14060E;
	Wed, 13 Nov 2024 21:15:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79B596C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67E804060E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 21:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCfvPjg45Vja for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 21:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16A4040523
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16A4040523
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16A4040523
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 21:15:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 513D6B00563;
 Wed, 13 Nov 2024 22:15:33 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 13 Nov 2024 22:15:22 +0100
Message-ID: <20241113211522.31841-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731532534;
 bh=DEv/ME7pxJMo3qpHob2vt89bTHmWbmqEga+BJoiLhcc=;
 h=From:To:Cc:Subject:Date:From;
 b=H9gs4GBwbzem4rcQEADCRgquAckeXE8IfcC+nZ4WQDQT5erfZScSfp3I2F5VFto/8
 brIgE7yCPGP0geRYXC1dggPFS+T+oizJILZjGyAnjql1/y/FbnSHd/7FKwsSnUBSxe
 wFpcsy/CLmsSHy22wnrSV1f08J2wIvZD8zBIX4XyrSr5R/FvgykWjI6Vh0+cr4GeNj
 7YJwWNRA06QokHO7wWt+rBh2zJi5U+AgwoPBNOrVAC0D3NgAgd7v9RrTYE4O9pnx8N
 Ut2tSKi0h8J0kH5dCkLrft8IspGoXA33T3OQPcE8xTIPxUA9hw3mIeS1wqmKEbkvKX
 48cxJxwnNfMJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H9gs4GBw
Subject: [Buildroot] [PATCH 1/1] package/tiff: security bump to version 4.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the release note, see:
http://www.simplesystems.org/libtiff/releases/v4.7.0.html

This commit also adds the _SOURCE variable, to switch to the xz
archive, which saves ~1.5MB. The _SITE url is also updated to switch
to the https protocol.

This commit also adds a comment in the hash file about pgp signature
veritication.

Fixes:
- https://nvd.nist.gov/vuln/detail/CVE-2023-6277
- https://nvd.nist.gov/vuln/detail/CVE-2023-52356
- https://nvd.nist.gov/vuln/detail/CVE-2024-7006

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:

Minimal config, only BR2_PACKAGE_TIFF=y:
https://gitlab.com/jolivain/buildroot/-/pipelines/1541199649

Maximal config, all BR2_PACKAGE_TIFF.*=y:
https://gitlab.com/jolivain/buildroot/-/pipelines/1541210686
---
 package/tiff/tiff.hash | 6 ++++--
 package/tiff/tiff.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 3aae7dc4d5..5e2dcca73c 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a  tiff-4.6.0.tar.gz
+# Locally computed after checking pgp signature
+# https://download.osgeo.org/libtiff/tiff-4.7.0.tar.xz.sig
+# with key: B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D
+sha256  273a0a73b1f0bed640afee4a5df0337357ced5b53d3d5d1c405b936501f71017  tiff-4.7.0.tar.xz
 sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 0e5e0dd48a..5d7219d7da 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.6.0
-TIFF_SITE = http://download.osgeo.org/libtiff
+TIFF_VERSION = 4.7.0
+TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.xz
+TIFF_SITE = https://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = LICENSE.md
 TIFF_CPE_ID_VENDOR = libtiff
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
