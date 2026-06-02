Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729A3CD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43C4882D0C;
	Tue,  2 Jun 2026 20:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e64mfsV87QFT; Tue,  2 Jun 2026 20:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5125A82CAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780431402;
	bh=3qMD4rqRjNU8Dfw2KQE4d71fordXGg2OjNvAvxtfZ5I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c7/FF48uFNUPo0Sq2QjG+R9q5Ms40H7bcNAxkvCW+oVtrnX21vWeyA8KwIkMMyOFy
	 qZx+3XBg9IzbIp0pGi4+Ob2V73UaXIvMlONNgHnben0sXZkf8A05U57P3F9TeWz8rG
	 8fL3QP4WQo7/DkBLn/ZkjIZeqzCLLaSMNiks3iyvE7gQuABTrEh3FL1MiO6sS292EN
	 wZqzZsootRrhQF9Zx5Uz6/nQZXNvRuf+qwD2sLapPjR5JZM4L8A3KCuEjCvWvXapte
	 zJ1bUWMTmpN/zHKGNMg0E/eIeT75Aa3kPlzbh9NHx5LsgYvzSlaDbib5s5b1B3VA+F
	 LL0Dv8BaRdT8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5125A82CAC;
	Tue,  2 Jun 2026 20:16:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31A23D3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 239E840B8C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8SBbfbh7Pwk for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 20:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E01040B86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E01040B86
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEB6F878A7; Tue,  2 Jun 2026 20:16:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jun 2026 21:59:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9a9f240c1de99ca9607c378be43f154f0abc282
X-Git-Newrev: f93dbfca131d412c42ec3b1002d80861b9cfcb19
X-Patchwork-Hint: ignore
Message-Id: <20260602201624.DEB6F878A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/generate-gitlab-ci-yml:
 use large runners for defconfigs
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f93dbfca131d412c42ec3b1002d80861b9cfcb19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

defconfigs are very unlikely to successfully build on a small runner
because they build a kernel (and often a toolchain). They're also likely
to benefit a lot from the additional parallelism on larger runners.

For now, always build them on large runners. There may be some for which
even the large runners don't have sufficient disk space or memory, but
we'll solve that when it happens.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 2a8c9be5f5..48c272e6f5 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -126,7 +126,7 @@ gen_tests() {
 
     if [ -n "${do_defconfigs}" ]; then
         for cfg in "${defconfigs[@]}"; do
-            printf '%s%s: { extends: .defconfig_%s }\n' \
+            printf '%s%s: { extends: [ .defconfig_%s, .runner-large ] }\n' \
                    "${cfg}" "${defconfigs_ext}" "${do_defconfigs}"
         done
     fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
