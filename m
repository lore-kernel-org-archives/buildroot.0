Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF10EE01F6
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9685A405C9;
	Tue, 30 Dec 2025 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63lI7i-EtBi0; Tue, 30 Dec 2025 21:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF61403B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767129391;
	bh=0dCMNgzKyX3YOpdBO6GtWjV5yJuUcKJlrq4ivm3+xlQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b4thgG4YNbR0/q5JuGawc5auHx6AtZ5NUeK/5IWyewzZR9muh+ecUQaItvSINd2gi
	 U+MJXqlLxIvt1zsT/5UD3DfnLoECl2v4gQbVkMfSX2FpAxXic98VQj/VLRSbtYGBXX
	 H9X+5V24AXoOURCuSt/eCPpgs4kDzsy5WZPuQV/SbaEXLJLuhLrF180hwfiHAG18GU
	 gIML/WdIEwyJmiWwIFPN06mYKtHn+v5d9vQCO8oPwVyY4GKM4F4pMbsLkxrzM41QDq
	 ef1+r4X965rmUxWB3RnjYiCcoB1twCBZP5C5g4e1Q18X1eTSkeFiRsTPSRdcxzD6cj
	 uniztbn+kEMsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF61403B6;
	Tue, 30 Dec 2025 21:16:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C676C177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B90DA80E25
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_CW4o598QZ3 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045B480E1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 045B480E1B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:16:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB6D47F8F8; Tue, 30 Dec 2025 21:16:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 22:10:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3e9dc303e0fb883c42954f9eaf3fe70001bd714
X-Git-Newrev: 244f01ae45103dc8fbdbd66617baa9658a720b30
X-Patchwork-Hint: ignore
Message-Id: <20251230211629.DB6D47F8F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-mythtv: bump version to
 21.2.3-Omega
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

commit: https://git.buildroot.net/buildroot/commit/?id=244f01ae45103dc8fbdbd66617baa9658a720b30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 7bc93a0345..dcb363a095 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ee1e2730a0491eb3b4b0b6245f9f7f26269fba215d083c84ba2682280ae2026d  kodi-pvr-mythtv-21.2.2-Omega.tar.gz
+sha256  8cec35fe171a388fa9eab4366d5e1f6fcca869a995bc3ea4e3566a38a2db75c4  kodi-pvr-mythtv-21.2.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 9f34d07f1d..d4c70013cc 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.2.2-Omega
+KODI_PVR_MYTHTV_VERSION = 21.2.3-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
