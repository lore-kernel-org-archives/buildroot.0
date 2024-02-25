Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E561BC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7861940185;
	Sun, 25 Feb 2024 17:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6SqckK9sRAL; Sun, 25 Feb 2024 17:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39D10400E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39D10400E4;
	Sun, 25 Feb 2024 17:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BE321BF37C
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 17:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74034400E4
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 17:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdfxGoPsxBRG for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 17:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C748400CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C748400CB
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 17:51:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EA2987AB3; Sun, 25 Feb 2024 17:51:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 18:45:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a9ba7a71e49f11e2c8d28a578ddef3a1ad96064
X-Git-Newrev: 4533e42622e46f2b8e0ce4d1936c6534393d3aa1
X-Patchwork-Hint: ignore
Message-Id: <20240225175139.2EA2987AB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: make current
 version cell scrollable
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

commit: https://git.buildroot.net/buildroot/commit/?id=4533e42622e46f2b8e0ce4d1936c6534393d3aa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/scripts/pkg-stats | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7835cb3d62..9307992d29 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -845,6 +845,13 @@ function expandField(fieldId){
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
@@ -964,10 +971,7 @@ def dump_html_pkg(f, pkg):
 
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
