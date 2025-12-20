Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F8DE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13E281E82;
	Sat, 20 Dec 2025 21:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4hrT7rILkpB; Sat, 20 Dec 2025 21:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0329181E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266759;
	bh=PSLYWt+PvHetVa8Raa6cJ7Qi/jGijxq2Q//KpKRB+Tg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dExZuQFDvE0fDS0ZWoE3YnInjXs7VlVpctTVOGvV3Q4kKf72TiQKlES9UcfxoxP8B
	 U4lzy3sdNhHjhMVRHtdkEhiJImBairK3UkOD8BTJtrJfQLRjlAjNWfy72KLsS+HE5v
	 WI4VH/0YHONhCAO54AYi789rlMXGEhrDwx+7D8Lf8cPrye8HzufyMhw9AQe39bgoDO
	 mkFTNNGmBJ9oML84Tk2SHgOVnH8lS2dzALjYyWyqUD0MTZ2SpgqbTREVD/BxYitMMU
	 b1HMp1kl3c6+6OuJvPM1I3vcZQC8vOqO+YGAEb6nCcLT/21sAXPN0A9qCms/LUKvrs
	 lQYqkXy+J1Mvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0329181E3D;
	Sat, 20 Dec 2025 21:39:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D5123D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0373C81E3D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tV61vuEgYoyI for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E0581E0A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E0581E0A
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3215587582; Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 21:32:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d40462ac54d3d9b9454ae5f76dfe93ba295d787c
X-Git-Newrev: 9f2547021d1370849f053fa1b08097b76021f7a2
X-Patchwork-Hint: ignore
Message-Id: <20251220213917.3215587582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: bump
 version to 21.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f2547021d1370849f053fa1b08097b76021f7a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.3

Switched version number format according to 'git describe'result:

$ git describe --tags --match 'v21*' --abbrev=40 llvm_release_210
v21.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 0263689519..85ae98337c 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8db031b9e23c1dd47154751cf74f8a3c5d5e8d92896789c6a7eb956946287677  spirv-llvm-translator-v21.1.2-5-g3c0231e56b7a9ecc4875e8696ea53d54d6776f85.tar.gz
+sha256  43080fd5122c71cd93a3d174d59b9fc95ff8aeb1847d50f394088112f6b2a217  spirv-llvm-translator-21.1.3.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 28bdb4d26f..0fb79e04d4 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-# Generate version string using:
-#   git describe --tags --match 'v21*' --abbrev=40 origin/llvm_release_210
-SPIRV_LLVM_TRANSLATOR_VERSION = v21.1.2-5-g3c0231e56b7a9ecc4875e8696ea53d54d6776f85
-SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
+SPIRV_LLVM_TRANSLATOR_VERSION = 21.1.3
+SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
 HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
