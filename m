Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4083D637B2
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 11:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB1740AA5;
	Sat, 20 Dec 2025 11:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSWmPiACNCu7; Sat, 20 Dec 2025 11:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80E8040A66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766229188;
	bh=T73hf48gcQDAVLZvjtMFTzrcFVMMfK82Tp2SD1ziuMA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OeprDtFXB5y7vW6yqu8ge1u8by4et1e2e6CUiqe7xRlrLNgXhf3WWj6K2mSOdTeTE
	 mWmhFYB3H5sVTC1CrqjkLbSUx4dXVBPT/zPbQSKfT5peiBBJraxPbt0CSW94EBh8/M
	 yLr6z7nWhxjrzkZqu/hFWhmJF4iuWZZMX75No7nJTPibLPo9tCcxyR/tloP0knaJr2
	 84c57/8XQyRlSThKNtJufVuWCFOhzoyBDeIPA7gg6QuLr/d71Uas3MYTJX7G4d9oYJ
	 8KnJd5h0sJGKS6dLv9gU9L+r8O55iTKwS2uzNrBLMzBd52RO0o1l/HLHDwPD4wNUsx
	 oRT1MVeN2QLew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80E8040A66;
	Sat, 20 Dec 2025 11:13:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A44D21A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95C3282803
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7ka3Ua0VlCc for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 11:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 747E882751
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 747E882751
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:13:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 600F18619D; Sat, 20 Dec 2025 11:13:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 12:04:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c18ebc0019b279da3793d5c5531bb8a76ff4c96
X-Git-Newrev: 3c7cbf97d707e22d07c27894dc8ab3004ad86564
X-Patchwork-Hint: ignore
Message-Id: <20251220111305.600F18619D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linenoise: security bump to
 version e26268de5e
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c7cbf97d707e22d07c27894dc8ab3004ad86564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2025-9810: TOCTOU in linenoiseHistorySave
https://www.cve.org/CVERecord?id=CVE-2025-9810

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linenoise/linenoise.hash | 2 +-
 package/linenoise/linenoise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
index 9a1436eb8b..3f82ba0ff9 100644
--- a/package/linenoise/linenoise.hash
+++ b/package/linenoise/linenoise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1086f82fbf30b0618b1953b05d33db62c68fc7ce49391ce1374192f776fde72d  linenoise-97d2850af13c339369093b78abe5265845d78220.tar.gz
+sha256  d5e702e7e04f0fcd09393bd4c010ce2bb19b4d137e22f2dd6064e848f4a6b5b2  linenoise-e26268de5e56bfaad773786471844578fe9f7f4b.tar.gz
 sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index fd2c4c7035..05f8aa4845 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 97d2850af13c339369093b78abe5265845d78220
+LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
