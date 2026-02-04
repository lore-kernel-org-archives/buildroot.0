Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878FFE95363
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599A1605B0;
	Wed,  4 Feb 2026 09:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtOzOOttzU_f; Wed,  4 Feb 2026 09:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7381E607DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198440;
	bh=8bSzDGZUI9o5b+FgOXwoiEVUTR7w6qLcFmq8SA1yBv4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NhKMHcRCz2HkOA0SnIHoslLvo0C229/pjx+Uz9yCWUNRfUnpWpIdzv7g29MeiF9QW
	 A/jmPBDMBPVTA0/iAcrU9ap7Y9skd0vkZ92J5XDBAJejmolDCQC/l9JxQQSwzEnyKm
	 4FDSXIXEnB5W1RubRELoqPbrL8DZjs/mOsucGKB9G1wUgrzzazaCzS1U6I8f4EztZQ
	 FFu8DEtEwMN2IkH9ONGXEcBuLJLZL9DantNEDkr1boQ4ZZzgZBJz8Z+KoSBTQSV/Tr
	 3jDV+FoSSz7uH+E05UzOxAvoK8jmUEsfPdN9QivtmhJZOqFHHaEYcs1tHvaYfBny/f
	 Iv19Ufx13VfmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7381E607DF;
	Wed,  4 Feb 2026 09:47:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E90F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C657540B65
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uojmFhGpqjpT for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E572340730
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E572340730
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:47:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2A9D8681C; Wed,  4 Feb 2026 09:47:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 10:47:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63877f9e86e2b79218b3f08c1ec4613cfe354744
X-Git-Newrev: 2b31a28dce605b0088e9b72fb38616cb941661be
X-Patchwork-Hint: ignore
Message-Id: <20260204094717.D2A9D8681C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openobex: fix line endings in patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b31a28dce605b0088e9b72fb38616cb941661be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 105e4618c5f2745086baadd5c04dfe189484a604 added a patch to fix
CMake 4 compatibility, but due to line endings issues the patch
doesn't apply properly. This commit fixes the patch so that it does
apply as it should.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openobex/0001-Fix-FTBFS-with-CMake-4.patch | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch b/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch
index 2b675e843f..9ceee93474 100644
--- a/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch
+++ b/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch
@@ -19,11 +19,11 @@ index 813f900..b237f93 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -1,4 +1,4 @@
--cmake_minimum_required ( VERSION 3.1 FATAL_ERROR )
-+cmake_minimum_required ( VERSION 3.5 FATAL_ERROR )
- 
- project ( openobex
-   LANGUAGES C
+-cmake_minimum_required ( VERSION 3.1 FATAL_ERROR )
++cmake_minimum_required ( VERSION 3.5 FATAL_ERROR )
+ 
+ project ( openobex
+   LANGUAGES C
 -- 
 2.47.3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
