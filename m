Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F3CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5480385E9D;
	Tue,  9 Jun 2026 13:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xv31bweKJUq4; Tue,  9 Jun 2026 13:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A19785E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010355;
	bh=dMg6ACAqQa3SuIqSYPg1FZ2lmyaSIGRX1gcYItNJm4c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ayCZ69jDeJG4iVUg6eWeLEnLXDRaQn30IekxQzCpKgYkv40O0ZPkRmB9fO2pn/A9T
	 39R1jPIC4au8At1YI4Y/+UO3+zR12Yds2dzhM6uTnBZw3NcIPak3aLmq2OyGfj/FEe
	 RsdumyhZv/8G9ykZ2jR6EL5QnHti0HN0t9cab5NZ0930sGPRC7yDbKz4r3WZArTiRr
	 5aGczKhbhc5PmUAvKrKYqjvBUzF6qsI9YlA+ZiR1eAcrmKzCnoH/FA4X8AEgWh5OC9
	 0KBZDgUD36olhjpL4qbBqeRep9q5wbbuhQZe+n71heP48vGyN94DftUqTNzXhf7V5s
	 lXlBWN7xa9kIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A19785E8D;
	Tue,  9 Jun 2026 13:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F7E8190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B978D45F21
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2Hixex5jaGt for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8BCD4645A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8BCD4645A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FD5287E87; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:50:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7255e1ef0cc29a9449a957231a06ab83161d7b94
X-Git-Newrev: f660c7bae3e0004958acb3a2518fb409c6315a75
X-Patchwork-Hint: ignore
Message-Id: <20260609130126.1FD5287E87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: bump version to 0.21.02
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f660c7bae3e0004958acb3a2518fb409c6315a75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.02
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.01

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 81123b3587..706fed135a 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1339cbc6ccbff7e2ee2177bf0fd67e7b94e8ff7b07fe89bcfaec0280d800cf34  stress-ng-0.21.00.tar.gz
+sha256  71502d31f77987c3bda6931d47b44d7b03d8ac689e8154bbda676cf9d42e2b4e  stress-ng-0.21.02.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 4181c5ed1a..59cd249291 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.21.00
+STRESS_NG_VERSION = 0.21.02
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
