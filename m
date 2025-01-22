Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB437C0218C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB76846BE;
	Wed, 22 Jan 2025 15:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdFjmR8Fv9ut; Wed, 22 Jan 2025 15:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C23840B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C23840B5;
	Wed, 22 Jan 2025 15:53:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B252FA1
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0014840590
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6g8xNsgWwDCP for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E315840604
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E315840604
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:53:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD23E86065; Wed, 22 Jan 2025 15:53:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 16:19:40 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: e85f37c892bf27b3e5e96513894bd73b0e2b4bde
X-Git-Newrev: 0615b31f02757ac7d503a8c13b0df5fccf7b8656
X-Patchwork-Hint: ignore
Message-Id: <20250122155314.CD23E86065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] Config.in: introduce the
 BR2_BROKEN hidden symbol
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

commit: https://git.buildroot.net/buildroot/commit/?id=0615b31f02757ac7d503a8c13b0df5fccf7b8656
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Commit [1]
"toolchain/toolchain-external/toolchain-external-synopsys-arc: mark
as broken" disabled BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC by adding a
depends on BR2_BROKEN. This symbol does not exist and generates
check-symbol failures, see [2].

This commit fixes this issue by introducing the BR2_BROKEN hidden symbol
that will be used to track those known to be broken features. This
symbol will help to track features that were broken for too long and
remove them.

Fixes: [2]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8840476511

Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2ddc5808cd19f577917566ad83e2a3835d6d43b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Config.in b/Config.in
index 247a9e8ef1..28d34c8721 100644
--- a/Config.in
+++ b/Config.in
@@ -6,6 +6,15 @@ config BR2_HAVE_DOT_CONFIG
 	bool
 	default y
 
+# Hidden symbol kept to false, to temporarily mark a configuration
+# known to be broken (by depending on it). Ideally, we don't want to
+# keep broken parts for too long. The intended use of this symbol is
+# to give some time to a developer to fix the feature. Features marked
+# as broken will be removed if they are not fixed in a reasonable
+# amount of time.
+config BR2_BROKEN
+	bool
+
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
