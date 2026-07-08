Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1428C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6C140B76;
	Fri, 10 Jul 2026 13:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ip8ePRkXmRd; Fri, 10 Jul 2026 13:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22AAE40B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691104;
	bh=LBbomgTDP3Zizlf+XGbTG2QjtIAwGy0DsaDxW1OlWm8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MaQ0v1h30tg6pwzgX9zuiD0a6HXNxPN8b/MPpIhoK9oXys/5Fb9LJVf36yuIVd2GN
	 ZfTM7jIC+RaqzYi/e5IgH2/BQnodtbRBcFv0cpTOSEGx14Y7UzJmX4cZzwTLBWyM1h
	 hPAE4RosUkAjC+dv/CjDxuJKS8MOjDQeRy+N4dBvu2zlMVxS/UKZLepELUzBc3Jy+F
	 NY3z/Iq7i35ml+hibUIf9VS8GPqjxgfJeos/CwnMqaCKUvcDzBEuW+JA9jxdD9Alq2
	 G21ZWpqoOgAo8OS0YbUu5qTZpHVmNFAgocvJcaJIlNzyNjFKgFLCvAw7qbyyp8YI5K
	 zaRi8I4of0Q8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22AAE40B4B;
	Fri, 10 Jul 2026 13:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A70302FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4D636068F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZMBJNMgl2Is for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0714E606A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0714E606A7
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B53A8867A; Fri, 10 Jul 2026 13:44:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:52:07 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8bb9d8307069dae8ff894ed0689376b95eb91963
X-Git-Newrev: 1526d90b3d1f6a679bf65a85d7b4de01ac748924
X-Patchwork-Hint: ignore
Message-Id: <20260710134413.3B53A8867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/jq: patch various
 CVEs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1526d90b3d1f6a679bf65a85d7b4de01ac748924
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Fixes the following vulnerabilities by importing upstream patches:

- CVE-2026-39979: https://github.com/jqlang/jq/commit/2f09060afab23fe9390cce7cb860b10416e1bf5f

- CVE-2026-33948: https://github.com/jqlang/jq/commit/6374ae0bcdfe33a18eb0ae6db28493b1f34a0a5b

- CVE-2026-33947: https://github.com/jqlang/jq/commit/fb59f1491058d58bdc3e8dd28f1773d1ac690a1f

- CVE-2026-32316: https://github.com/jqlang/jq/commit/e47e56d226519635768e6aab2f38f0ab037c09e5

- CVE-2026-40164: https://github.com/jqlang/jq/commit/0c7d133c3c7e37c00b6d46b658a02244fdd3c784

- CVE-2026-40612: https://github.com/jqlang/jq/commit/d1a12569d91641135976a8536776a4a329c02cc2

- CVE-2026-41256: https://github.com/jqlang/jq/commit/5a015deae35d19e3ebbc65db6c157a80e76df738

- CVE-2026-41257: https://github.com/jqlang/jq/commit/01b3cded76daacbfddb7f8763700b0803bcb5c6f

- CVE-2026-43894: https://github.com/jqlang/jq/commit/9761ceb7d6cc48c16b25f0ab1baaef0e701927e4

- CVE-2026-43895: https://github.com/jqlang/jq/commit/9d223f153c3632a207fa071caaa6292da33ae361

- CVE-2026-43896: https://github.com/jqlang/jq/commit/532ccea6080ed6758f39fe9f6208a44b665023d2

- CVE-2026-44777: https://github.com/jqlang/jq/commit/f58787c41835d9b17795730cb04925fdba25c71c

- CVE-2026-47770: https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc91334ef55787831

- CVE-2026-49839: https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e8275b86

- CVE-2026-54679: https://github.com/jqlang/jq/commit/46d1da30944ce93dd671ac72b6513fc0eb747837

Tests were stripped out of the patches.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e8191c3e17dbcb3388b365c52edd3e928f0ed465)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-fix-out-of-bounds-read-in-jv-parse-sized.patch |   30 +
 ...002-fix-NUL-truncation-in-the-JSON-parser.patch |   35 +
 ...imit-path-depth-to-prevent-stack-overflow.patch |   72 +
 ...ng-append-and-jvp-string-copy-replace-bad.patch |   53 +
 ...ed-to-mitigate-hash-collision-DoS-attacks.patch |   90 ++
 .../0006-limit-the-containment-check-depth.patch   |  120 ++
 ...truncation-in-program-files-loaded-with-f.patch |   34 +
 ...x-signed-int-overflow-in-stack-reallocate.patch |   53 +
 ...meric-literals-longer-than-DEC-MAX-DIGITS.patch |   53 +
 ...embedded-NUL-bytes-in-module-import-paths.patch | 1512 ++++++++++++++++++++
 ...ect-merge-depth-to-prevent-stack-overflow.patch |   66 +
 ...-module-imports-to-prevent-stack-overflow.patch |  142 ++
 ...uctural-equality-and-comparison-recursion.patch |  423 ++++++
 ...-heap-buffer-overflow-in-raw-file-loading.patch |   32 +
 ...ounds-and-propagate-invalid-jv-in-implode.patch |   73 +
 package/jq/jq.mk                                   |   45 +
 16 files changed, 2833 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
