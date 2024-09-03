Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE0DCE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711D084CEA;
	Fri,  6 Sep 2024 20:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WAF5zHew4HV; Fri,  6 Sep 2024 20:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C8FE84CF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C8FE84CF2;
	Fri,  6 Sep 2024 20:08:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA261BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3F636112B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAlX3nGZEvRY for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361E460D68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 361E460D68
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F7F486D78; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:00:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 684843620a92b0dc811676cb5d94302c9dab47ac
X-Git-Newrev: 88c7ef62df7bf266fcd070e2b24c9dea0db1e5e7
X-Patchwork-Hint: ignore
Message-Id: <20240906195859.1F7F486D78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ima-evm-utils: bump version to
 1.6.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88c7ef62df7bf266fcd070e2b24c9dea0db1e5e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version also reintroduced COPYING COPYING.LGPL, therefore add
them to IMA_EVM_UTILS_LICENSE_FILES.

The hash change in LICENSES.txt is just due to the addition of the
reference to the re-introduced COPYING and COPYING.LGPL files.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ima-evm-utils/ima-evm-utils.hash | 9 ++++++---
 package/ima-evm-utils/ima-evm-utils.mk   | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 844ba0d4fe..72e8c89242 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,3 +1,6 @@
-# https://github.com/linux-integrity/ima-evm-utils/releases/download/v1.6/ima-evm-utils-1.6.tar.gz.sha256
-sha256  3d09e77a09e985b285891f13d458653f44913879147679dce30bdbf00380d40e  ima-evm-utils-1.6.tar.gz
-sha256  d037fb0b5fdb4d1e09e246a56bdb8049fc6d9b1f9270c0ec2ae4bc8f9285165b  LICENSES.txt
+# https://github.com/linux-integrity/ima-evm-utils/releases/download/v1.6.2/ima-evm-utils-1.6.2.tar.gz.sha256
+sha256  9346a5ccd5ca77caf6a9d2ac0d83873c04d0372414a632126df4e7a88bedff4a  ima-evm-utils-1.6.2.tar.gz
+# locally computed
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LGPL
+sha256  9d2cf91f1292121f94b412abfdea1dd2d83984704f594b0a14de88d7b1cfb42c  LICENSES.txt
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 858efee8da..b7eb8ff530 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.6
+IMA_EVM_UTILS_VERSION = 1.6.2
 IMA_EVM_UTILS_SITE = https://github.com/linux-integrity/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
 IMA_EVM_UTILS_LICENSE = LGPL-2.0+ (libimaevm), GPL-2.0+ (evmctl)
-IMA_EVM_UTILS_LICENSE_FILES = LICENSES.txt
+IMA_EVM_UTILS_LICENSE_FILES = LICENSES.txt COPYING COPYING.LGPL
 IMA_EVM_UTILS_INSTALL_STAGING = YES
 IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl tpm2-tss
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
