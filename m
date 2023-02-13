Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D20C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 14:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BDE817A9;
	Mon, 13 Feb 2023 14:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73BDE817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YvAD25L_GDVQ; Mon, 13 Feb 2023 14:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CBF81815;
	Mon, 13 Feb 2023 14:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CBF81815
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A711D1BF349
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 14:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EFC140443
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 14:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EFC140443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VM6CqMivkyO for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 14:16:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7415F400F2
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7415F400F2
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 14:16:43 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 29CC25C04BE;
 Mon, 13 Feb 2023 15:16:40 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 15:15:34 +0100
Message-Id: <12a7772dc9c30d31bc4dd7a4e15ca12425c14834.1676297701.git.stefan@agner.ch>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1676297800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=6h3Br5hkR0jUAXckjvIX5Cb/35fGc+wwd0jzWb66yDQ=;
 b=l8yGT8hChSd3hk4Oqdad1iu/+B3slp+SG9VrxXGqm0kaqCCvf9bm7M3WId5LKHYAEc5n9z
 YZ+9D+dLI+XJ0FdLMutE/o42l2BBotHdf650QaowyyN6SPAlBnMn5A97qfNZ5PMvCTXmZK
 GwFTHUL3RsWa0a0qm3GMHlhNu8oxnHc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=l8yGT8hC
Subject: [Buildroot] [PATCH] package/pkg-golang: disable version control
 information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Anisse Astier <anisse@astier.eu>, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default go tries to include version control (VCS) information in
binaries. Since Buildroot separates version control from the build
process it is sensible to disable this behavior.

This avoids build errors when building with a git repository higher
up in the tree owned by root. In this case the go build system
calls `git status --porcelain` which returns with an error:
fatal: detected dubious ownership in repository at '/build'

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/pkg-golang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index cdc67b32c0..da9c9a21ac 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -45,7 +45,8 @@ $(2)_BUILD_OPTS += \
 	-modcacherw \
 	-tags "$$($(2)_TAGS)" \
 	-trimpath \
-	-p $$(PARALLEL_JOBS)
+	-p $$(PARALLEL_JOBS) \
+	-buildvcs=false
 
 # Target packages need the Go compiler on the host at download time (for
 # vendoring), and at build and install time.
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
