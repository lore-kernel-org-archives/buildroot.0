Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C170105F7B0
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E56E60F77;
	Sat, 14 Mar 2026 07:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXyfUY3Wrqo7; Sat, 14 Mar 2026 07:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D13760F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475122;
	bh=1fvnHjXlqFkaOCybLCDanFfuA3ratXFQFGdjIyKzIvI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eqA5LNQkLo49gg0XchAHCjjf4s6j7v9uXnu9CtfHk8Z9mpnFXU3gPJTCiMOeWkoI9
	 GF7ehL9GpK8Ct3/BziFPWeYotFXCrKg0rUHjxklrWcHIGFT8Lh1DTCdWu+maa2BGVW
	 0TCAbiB3hoAdE/xNAwanmSActGmmj3A5mh7NOsK0ydTXUOlYHRXVX02q8yeAhtuAIa
	 jqHPa+zno1AfxIrEAm7T7xttc8Po4e8eb+GD6t0YLov2Vspr/qFnOp03h1SRufzfzp
	 5A3JxIXdb2Sl77yt9ArzmrKHKEmazcadITX6vcFgPQM2BKZRYMdnf0a1xxINkhZHGg
	 3LCE1Wn/xFGhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D13760F1C;
	Sat, 14 Mar 2026 07:58:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D950201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 740EE822C9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMo8gn7ytxnm for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA5E822C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBA5E822C0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E37A285EE5; Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:06:42 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b6c5853350886c7c9cd157fe9f60d7ee5cccd0a6
X-Git-Newrev: 03c7e219800d39ed544b7b96fd1f68724906ada9
X-Patchwork-Hint: ignore
Message-Id: <20260314075838.E37A285EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing/infra:
 update artifacts URL to https and .org domain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03c7e219800d39ed544b7b96fd1f68724906ada9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The artifacts URL has been moved to https and domain to .org to
improve security and avoid redirection issues. This ensures that
downloads of kernels and rootfs images during runtime tests are
encrypted and verified.

The change has been tested by running a runtime test, confirming the
correct download and renaming of artifacts from the new URL:

    Downloading to .../tmpyotq8uor
    Renaming from .../tmpyotq8uor to .../kernel-versatile-5.10.202

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8313d8a2faf8423cacef7acc88bc385201beb05d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/infra/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index be61d8cc4f..98215e02ab 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -6,7 +6,7 @@ import subprocess
 from urllib.request import urlopen
 from urllib.error import HTTPError, URLError
 
-ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
+ARTIFACTS_URL = "https://autobuild.buildroot.org/artefacts/"
 BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
