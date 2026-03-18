Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01491103E19D
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 21:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0EED60DBC;
	Wed, 18 Mar 2026 21:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XS6YTFt9wD8; Wed, 18 Mar 2026 21:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEAEB60D9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773870158;
	bh=B6B9RakUNPP7OZ/w17M7q97a2vgKJMbCDtAdistdrYg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IOPp80Kc/iOmvDYuG3SsnnWDqwsVdA9TvH9iHU6pdracWqErySKNEu1NhEZPnSeHR
	 zKMeGi8uiUfnzKzg7XAgOBfu/YxYXpXeEnUDUCRezJUiANOfa0yxKwTXA4X98axOYz
	 io2C1+weAAtoMpgV8wiwN57T//cLRldQ3DcI90e3BnSPUoXZ0S2k3kVqr2veDnS3BJ
	 PddpWOcg4P8j+VpSpeqchloEw8OXFAKogm4pU5nTc2nYLYUTsGJjXVtpmv4WpD6imm
	 Lm51iJFFB2rnkmOuvibD9+16ObKyxwAW0iXYFgHmyW9fUv2HR7bGTL9DB5EbEYhSwL
	 5jEB8NgXFPXEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEAEB60D9D;
	Wed, 18 Mar 2026 21:42:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 846CD1AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A03840062
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYCm8wS1CMmC for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 21:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D6E4005E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69D6E4005E
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:42:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8271084AF3; Wed, 18 Mar 2026 21:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 22:39:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05c36d5d875713521f99b7bad48be316dcde2510
X-Git-Newrev: 763b9c289e36eedc0ac43791e9a367e01b16b038
X-Patchwork-Hint: ignore
Message-Id: <20260318214235.8271084AF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.7.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/763b9c289e36eedc0ac43791e9a367e01b16b038
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libexpat/libexpat/blob/R_2_7_5/expat/Changes

Fixes CVE-2026-32776, CVE-2026-32777 & CVE-2026-32778.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 7536e7cb1d..37a9c2ab9f 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_4
-sha256  9e9cabb457c1e09de91db2706d8365645792638eb3be1f94dbb2149301086ac0  expat-2.7.4.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_5
+sha256  1032dfef4ff17f70464827daa28369b20f6584d108bc36f17ab1676e1edd2f91  expat-2.7.5.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 215c34e9cf..68af751233 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.4
+EXPAT_VERSION = 2.7.5
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
