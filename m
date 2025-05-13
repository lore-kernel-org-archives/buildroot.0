Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0D0C3ABD7
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 09:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D0140DB3;
	Tue, 13 May 2025 09:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bas19VXBppEw; Tue, 13 May 2025 09:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFFBE40DB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFFBE40DB5;
	Tue, 13 May 2025 09:45:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 897CF153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F2A7812F8
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvmG3-j5ZN-m for <buildroot@buildroot.org>;
 Tue, 13 May 2025 09:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A143A812F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A143A812F5
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:45:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97EA28680D; Tue, 13 May 2025 09:45:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 11:36:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7ea1e658de6d8f951ef8c4e81724c131306db6b
X-Git-Newrev: 05fb4526f909aac533ed943977d4eeabd0b9b4ac
X-Patchwork-Hint: ignore
Message-Id: <20250513094537.97EA28680D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: bump version to 2025.87
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

commit: https://git.buildroot.net/buildroot/commit/?id=05fb4526f909aac533ed943977d4eeabd0b9b4ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://matt.ucc.asn.au/dropbear/CHANGES

Upstream disabled sha1 by default:
https://github.com/mkj/dropbear/commit/f3465a34eb4007ca3e45044ebdf863842e0346d5

Add the options to DROPBEAR_ENABLE_LEGACY_CRYPTO hook.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index cf2dd18d61..777910da15 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e  dropbear-2024.86.tar.bz2
+sha256  738b7f358547f0c64c3e1a56bbc5ef98d34d9ec6adf9ccdf01dc0bf2caa2bc8d  dropbear-2025.87.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e043893aa1..b0f5dc7afe 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2024.86
+DROPBEAR_VERSION = 2025.87
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
@@ -69,6 +69,9 @@ define DROPBEAR_ENABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DH_GROUP1 1'             >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DSS 1'                   >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_SHA1_HMAC 1'             >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_RSA_SHA1 1'              >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_DH_GROUP14_SHA1 1'       >> $(@D)/localoptions.h
 endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
