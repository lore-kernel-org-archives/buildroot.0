Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5135CCA476
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 12:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743BA412EC;
	Mon, 13 Oct 2025 12:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1gIk1WGq0Cb; Mon, 13 Oct 2025 12:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9665412E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9665412E9;
	Mon, 13 Oct 2025 12:03:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E9F92A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55B3540889
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g49QdrHbuHo4 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 12:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8032C4019A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8032C4019A
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:03:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EE2087099; Mon, 13 Oct 2025 12:03:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 14:03:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fef7cbb6d9212d3702213ade1e09629ad7d8e1c
X-Git-Newrev: f32e6aa226ccbc9a53a47c736a13e57bcc78dc67
X-Patchwork-Hint: ignore
Message-Id: <20251013120355.6EE2087099@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/download.html: fix latest
 releases dates
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

commit: https://git.buildroot.net/buildroot/commit/?id=f32e6aa226ccbc9a53a47c736a13e57bcc78dc67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The website download page was updated for the latest releases of
2025.{02,05,08} in [1], but the column "Latest release date" wasn't
updated.

Moreover, indicate that 2025.05.3 is the EOL stable release.

[1] e5501d7b1a98c1e760f7569472d01491b21ffefa

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 5bb7cf6987..d5b849ca9a 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -54,7 +54,7 @@
               Changelog
             </a>
           </td>
-          <td>2025-09-07</td>
+          <td>2025-10-11</td>
           <td>
             <a href="/downloads/buildroot-2025.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -70,7 +70,7 @@
             <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
-          <th>Stable</th>
+          <th>Stable (EOL)</th>
           <th>2025.05.x</th>
           <td>September 2025</td>
           <td>
@@ -79,7 +79,7 @@
               Changelog
             </a>
           </td>
-          <td>2025-09-09</td>
+          <td>2025-10-11</td>
           <td>
             <a href="/downloads/buildroot-2025.05.3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -105,7 +105,7 @@
               Changelog
             </a>
           </td>
-          <td>2025-09-09</td>
+          <td>2025-10-11</td>
           <td>
             <a href="/downloads/buildroot-2025.02.7.tar.gz">
               <img src="images/zip.png" width="24" alt="">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
