Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F183DC44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B212360708;
	Mon, 20 Jul 2026 19:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xldJulvcoCI8; Mon, 20 Jul 2026 19:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD8B060711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784576275;
	bh=/H9ba0NukXdXPK2Ku6H/yHLeU0153W8vbtKLSkHWYRQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SjWQpSPO/x0eK+L/Jan4X48Yf4QRBWTbgCYeUVuhTkPPS3oh5nAtdLe4AEBVzBsPU
	 nlpqitUjS89QzwDquGU70oXXy2yryfeC59JOuqD0WLq9XVE1tFnw3qZ2HLiCdnQRNh
	 5M7hkzkGsgnucLbt4Bp4cac6ejICGT8F8WZn7LoUPd4wcsgTYsUn09PReO2fMKSZp+
	 umxiUpwuJdhIjUXghhvUk4lLvX7SmBVDVV19SIZ6Ihn50eU9Rxr380yFTdTIpCydUW
	 tbVJAY4T4fMRAleOLUUOD6woE8W2ulcQ9iMEeSJyUEMZTeELxojq0Ac3j+sKJxTYBh
	 B9ANSeQKC9Rmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD8B060711;
	Mon, 20 Jul 2026 19:37:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8405786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5A6F60711
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXM-GAPRxVit for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74BC60708
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E74BC60708
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:37:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1ED0989026; Mon, 20 Jul 2026 19:37:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 21:25:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa56f063fd5a4079b7360f17437ed75435d5688f
X-Git-Newrev: 53c990eb4cf5bd0424307cb50f63c752961195d2
X-Patchwork-Hint: ignore
Message-Id: <20260720193715.1ED0989026@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: bump to version 0.5.13.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53c990eb4cf5bd0424307cb50f63c752961195d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=037bbdfd330017c368caf6242f977974123239b5

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 3fcdb1a5da..8884b55079 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.4.tar.gz.sha512sum
-sha512  383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675  dash-0.5.13.4.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.5.tar.gz.sha512sum
+sha512  ae326c110713a9da6b7afb977ca6fd931793b03011f0a7aa2c42e873f116ed09448deea9ef5ca4515fe3afe24e210e0aaa580f7de89934edda9cf31ee44c94dd  dash-0.5.13.5.tar.gz
 # Locally calculated
-sha256  d10dfd41cda59165560db39ca915c2c4a7636fff04281d8d2df77ad92c753e2b  dash-0.5.13.4.tar.gz
+sha256  40090101a2a491f13e901d3d48e90414f26634628b9bfff35ff540363c227a7d  dash-0.5.13.5.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 2b33433813..c2e168c44d 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.4
+DASH_VERSION = 0.5.13.5
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
