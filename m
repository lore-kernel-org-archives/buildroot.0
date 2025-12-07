Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE22D3ABEF
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA849407C6;
	Sun,  7 Dec 2025 21:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqn2Tg999IN5; Sun,  7 Dec 2025 21:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75D440802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765142881;
	bh=T1cGm7Anl9GPn44tW6Bq/7NYI2Ruw0UDbBZDEfJOLbI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kHdVn4wvjh4e2IV+5TcdPLDg8XZzraCZ8Dsg6bVDygDq5p0Cz4Lgvagk1GaCB0IMT
	 P7D5BCDdjKfT63sJxx90LtWylgMZCQB0ra7qmpwfrTun0YWCcgSgPecooVtzR13HOl
	 /KydMsP23FZ7ufNJ7X9WK8JshNaCCd8vhSuiFura2uLEesDV/awfx70W4AuHHyU4N6
	 oZxIsuHut1Ugs9NCkN7KLJGuQGPeaBgZySuvlwQaRYBPhAEoGYoGK7UqF4xKMq0nOR
	 6879RodUe+9gDS82KlI1tLG4IsTX6irLc9et6mVbkwnQiwrMsQSs41eoioGd5FNJv4
	 UAB+fvUxB0DuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75D440802;
	Sun,  7 Dec 2025 21:28:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 372EC2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5961140548
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPjdjzjHvMpN for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C808840789
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C808840789
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B76E28689E; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 21:48:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 899703cb37a5e844118a83bff41a43b9c86de1f8
X-Git-Newrev: 655accbfeaeaf61816ff504cb01f795c4c37ceb0
X-Patchwork-Hint: ignore
Message-Id: <20251207212751.B76E28689E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/racehound: switch project site
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

commit: https://git.buildroot.net/buildroot/commit/?id=655accbfeaeaf61816ff504cb01f795c4c37ceb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous repo is unavailable, switch to fork.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
