Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73986C43327
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 06:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C2F40EB7;
	Thu,  2 Jul 2026 06:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWpmu9HWVdzh; Thu,  2 Jul 2026 06:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E060A41100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782974712;
	bh=nhIftP2BGrO3DX9sr44jUQAV0PqVMZXqtz8n6rxAe28=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n20t5rzBiFAB3tX6wdEcUwAmss+YglFyEbZACYXlYWFl5qL0WEe1h6BfPL2y4UReP
	 qt7opwiuy9qo/3w2/MHi1HTCfDuzvLzIr8AsIFcz/Y5jATbO7/JdeKqcATgzUcUldF
	 aezycjZksY+UaCg6UHS/RC6PslB1uudAWuqdRkEHFKHhfc3tux50Tat5tLSV951C6K
	 31zmpoZj3/7ExNHOpG0rBtvVLRANNu6tHR6oDtTuT690wB1WbJfv4o5CRClIPLC45x
	 /Uc6gfWVWmnBASygOCWl7ES9yMwzA6m8ObtPMZOrD6CMnS0DqP8lXQz4rpf/bxHH0J
	 Z87BD1NSlGlUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E060A41100;
	Thu,  2 Jul 2026 06:45:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5350316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AFA360B76
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSQjk8Ws7fzp for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 06:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E46EC60B11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E46EC60B11
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:45:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10D32880A1; Thu,  2 Jul 2026 06:44:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 08:40:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8191c3e17dbcb3388b365c52edd3e928f0ed465
X-Git-Newrev: d67a214c37ab6b434d97a8c88587619a31f14e2b
X-Patchwork-Hint: ignore
Message-Id: <20260702064439.10D32880A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jq: security bump to v1.8.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d67a214c37ab6b434d97a8c88587619a31f14e2b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For more information about the release, see:
 - https://github.com/jqlang/jq/releases/tag/jq-1.8.2

All the CVEs were addressed by a patch but non-CVEs security fixes such
as GHSA-gf4g-95wj-4q4r or GHSA-hj52-j2c9-r8r4 are fixed by this release.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-out-of-bounds-read-in-jv-parse-sized.patch |   30 -
 ...002-fix-NUL-truncation-in-the-JSON-parser.patch |   35 -
 ...imit-path-depth-to-prevent-stack-overflow.patch |   72 -
 ...ng-append-and-jvp-string-copy-replace-bad.patch |   53 -
 ...ed-to-mitigate-hash-collision-DoS-attacks.patch |   90 --
 .../0006-limit-the-containment-check-depth.patch   |  120 --
 ...truncation-in-program-files-loaded-with-f.patch |   34 -
 ...x-signed-int-overflow-in-stack-reallocate.patch |   53 -
 ...meric-literals-longer-than-DEC-MAX-DIGITS.patch |   53 -
 ...embedded-NUL-bytes-in-module-import-paths.patch | 1512 --------------------
 ...ect-merge-depth-to-prevent-stack-overflow.patch |   66 -
 ...-module-imports-to-prevent-stack-overflow.patch |  142 --
 ...uctural-equality-and-comparison-recursion.patch |  423 ------
 ...-heap-buffer-overflow-in-raw-file-loading.patch |   32 -
 ...ounds-and-propagate-invalid-jv-in-implode.patch |   73 -
 package/jq/jq.hash                                 |    2 +-
 package/jq/jq.mk                                   |   47 +-
 17 files changed, 2 insertions(+), 2835 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
