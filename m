Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA99FC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 11:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75DBB40646;
	Mon, 18 Mar 2024 11:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NM2IjoHo9x1u; Mon, 18 Mar 2024 11:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FDCA40650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FDCA40650;
	Mon, 18 Mar 2024 11:45:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22D381BF366
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D89C80B40
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkOXILDYuWCZ for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 11:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42EB980B3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42EB980B3A
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 11:45:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37C788292F; Mon, 18 Mar 2024 11:45:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 12:24:54 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9bbb6ad2a60cfbf37c1dd0875add017b7e0966fc
X-Git-Newrev: be4b55ea525854272bc7eacdacf4a36a82304cac
X-Patchwork-Hint: ignore
Message-Id: <20240318114504.37C788292F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 support/scripts/pkg-stats: make current version cell scrollable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=be4b55ea525854272bc7eacdacf4a36a82304cac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Currently, when the version string is "too long", it is arbitrarily
truncated.

This works well for commit hashes, because usually the truncation is
long enough to provide a short hash that is still unique in the
upstream VCS.

However, there are non-hash-like versions strings that get truncated
and wihch the discriminant part is toward the end.

Yet, adapting the version cell to the widest versions string (most
probably a git hash) is not very interesting; the table is already very
large.

Make the cell with the version string scrollable: we get to keep the
best of both worlds: a narrow version cell, and a full-length version
string that can be copy-pasted if needed.

Signed-off-by: Sen Hastings <sen@hastings.org>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4533e42622e46f2b8e0ce4d1936c6534393d3aa1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index eea900124c..a539808eca 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -865,6 +865,13 @@ function expandField(fieldId){
 .centered {
   text-align: center;
 }
+
+ .current_version {
+   overflow: scroll;
+   width: 21ch;
+   padding: 10px 2px 10px 2px;
+ }
+
  .correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
    background: #d2ffc4;
  }
@@ -982,10 +989,7 @@ def dump_html_pkg(f, pkg):
 
     # Current version
     data_field_id = f'current_version__{pkg_css_class}'
-    if len(pkg.current_version) > 20:
-        current_version = pkg.current_version[:20] + "..."
-    else:
-        current_version = pkg.current_version
+    current_version = pkg.current_version
     f.write(f'  <div id="{data_field_id}" \
         class="centered current_version data _{pkg_css_class}">{current_version}</div>\n')
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
