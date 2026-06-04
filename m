Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BE5CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D393807B6;
	Fri,  5 Jun 2026 12:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPN9BQWBqpny; Fri,  5 Jun 2026 12:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C99880A87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663260;
	bh=cGNtEDCm26LjKg9GiaMDeDLlY9WzTqKiBnnz/j80aG8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AIBMvaM1FcsN9fPI0JO9vNnO+7wOk+LsbiW19Mqox291mzNAD0TZtxUuq2hgkPdew
	 DAEqqjNHVcrLl7S25FAmhVosYnVBxj591OtwUi0BFqcyIwxayngYb4TeHc8SeBdej0
	 xutP9UimjLsSGkqKLjVxllqjprJfXg8aoD0/85QZANuWi+ofkS+Hrx3xQxQkLkaSHS
	 lufw/JLexpAb8II6kClhGp+vFev8EYj2QFYqV/KZfZyxtfTBSUn0hlLMjDiYloVx1a
	 0KCfntpKBuOdECFygVr9G1Sd7AmDrkeSkEma1rTCVnqiBzJhKXqQZViQAAHEHDtExC
	 dJ9IivGhfxEJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C99880A87;
	Fri,  5 Jun 2026 12:41:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 134DB3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F9BF410E6
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQ-E9t-_9xeP for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6194D41070
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6194D41070
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BC3687B03; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:08:30 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 84c94299d0c3f46a251d45fc00c1fc8d4c2d6a6a
X-Git-Newrev: c46e011a52b513cb78f6578b72c0da8e2590655a
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.8BC3687B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/bpftrace: remove
 configure option INSTALL_TOOL_DOCS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c46e011a52b513cb78f6578b72c0da8e2590655a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 in 2026.02-rc1
bumped the package to 0.24.2 but forgot to remove the configure option
INSTALL_TOOL_DOCS which was removed upstream in version 0.24.0:
https://github.com/bpftrace/bpftrace/commit/579e0e9dfe613502d14b6091ed35b0dee7e90f22

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 7716db8a1254b15f06f4c17e27faa89d3d30a2d6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
