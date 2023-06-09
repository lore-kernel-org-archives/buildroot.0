Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C959C7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 03:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E53C84064F;
	Fri,  9 Jun 2023 03:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E53C84064F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yaxvzIYecIDP; Fri,  9 Jun 2023 03:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2723D405EB;
	Fri,  9 Jun 2023 03:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2723D405EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 734281BF966
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 03:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46324610C5
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 03:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46324610C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afis71uz7-VH for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 03:38:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0BB861080
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0BB861080
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 03:38:01 +0000 (UTC)
Date: Fri, 09 Jun 2023 03:37:43 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <3BZE266B89j-Oimbd_8h4tun1G60GrejVfGJajLoDnLBoJ56dpXbbiDB5cz75lracrEQCyPa8GTVynXu27sk3-16XX72SRO_X-dJ8cmJXLs=@protonmail.com>
Feedback-ID: 6956783:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1686281878; x=1686541078;
 bh=IcWR9pd4r+3lhV3Y3RGuhvIDDZX2CMnPIGBpdOlLqcw=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=PFm7bcn6IOMURhp20lnj/cG4gANSsVRVL65uz890PxFSm4289+QrSjtRTXh3vBpzY
 mW8WBFgz8qMa6B9Xgsb4CjIYGOHsJ/SgKnQWNEMIsnuxjp+l/3TIix83s4YVuWxwey
 XLoEtXrV75DTG9DBF5MDWnajUYNPYkA/6sYHFcUTvVHCP7vg3bqalCIp1XodKy9QYI
 4idnPSVWJn9kmHtL7HEcijJeyMLgo80uBi5ns08hFEt1U+6DgjVdU7X5C9D7POVkjb
 iUxkUjNnDXU5oFqgbYSZmzd+Csr1pExzhiE3jJZ+MtCxAWR+A0ymWwY6htiGoBZBRM
 PO4oUBfwlAALQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=PFm7bcn6
Subject: [Buildroot] [PATCH 1/1] package/tpm2-pkcs11: bump version to 1.9.0
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
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index b027bad72a..797955a69b 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  79f28899047defd6b4b72b7268dd56abf27774954022315f818c239af33e05bd  tpm2-pkcs11-1.8.0.tar.gz
+sha256  35bf06c30cfa76fc0eba2c5f503cf7dd0d34a66afb2d292fee896b90362f633b  tpm2-pkcs11-1.9.0.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index 9d61340775..18f04157e3 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_PKCS11_VERSION = 1.8.0
+TPM2_PKCS11_VERSION = 1.9.0
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
