Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098A8C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD85F40B66;
	Fri, 10 Jul 2026 13:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xO1h1HJ_A3Oq; Fri, 10 Jul 2026 13:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1CB440B56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691106;
	bh=avAp6woe4NbGkaRfdTUpxSjFRGYAANNK+vODF9H3FA8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ECnpEwDXHjPgGWCu1/K2CrsvlY8RGF77NGrd8MMwIfd+GN4Aijv01BqIExPKwSBxN
	 BJoODYpoEiXSm3lR9DhALll/28WEckaj3sy7RBkNxy34fO46m+dHLe4sl/kalhmWfC
	 HCG3cKCnCkgYGoZ12TVzEB7cLnQuKpaSY3F/x1VotenJouwy2AIPCLnOsODR7Tbzff
	 2CKuLqRWcV2BJhjyXQ4xDdik9P/pYXJlrFqSwpUzUf8L0mZtSS17g84x9nDO5byf1b
	 vzDNT+pDlv4v3heh1rb+pvkF9QV6Mr0cKqQMqmN9DiaoC3GJJwiidlkw8PoY+a3Mjy
	 9MRH6K/3EUJqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1CB440B56;
	Fri, 10 Jul 2026 13:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E11582FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D21FD810C1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9pAVh_T5Udd for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804B4810BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 804B4810BA
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A744C8867A; Fri, 10 Jul 2026 13:44:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:52:18 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1526d90b3d1f6a679bf65a85d7b4de01ac748924
X-Git-Newrev: e0f6f17ca844c84553ced5464128d6b112240c18
X-Patchwork-Hint: ignore
Message-Id: <20260710134415.A744C8867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/jq: security bump
 to v1.8.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e0f6f17ca844c84553ced5464128d6b112240c18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

For more information about the release, see:
 - https://github.com/jqlang/jq/releases/tag/jq-1.8.2

All the CVEs were addressed by a patch but non-CVEs security fixes such
as GHSA-gf4g-95wj-4q4r or GHSA-hj52-j2c9-r8r4 are fixed by this release.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d67a214c37ab6b434d97a8c88587619a31f14e2b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
