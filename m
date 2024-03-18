Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5789C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 11:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FE3840734;
	Mon, 18 Mar 2024 11:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eToTFNFx1VCT; Mon, 18 Mar 2024 11:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9345D40917
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9345D40917;
	Mon, 18 Mar 2024 11:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58B8A1BF366
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4664440520
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t43OPnAJhw8E for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 11:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BFEE40513
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BFEE40513
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 11:46:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48D9882A17; Mon, 18 Mar 2024 11:46:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 12:24:49 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: af51fd9617a9f139bd8ca85175d4eeecad920522
X-Git-Newrev: 5f09acc370806b23c2f4467b0d4bd0fa06ec2670
X-Patchwork-Hint: ignore
Message-Id: <20240318114614.48D9882A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f09acc370806b23c2f4467b0d4bd0fa06ec2670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
index 9349a0df57..f6f4c44b9c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -869,6 +869,13 @@ function expandField(fieldId){
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
@@ -986,10 +993,7 @@ def dump_html_pkg(f, pkg):
 
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
