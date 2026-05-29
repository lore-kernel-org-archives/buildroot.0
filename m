Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE9FCD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1BE984176;
	Fri, 29 May 2026 08:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfsi1AUX7EH1; Fri, 29 May 2026 08:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE81984189
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043314;
	bh=6vBq233O2l8gbz5INs0bDgJ30oeulVXSg+Q7jaugetU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TX2WfEQdBsA5gXWQumCcTPWoZV4j/VLzGcD9qhzZeDYhhIkpPfPRqXGkTTOYO9yyP
	 wLpym3H3hFL4YRGm2xTj7TBl2YdWBaV7aUhyidRtbBhXfZnNyuFO5onL1ICPcB0/WH
	 o2mSSvqAPSfCMo6oh1/fywnXMDxe5ZdaeoMYDhakHlbJOwWofJAoBzJGVu14b5kGV7
	 7rcFcEjP/u89Lwiw9tss9joTATMuX1iUg40T/AzskLWHK2rHNNlMWdWFFgC1iIJPYz
	 eSgUNy/d/PKlLFdOTG4q2UMd/qbZj503X8fEMLqv96F9o0HAonfiKYjU+1UGT2RAEN
	 yWAMCeBl4E3pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE81984189;
	Fri, 29 May 2026 08:28:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD7B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BCE76135E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GGGumabgO04 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E52D56145C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E52D56145C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8235E87355; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:57 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cc6ace8158a7f2635f5d2bd6243387aa41601384
X-Git-Newrev: 979aa00de416bea58979c0a92d0c3ff218f6e1ff
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.8235E87355@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/haveged: security
 bump version to 1.9.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/979aa00de416bea58979c0a92d0c3ff218f6e1ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/jirka-h/haveged/blob/v1.9.21/ChangeLog

Fixes CVE-2026-41054: https://seclists.org/oss-sec/2026/q2/575
"The bug was added in 1.9.3."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c9e36ce80593e3d7e0bd46ffcfcd1b95499e05a8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 066e21c132..0aee4d5e0c 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acbb05776668657012273be9bb3310e3140b79959aa4538e4cca8d30d40c0b8f  haveged-1.9.19.tar.gz
+sha256  14e711975401ad03fdb29d2dcc20a501596ee752d92affdf43dcb3ad61cf20ff  haveged-1.9.21.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 0e377d36ce..e22712f016 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.19
+HAVEGED_VERSION = 1.9.21
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
