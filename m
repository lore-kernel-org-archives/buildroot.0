Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AE5CD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC11360F68;
	Fri, 12 Jun 2026 11:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiP2k03i5Jzo; Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B319460F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263357;
	bh=hlK3Nsg82/MDppzfjAJupQ6EN7n7mAUJQHHnhV1Uz7Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W8PkoV5lpUQWMdNOCAuT+pAvWPRYJeSWIz6CFxfPio9at+nvayKlpxneZdAw4fSgK
	 hjHgeEFvQZNEj5PmuaBXz/tOx15qeGvAkmznUxrFO37iMEko9g3DduH7Y1UhOPUyZl
	 e10MJJJcLp/7s5+sW84H73t9v86EToo9D1AQO2wfbSHspoi2FfBgbC1qPEMNACwCiQ
	 yra7V33vuNMBAyDJU97PeQ0hfx+QzrCdfU2qKQCcbeeW9dGl5u0y7l1+4qsgOimMmw
	 jWOJCwzudRAlfXWYk9a+uefivAXVTx1p5xQ6YUi3mq8y6vIGLXQXmmUQzP6q30ooDQ
	 jkWtJNR+4RL+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B319460F5C;
	Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 140BFF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2F2D60F1A
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eH5B7ZMKhRRu for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A414260EFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A414260EFE
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52B4F880EA; Fri, 12 Jun 2026 11:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:31:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 43e62b5835049c012100819de0b1c8ce93c2a9bf
X-Git-Newrev: cd25914b7836997aca7e376c633741987efcf4b2
X-Patchwork-Hint: ignore
Message-Id: <20260612112206.52B4F880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd25914b7836997aca7e376c633741987efcf4b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
