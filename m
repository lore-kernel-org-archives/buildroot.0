Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033A3D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD658236D;
	Thu, 11 Dec 2025 19:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ad5rJ2h8c8MT; Thu, 11 Dec 2025 19:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DDE0832B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481292;
	bh=wJ7dvK58DOgUnA9kjspDEFz+mAnq9EGW8i/ilSnx1tk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kV021JxKsbdU1YWvNY74vh53Rm+LZkrsa/UiiYIAKhwPbNaG6vtuGjzXLhporu14L
	 UuueWi4W+7SY9LVwKehvj67Ka1IyDQtfK98h9ApmDpsi3WR/p9c+NtxmjEH5B75tsB
	 MSHfUJ4nqxHKEpU8w0MwYHPgqH5lBxsavGZPNQFucTOwQRkBj18MnvngmbYOuZIOHo
	 iyS/v6xXF5DuTpNBKJ74RKguVGlw7raWZS/XC+lPY2oEHDR8LeGKEB5wqMfcJe6ihk
	 MTUJefqWHJS1Q+IjsQOX6nzueaeT3/EyY/rz8HPk8/kHqfnYeRuTgUQw5oOfU1SxCl
	 /JCXesvMHruqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DDE0832B3;
	Thu, 11 Dec 2025 19:28:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D06AE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5F08400C4
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pljGH36nITsX for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35ADC400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35ADC400F9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3546586B46; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:19 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 10fee753bb30d056143eb1856fc8a6db167cb7ef
X-Git-Newrev: 0161403b868aef1fd03ffb3924e66fa598c91b3e
X-Patchwork-Hint: ignore
Message-Id: <20251211192747.3546586B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/racehound: switch
 project site
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

commit: https://git.buildroot.net/buildroot/commit/?id=0161403b868aef1fd03ffb3924e66fa598c91b3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Previous repo is unavailable, switch to fork.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 655accbfeaeaf61816ff504cb01f795c4c37ceb0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/racehound/Config.in    | 2 +-
 package/racehound/racehound.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index 5b8bdc77bc..757743f79b 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_RACEHOUND
 	  - CONFIG_KALLSYMS_ALL
 	  - CONFIG_KPROBES
 
-	  https://github.com/winnukem/racehound
+	  https://github.com/kmrov/racehound
 
 comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index 6499e166d8..93ce5c8e57 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RACEHOUND_VERSION = f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c
-RACEHOUND_SITE = $(call github,winnukem,racehound,$(RACEHOUND_VERSION))
+RACEHOUND_SITE = $(call github,kmrov,racehound,$(RACEHOUND_VERSION))
 RACEHOUND_LICENSE = GPL-2.0
 RACEHOUND_LICENSE_FILES = LICENSE
 RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
