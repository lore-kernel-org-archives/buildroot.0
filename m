Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7091E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8780580EEE;
	Thu, 19 Feb 2026 17:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnaXPFbvGCVI; Thu, 19 Feb 2026 17:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B5EC8129D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521878;
	bh=RkJYT3lbF2rLFp1Fs0GC46T957XblE8MA/RPIV2PxPE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pu8n8xvm6AXjVvnzRvtkYsDwYOYnjHc0DBuw1UGGAVQPpjLw8OCK4H0/PzPdzw3OH
	 YLtyf1lYxTpgSrHCLBHSRlcPN6tgiV43FYvr70iG0e5pvqylNMNIV4ya/bvYPge/M2
	 j5Xeg8JRc6EFpNpqJHtdnFSUeYdgxFZK7+S6IfrcgOZsbIYVDOxQ8YBpG+urMgu++y
	 r4WANCtLipPCvKJC+GK9N1wuknLFuQaOkK7YmY5qr/g6M5Ig8Zhcsklbxq+rbx404f
	 HkeroYMmWTodPlPcpZ7ohQ/uAUw6RnCUcSQ8T9WIgZmhai5YPrnQb/rYbdMzF0l2sX
	 0WnhT0MN7ZIrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B5EC8129D;
	Thu, 19 Feb 2026 17:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25A2B1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DC8B40CF4
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toOr_wPqV72X for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 227D740CF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 227D740CF8
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2001A86FA5; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:27:14 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f2a65e7569b60d1a0e0e8e303126b151dd082f4a
X-Git-Newrev: 98e4df25fdbdf4676833a186dc51c91d6608d1e3
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.2001A86FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dash: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98e4df25fdbdf4676833a186dc51c91d6608d1e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The CPE `dash:dash` is valid and has a single CVE associated to it. See
[1] & [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2009-0854
[2] https://security-tracker.debian.org/tracker/source-package/dash

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 87e2a72e13b870530cdeb7ec9f21036aa994d43c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dash/dash.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index f030e4ec91..0993cb99a6 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -11,6 +11,8 @@ DASH_LICENSE_FILES = COPYING
 # We're patching configure.ac
 DASH_AUTORECONF = YES
 
+DASH_CPE_ID_VENDOR = dash
+
 # dash does not build in parallel
 DASH_MAKE = $(MAKE1)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
