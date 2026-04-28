Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84F9FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 196F983DAC;
	Tue, 28 Apr 2026 18:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVvPcDLINIAx; Tue, 28 Apr 2026 18:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D47483DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401281;
	bh=soONSWU/r4A4HVRW5hjvjXZtus4sGt17Y0X7cLKyoIc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qgBzyVQfyNiyOt0gqdPbvC6yEh87PW/L8QRzuHdU0uUcH/aMlPpftWCChF9PdxjFh
	 cu9NtNo5JJZuyA3xN2UHIwiuREL9GxROOV+oTEa3WQWR8ysQcqvcGTOrkCcFpmJKmi
	 4FOpVOIPEVusXdt5w/fCSBeZw4YBBTTE2lxXC6shQpv4Y6uoMDqFAy2Q5kU3NYtBfk
	 Vu0DsEAL3OG99pA2nyPrcjgznn8G88m53SxCnDYXmddf+Nc1NAuMQbeKhmNzlzR3ny
	 K1agWO28sPdLjizQaQCyv2rNg9sgikOlAiokAm72+FlJBZK47H/Tl8zoRfKOALaeUX
	 WX3YceGuA5Y4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D47483DA6;
	Tue, 28 Apr 2026 18:34:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8151231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE4D741E17
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jl23Sa9EqwWW for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB3A4142B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCB3A4142B
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:34:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85EBF8390D; Tue, 28 Apr 2026 18:34:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:33:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d6bc9b2af6ac992810359801bcd0494f5722b03
X-Git-Newrev: 1be89eb5939d041f912eaa7861aee9a1ce268c6e
X-Patchwork-Hint: ignore
Message-Id: <20260428183438.85EBF8390D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: bump
 version to 22.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1be89eb5939d041f912eaa7861aee9a1ce268c6e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v22.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 5b7f13a570..1f2886ec6c 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  a5d476404ab88ac0d148211da50428178c89caef8af8042a3ca8e71e58ed9427  spirv-llvm-translator-22.1.0.tar.gz
+sha256  83e7007b8b9b5536b30991661738a98e9cd607d4a203e9342b628aaea5ea32d7  spirv-llvm-translator-22.1.1.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 1ff8dc3401..0f5fbb814e 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.0
+SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.1
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
