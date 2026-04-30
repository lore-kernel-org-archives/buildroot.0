Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5878BCD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D598470B;
	Mon,  4 May 2026 14:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3nMy6L1j-Gs; Mon,  4 May 2026 14:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EF0984644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906142;
	bh=AFEMn0m8ChqqSS3Sgcmgc9aQ89DQcSM4s/zuf0ETX40=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UHksET4VubTC6AAiy5s/EkAuKxmUuisu+oVpL7+iEi05isQLLCcZEnr/LpjGQR7Tn
	 t4DlBYVG9yQ01ZIPyPwWpK+B2bD6XV7qoARdKCKtwGyL2697K595tOWyKjbg3HcfqX
	 SbqgqAhxWGS6mMOywxnouFk2XOf3d1YThO2ZOQugk7TCgtgeNshWWl0dKW/fUUwa4C
	 DfqSIAn8npF6P8OmzPbOboNsB5l4OCmXFkrhEXaHQrTPVMfuq4tWCWY+BoNb+vIY11
	 NFG7+KB/uUVKFYQju2/vhHTw+aOrYIal2lMlXPlV+zVHGE4Bw4SdjLJe2LDuBbYZXh
	 O+2s/LFV9fTwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EF0984644;
	Mon,  4 May 2026 14:49:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F47230A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEFA661531
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0QlCs9PYVa0 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CB5F615C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CB5F615C4
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E518784364; Mon,  4 May 2026 14:48:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:10:18 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 08cd573f0c3ed4a0a991fde2dfb5b3dde75e55a7
X-Git-Newrev: 0a6eb135425d68559ded1d7a6cc9b7ea34179d89
X-Patchwork-Hint: ignore
Message-Id: <20260504144845.E518784364@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/expat: security
 bump version to 2.8.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a6eb135425d68559ded1d7a6cc9b7ea34179d89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/libexpat/libexpat/blob/R_2_8_0/expat/Changes

Fixes CVE-2026-41080.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c3dfd775b0084e3fb07fa52c75c15577407065e4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 37a9c2ab9f..a0f8b514a8 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_5
-sha256  1032dfef4ff17f70464827daa28369b20f6584d108bc36f17ab1676e1edd2f91  expat-2.7.5.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_0
+sha256  a37bfae0aa9775bd8521ebd85dc456d486f0ff31138f6c91fd902ea732624542  expat-2.8.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 68af751233..07c209543e 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.5
+EXPAT_VERSION = 2.8.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
