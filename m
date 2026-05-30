Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36332CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 064C86F545;
	Sat, 30 May 2026 13:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9yHzhqJVYtf; Sat, 30 May 2026 13:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E1B56F54E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146280;
	bh=F2pv23dddcIfTOZIzHm0n/c5cj0LTMK/lsaNPvwUZz8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T0Kj3iQNBaczV3uthqy371FTxq/SP+3sxdcsEvyicCzEk9qHAfvjcEceT9pJf4pSu
	 oQV59ZvyXJixjSgJYnqTTOniXp9HZsCjQmyhCPtNXU5n42WKV+GfxX9SCJyGKwQogA
	 7H5qarT0TmOFxi0OGUXCmzaBUAzNFk1sqtqlTfmeGBmcKyIiww0IUoCOFmERcKvpiS
	 y50hS2dN+ceQvUUC9jodPv8d39wiVgmOftyMY4OpUkswWkSb66p7k5J14r1FqWsa+4
	 mHg+m78SnVVHCa5NBknNJpuhqsZF/UZJ5/+RosCWm4VePn7eaWkTostQ12noJiKNfW
	 tAJaEDvhUoNfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E1B56F54E;
	Sat, 30 May 2026 13:04:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C063D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 988DB80F09
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JEaGrbEaIPP for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCDC180EF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCDC180EF2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0C6B87500; Sat, 30 May 2026 13:04:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 14:59:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9233cf95933f69fe3e3f4aa23fbb26da148e09cc
X-Git-Newrev: f009a9f804b8a148490e2301fc2831aa1d0601de
X-Patchwork-Hint: ignore
Message-Id: <20260530130424.C0C6B87500@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tpm2-totp: bump
 version to 0.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f009a9f804b8a148490e2301fc2831aa1d0601de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/tpm2-software/tpm2-totp/releases/tag/v0.3.0

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-totp/tpm2-totp.hash | 2 +-
 package/tpm2-totp/tpm2-totp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-totp/tpm2-totp.hash b/package/tpm2-totp/tpm2-totp.hash
index f7cf06162c..54de933e8d 100644
--- a/package/tpm2-totp/tpm2-totp.hash
+++ b/package/tpm2-totp/tpm2-totp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0b2b63cc7ea74f5a6952f2cd689896c08f6b94ee6865f48af609f9a8ac247dc1  tpm2-totp-0.2.1.tar.gz
+sha256  1a8c83dc0d0dc58bd85a3fbfc9da6e39414c0d33f1a19886cde20f063f0c527b  tpm2-totp-0.3.0.tar.gz
 sha256  67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE
diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
index 42607c0b73..1fd0a30d03 100644
--- a/package/tpm2-totp/tpm2-totp.mk
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOTP_VERSION = 0.2.1
+TPM2_TOTP_VERSION = 0.3.0
 TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$(TPM2_TOTP_VERSION)
 TPM2_TOTP_LICENSE = BSD-3-Clause
 TPM2_TOTP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
