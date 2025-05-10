Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6CAC3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 17:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CCCB83295;
	Sat, 10 May 2025 17:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aFnMNe9TdDm; Sat, 10 May 2025 17:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5226B82CB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5226B82CB7;
	Sat, 10 May 2025 17:13:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67334E0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 572AF82CB7
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-snmeLPeM22 for <buildroot@buildroot.org>;
 Sat, 10 May 2025 17:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D203682C75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D203682C75
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7EC886554; Sat, 10 May 2025 17:13:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 May 2025 19:09:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1799cfebfd5ea1312cce74b3807d4aad044bce67
X-Git-Newrev: 07eb63935aa566864cae08daeef83bb9bd113a47
X-Patchwork-Hint: ignore
Message-Id: <20250510171303.C7EC886554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-pkcs11: bump to version 1.9.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=07eb63935aa566864cae08daeef83bb9bd113a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.9.0..1.9.1 changes described at:

  https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1

Update suggested by https://gitlab.com/magerkraut at
https://gitlab.com/buildroot.org/buildroot/-/issues/109 as "There is a
issue with the database LOCK file".

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/issues/109

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index 797955a69b..5f5abfbbe8 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  35bf06c30cfa76fc0eba2c5f503cf7dd0d34a66afb2d292fee896b90362f633b  tpm2-pkcs11-1.9.0.tar.gz
+sha256  ce24aa5ec2471545576e892b6f64fd873a424371bbf9be4ca3a0e689ea11c9b7  tpm2-pkcs11-1.9.1.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index c6218d772e..b26f53de27 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_PKCS11_VERSION = 1.9.0
+TPM2_PKCS11_VERSION = 1.9.1
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
