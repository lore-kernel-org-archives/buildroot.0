Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D386CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C4E42288;
	Fri, 29 May 2026 16:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2QggaaC7njY; Fri, 29 May 2026 16:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0CA0420B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780072913;
	bh=+LPmNOSKqIV1/XCd2vIDcO1WkQlcldgLN2aY1kBNgME=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mmDpH9Oist2hL0Wqa6nVMXibtlKsppPDIIMXN6dXCJvO54d5MEqErZLzBW46OkrpS
	 CLROxPyIdTSKl3t/wMVgiI30dRiN+C4OE43vVKSCX32nMSI8jNvss91b87RMtDgNmm
	 +Bo8pKDDo2Du5P1laU47vyHOEKI2uyDWZe2WRSBpfr2QzQYjPmCoLE7gwn1mO1qEBE
	 MNhcX8nySGkUchHl41+gbZjZV+GmXsoKNkdHmTH9qeF34wmdzayGTFWVVLJ3Vw5exR
	 6zVaLBJ84Pz0ZQ77hzfYuIXtJ0kQbmJCKMURlgiGMuIENTkFyPgM2qJXESCdRTNgyg
	 swJJYlYuy+lWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CA0420B0;
	Fri, 29 May 2026 16:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0147288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CDBC61540
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fVPaWUo9o16 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC3F460E64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC3F460E64
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:41:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 239B187403; Fri, 29 May 2026 16:41:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:37:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38039415f86c6e500ff6c296313dff5c8cc2f468
X-Git-Newrev: c0922004d8e888d378a03ecca42e77160d1bcd18
X-Patchwork-Hint: ignore
Message-Id: <20260529164139.239B187403@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/generate-gitlab-ci-yml:
 support scheduled pipelines
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c0922004d8e888d378a03ecca42e77160d1bcd18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Currently the weekly pipelines are triggered from a cron job on the
Buildroot server, so generate-gitlab-ci-yml filters on the "trigger"
source. However, we'd like to schedule it on gitlab itself, which makes
managing it easier.

We could filter on "schedule" in addition to "trigger", but there's not
really a reason to. We can simply rely on the BR_SCHEDULE_JOBS variable
- if it is set, we use its information.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 4c0f892d33..2a8c9be5f5 100755
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
