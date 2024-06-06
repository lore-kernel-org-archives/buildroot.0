Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E78C27C75
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 10:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DDFE60EE5;
	Thu, 13 Jun 2024 10:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2jw1jSKENPV; Thu, 13 Jun 2024 10:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A183361115
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A183361115;
	Thu, 13 Jun 2024 10:08:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 632511BF354
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60DDD413F6
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqFXXRPPwLWC for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 10:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 416C3413FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 416C3413FB
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B13B87F30; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 13:49:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f820d41f0a7479bd43b72dcc4f70b978e5d0ed70
X-Git-Newrev: 7c286c345cf42bc341a3f0502e33fc8477fdd904
X-Patchwork-Hint: ignore
Message-Id: <20240613100500.3B13B87F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tools: bump version to 5.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c286c345cf42bc341a3f0502e33fc8477fdd904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tpm2_encodeobject is essential for testing RSAPKCS1 and ECDSA TPM2 signing
keys, as the key blob is loaded to the chip in DER format defined by ASN.1
schema.

Link: https://lore.kernel.org/linux-crypto/20240528210823.28798-1-jarkko@kernel.org/
Cc: Erik Larsson <who+buildroot@cnackers.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
[yann.morin.1998@free.fr: fix path of LICENSE file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tpm2-tools/tpm2-tools.hash | 4 ++--
 package/tpm2-tools/tpm2-tools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index f50a896363..cb7e8085d6 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c0b402f6a7b3456e8eb2445211e2d41c46c7e769e05fe4d8909ff64119f7a630  tpm2-tools-5.2.tar.gz
-sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE
+sha256  3810d36b5079256f4f2f7ce552e22213d43b1031c131538df8a2dbc3c570983a  tpm2-tools-5.7.tar.gz
+sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  docs/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 12f924eee5..cdb8931a3c 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 5.2
+TPM2_TOOLS_VERSION = 5.7
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
-TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
+TPM2_TOOLS_LICENSE_FILES = docs/LICENSE
 TPM2_TOOLS_CPE_ID_VALID = YES
 TPM2_TOOLS_SELINUX_MODULES = tpm2
 TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
