Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB87CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C478610D6;
	Fri, 12 Jun 2026 11:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnQ68f5_cn1L; Fri, 12 Jun 2026 11:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B6D610C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263458;
	bh=d4Tuzo8bPvOrXY4DV2mIHRVOWu+ihj+bGBnh69KpILU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ld9N4C0QzhozdRLiBLFN11jlOE3U0KWP3Rl87e1nN20YYVyaulq4WqN47eoPI2NuY
	 Kw4vOUcrzH81Iq+RdfySm76ZdHGZ70/oXB9oTsWeq0kZdxHmj5buQNcJboA83hVqCX
	 khm6oYoQ+ZZUvm73tPIW4h5SqXr1Zo/Gked0yMCTexOLzg/wVNbER5f5Vz4h/9iIK+
	 1/wvSwdUYyvDBCM8imk+2x/Pu0IiZDJNo8vbDn+RNfASrJTSh8ni+b/Ts91wFCyk/5
	 ctqcAEtNO69s59UQOQAdyyg47QhDO39Ht77RZSvz9exljdA3Tn7rabAn8dGHDHIPgF
	 TyAppiMTzJ7gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2B6D610C9;
	Fri, 12 Jun 2026 11:24:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8B9321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CD1960EFD
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiQWDybuz9Zr for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85AD60F12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A85AD60F12
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81FB7880E8; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:30:44 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: f4c69e4ff012a6bbbdb468718943ddf7c12ffc1d
X-Git-Newrev: b8cc9b4b350e8b29fe8f0b7de9f7e07ab5c04181
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.81FB7880E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/scripts/generate-gitlab-ci-yml: use large runners for defconfigs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8cc9b4b350e8b29fe8f0b7de9f7e07ab5c04181
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

defconfigs are very unlikely to successfully build on a small runner
because they build a kernel (and often a toolchain). They're also likely
to benefit a lot from the additional parallelism on larger runners.

For now, always build them on large runners. There may be some for which
even the large runners don't have sufficient disk space or memory, but
we'll solve that when it happens.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit f93dbfca131d412c42ec3b1002d80861b9cfcb19)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
