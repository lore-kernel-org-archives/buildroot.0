Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C502DCD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B1E61BD9;
	Wed,  3 Jun 2026 21:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9z9ucseBj1w; Wed,  3 Jun 2026 21:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E834E61BCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780523716;
	bh=Ksa6DuZLmky8HvumnozhBG4LhIBgFuT8tqOHIml3FKU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nSkREVaM0AaRTKDsRPeIHhmBrCSnba7Roa/dP/wczbrkfaMJ0rKSyfz++WxoNFAh9
	 KrMtSt+hugTaUOMYK6OI3feGv14Q2+s2RiKHA8Xxyu8UqEd+bJ+a/5F2xm9MxLlPt/
	 I+Az+/JDA84NzV7xC5PWLPlnKV6HHczdtKdIo1KOJWeoawtvMWfwWOA7U4vBTDnlRu
	 3LxfmO+ccnYjUl508/enM0s6gt7X0VKbTV8DbObZ4ri2m7cqP2d9kor2v6fK+Q3bB9
	 d6w7nsn4HrpH8qFIAc5LZdOH0AaClmeV4eD9PgsKrqviQ97hnr3rT3vATgb+MGXmQG
	 /JwbDGGdHvDXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E834E61BCD;
	Wed,  3 Jun 2026 21:55:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75DA9192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5995C423A8
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i83B4pLMYuYO for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A25E24239A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A25E24239A
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:55:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 936C8879C9; Wed,  3 Jun 2026 21:54:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 23:03:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 64f501c412a8633c79ac1d14851c8d40f2d925b3
X-Git-Newrev: 32351f979822a0b3a45b82c2d82bdb2328b02f5a
X-Patchwork-Hint: ignore
Message-Id: <20260603215457.936C8879C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/spirv-llvm-translator:
 bump version to 22.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32351f979822a0b3a45b82c2d82bdb2328b02f5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v22.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 59edb3f70d..c511c79785 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  b37196b1a1a60282a24cf937ab7d6807d7d54dc718f2a37a78e211be26df57ac  spirv-llvm-translator-22.1.2.tar.gz
+sha256  8d3d5c31c1ff355dbbf87046f1b94cd1ab5390439a817679ec71484df74cac18  spirv-llvm-translator-22.1.3.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 2d8170fc80..98e8f45037 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.2
+SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.3
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
