Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779D7CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C0C60F1E;
	Fri, 12 Jun 2026 11:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCNaSSGjx16g; Fri, 12 Jun 2026 11:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52520610C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263457;
	bh=tyeOEkjwM6a1riQfuEguiQ9MHbE0NuZUNZasnpiwqr0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MIHDIbLeQgfHrUe0g4NcCgv0t0Pj+MgkV3hC7jsrxnYJUa/n+dGut0KAdcAqpgh1t
	 LDK1OX8wiWrlIgGNulVUiI4YPQwcYl4uF3JjeKNukEV9h8uCymgx+q37UMKnLjDJol
	 o3iyAQWsku3ZAjuEgEKv6iHTEepaBuh9yopWcWMe2O2tEKPM8h1yojJDZ/Jnd4BHxh
	 TUfB9e0xqfD3cYtSl3TioPXOtlHU2z4zaUnXcIV5VnlK6GNk0SGocI6p8xFzGW4DSS
	 j9bXvWRgwl8N9az8fZCgJXcdVvvNqaTMyBD3J1N5LME5dFtWDuFgYpX+ZiwQhBb5kH
	 n+NHG5lneAtxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52520610C9;
	Fri, 12 Jun 2026 11:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E3C7237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCBB241111
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8g4aSOjXdEAJ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1FBB41118
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1FBB41118
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D065880EC; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:20:02 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3d7636a80579e14cde29513c050e49714e065101
X-Git-Newrev: 10a19baca49760604c55b815463801b1b473b143
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.5D065880EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10a19baca49760604c55b815463801b1b473b143
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
