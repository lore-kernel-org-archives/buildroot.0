Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36144C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7D17610C0;
	Wed,  3 Aug 2022 16:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7D17610C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvvNbCY1a6e6; Wed,  3 Aug 2022 16:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B09C260A6A;
	Wed,  3 Aug 2022 16:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B09C260A6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B26F1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0085541725
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0085541725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FpPrqgWapbvG for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:17:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5E0241523
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E0241523
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7487E86D4C; Wed,  3 Aug 2022 16:03:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 18:17:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d743ccb070d00849bfe35a97211c705440d5e96
X-Git-Newrev: ccc924ffb31a591ac752b68d731de67c9120075a
X-Patchwork-Hint: ignore
Message-Id: <20220803160350.7487E86D4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add linebreak
 opportunity in CPE ID
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ccc924ffb31a591ac752b68d731de67c9120075a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds an optional linebreak at the vendor attribute in the CPE ID.

It should be noted this is purely for formatting/layout purposes
and does not actually insert any additional characters
(newline or otherwise) into the rendered text.

This means that even though the text renders across two lines,
copy-pasting will still yield one line of text.

example: https://sen-h.github.io/pkg-stats/c245575.html

see also: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/wbr

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 91d42206ca..d32abd7225 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1102,7 +1102,9 @@ def dump_html_pkg(f, pkg):
         div_class.append("cpe-unknown")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
     if pkg.cpeid:
-        f.write("  <code>%s</code>\n" % pkg.cpeid)
+        cpeid_begin = ":".join(pkg.cpeid.split(":")[0:4]) + ":"
+        cpeid_formatted = pkg.cpeid.replace(cpeid_begin, cpeid_begin + "<wbr>")
+        f.write("  <code>%s</code>\n" % cpeid_formatted)
     if not pkg.is_status_ok("cpe"):
         if pkg.is_actual_package and pkg.current_version:
             if pkg.cpeid:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
