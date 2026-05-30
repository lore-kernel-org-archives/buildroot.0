Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F50CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB34D42F27;
	Sat, 30 May 2026 16:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwq3VNtKZWJ2; Sat, 30 May 2026 16:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B5D842F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780158311;
	bh=MEGydx9+I3c+YGhzWTwA+t6wuu0A1yQFTcA409yQSgE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AJ+P26N5KYfMBRQBWBmeTvAm0B9YSRw3eEGycZbFV7HuzADXYrrQvWihBvm+kAA4W
	 jpaoXgrTt8686t6swu74eQKUPjjwC1wRfJb7qypS27PIzBz9dPa/jGFG6XQgZXiWNo
	 oaqO9V4BSP4zKVnSp/AI13nASVRLgu2/rpSmaer1TM5AUaeXobo6fbH8xcbYXd56QG
	 eImbD7x4/yk5gcT3r9LspQdR8H2+CvvExNPFR8w+rzJiz4waw/UmGfjFklvCV6iOwp
	 TrdOAG1foXK0rJx7Zu6Uhsn9l6mBqlh1uqyQfBMTBDBLI/lFLztSUnQEN0EAgyP4JW
	 ti9t9Y9rHP09w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B5D842F2B;
	Sat, 30 May 2026 16:25:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00071F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA4F16F5BC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCXE1dqhJAtz for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AEC16F579
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AEC16F579
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E605587522; Sat, 30 May 2026 16:24:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 17:44:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2bd5b0a51e52c5cf008dbacfaab01acbcc46633
X-Git-Newrev: 7716db8a1254b15f06f4c17e27faa89d3d30a2d6
X-Patchwork-Hint: ignore
Message-Id: <20260530162455.E605587522@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftrace: remove configure option
 INSTALL_TOOL_DOCS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7716db8a1254b15f06f4c17e27faa89d3d30a2d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 in 2026.02-rc1
bumped the package to 0.24.2 but forgot to remove the configure option
INSTALL_TOOL_DOCS which was removed upstream in version 0.24.0:
https://github.com/bpftrace/bpftrace/commit/579e0e9dfe613502d14b6091ed35b0dee7e90f22

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/bpftrace/bpftrace.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 94f7c6b4f9..35c8dec29c 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -28,7 +28,6 @@ endif
 BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
-	-DENABLE_MAN:BOOL=OFF \
-	-DINSTALL_TOOL_DOCS:BOOL=OFF
+	-DENABLE_MAN:BOOL=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
