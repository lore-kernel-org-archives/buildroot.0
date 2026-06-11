Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37087CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA6560F1F;
	Fri, 12 Jun 2026 11:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBhUAr0pUqMu; Fri, 12 Jun 2026 11:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F64460F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263352;
	bh=ePhRVDyGLBnAQDuPS+DuLWJKUv6FnJRaNKaCJOMVOHo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=orkoAqOW5ymntYVHZkzy8HDQQfMP6Y1zLETnDtOwVrFyDUldvHCbNhBgXVaqgP6Mh
	 7G5M53ffOHzT3wzi9JzyDaOBTG8sWLyRZGBaOmg9yT7aii3Mq7BvxM+6gR0jgHHGsI
	 IY5oLfITSH7IWLJxLW8zJ1Kn4/+JB3KGPQI6APMVEPNCVV9MyL/VkjvR2ZkDpsIqD9
	 +0oxg7TOEzgVZ3qwgoDDZbWXhNjOdnQum2BjCl8bzD5mhm3u1t+OSQ2w87G6yFTjvx
	 2rGTpPfj9AjHNcWXWCYeRbvdI1q/BwnSRZOmegTF90tqIOzYYn4M5QFaiY+QgXz53+
	 dsilbriQPuOig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F64460F3B;
	Fri, 12 Jun 2026 11:22:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99FF1F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AAB660F14
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIG2hbLOP11I for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B6660EFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7B6660EFE
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ED20880D5; Fri, 12 Jun 2026 11:22:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:19:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f5dfe087eea4352e21b56f16059217b6bc35ebf2
X-Git-Newrev: f0bd87fd48ec5f550b5902e982941cf81610b642
X-Patchwork-Hint: ignore
Message-Id: <20260612112204.7ED20880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/generate-gitlab-ci-yml: support scheduled pipelines
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f0bd87fd48ec5f550b5902e982941cf81610b642
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Currently the weekly pipelines are triggered from a cron job on the
Buildroot server, so generate-gitlab-ci-yml filters on the "trigger"
source. However, we'd like to schedule it on gitlab itself, which makes
managing it easier.

We could filter on "schedule" in addition to "trigger", but there's not
really a reason to. We can simply rely on the BR_SCHEDULE_JOBS variable
- if it is set, we use its information.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit c0922004d8e888d378a03ecca42e77160d1bcd18)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 2d922b9eb2..be2b8f0fe9 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -42,7 +42,7 @@ gen_tests() {
         do_basics=true
         do_defconfigs=base
         do_runtime=true
-    elif [ "${CI_PIPELINE_SOURCE}" = "trigger" ]; then
+    elif [ -n "${BR_SCHEDULE_JOBS}" ]; then
         case "${BR_SCHEDULE_JOBS}" in
           (basic)
             do_basics=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
