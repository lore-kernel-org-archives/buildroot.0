Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ADCC83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C6B816D4;
	Wed,  9 Jul 2025 19:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rzQt7D1gH_S; Wed,  9 Jul 2025 19:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 644A281285
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 644A281285;
	Wed,  9 Jul 2025 19:07:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 252FA69
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFB9F6060A
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhBAT38A3MwE for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A3560693
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40A3560693
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E58086307; Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Jul 2025 21:04:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62788e0e497ab8e8b6f2819a72c3b391ed3807eb
X-Git-Newrev: 1d170a1c94599385513566812673c05b4e844d7a
X-Patchwork-Hint: ignore
Message-Id: <20250709190702.2E58086307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-abrmd: bump version to 3.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d170a1c94599385513566812673c05b4e844d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With 3.0.0 users must be in the tss group to access tpm2-abrmd.

Upstream changelogs since 2.3.3:
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.0
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.1
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/3.0.0

Tested with package/tpm2-pkcs11.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tpm2-abrmd/tpm2-abrmd.hash | 2 +-
 package/tpm2-abrmd/tpm2-abrmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
index 1c6e739056..cb5d9314f0 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.hash
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1e587808c6739079d59f124d9c1a0058f8d34dd84f1f656c946667fa0a181c48  tpm2-abrmd-2.3.3.tar.gz
+sha256  d59aff34164aa705b05155b86607f6b66918a433104f754a3fcf76216dd9f465  tpm2-abrmd-3.0.0.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 0e62cb176a..2bb0ebbbb5 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_ABRMD_VERSION = 2.3.3
+TPM2_ABRMD_VERSION = 3.0.0
 TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
 TPM2_ABRMD_LICENSE = BSD-2-Clause
 TPM2_ABRMD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
