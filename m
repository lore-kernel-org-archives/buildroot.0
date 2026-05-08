Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE584CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 19:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728BE612C1;
	Fri,  8 May 2026 19:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvAYSHES7e5U; Fri,  8 May 2026 19:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 710B461B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778268962;
	bh=qk6g24U39V3YNHPMBdFNyjkamZkNoBykYCDxAnRSp9Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sH2yeLgQlgpLkompkVroDsbusrOuBOpNoJDGb1056IATvjGLvYqjongcE9Op13MD3
	 HLpPO6igEwUBoDPrSSM2mroGsTBaFFzZlFEC4qK0MEV5kbNSd4C3MR6hGttg8yqbRT
	 j0LZBy2Ab1kPehnjV39NUvV7ik+PREdKG92fqTdm99CTpkaKSfXSjsQOlImyPUnZQ6
	 GFfNHr+092VNaBG5L7XVyNr84jpdOjrIFyv+6+HtRuUlVEaDve9oRivl6ZYP+JJnad
	 Q8euT+fg0txSt6T6/HpoRkutWMlmrCVYiAmLsTg+kbTsmlcOGbTYNUkBquloL7O3sI
	 4Xz9AMLAUFKdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710B461B3E;
	Fri,  8 May 2026 19:36:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C19028D
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F13C84882
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwxuo7SwMWKZ for <buildroot@buildroot.org>;
 Fri,  8 May 2026 19:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3425A84880
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3425A84880
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:36:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF9CB85776; Fri,  8 May 2026 19:35:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 21:32:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9b88d2d6a569a05d8eb0f4f7fd73c4eaa5983ed
X-Git-Newrev: 3776bc77873e6ac96273ef9d933054b141b219e6
X-Patchwork-Hint: ignore
Message-Id: <20260508193557.BF9CB85776@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cutekeyboard: bump version to 1.6.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3776bc77873e6ac96273ef9d933054b141b219e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Releae notes: https://github.com/amarula/cutekeyboard/releases/tag/v1.6.0

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 5800865230..acd2017056 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ac0521f89ee9b7a2793150f09a77693b797301d12b8a65fe214387d8e8c0845  cutekeyboard-1.5.0.tar.gz
+sha256  5e00ab346038e41e11662016b56c4e95fa08e7efeb7ca61aeab5b863a0bb7300  cutekeyboard-1.6.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 9a29f5df02..12a6573d52 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = 1.5.0
+CUTEKEYBOARD_VERSION = 1.6.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
