Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598E2C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BCAC70A97;
	Mon, 19 May 2025 10:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nENJk4gCec8W; Mon, 19 May 2025 10:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79CC470A98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79CC470A98;
	Mon, 19 May 2025 10:56:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AB89D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A030841261
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMWUVtB2OstE for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F365412C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F365412C2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D5D7872E7; Mon, 19 May 2025 10:39:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Apr 2025 21:45:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b6f33b248a677c91e05f4c670671b79ec5c6a05a
X-Git-Newrev: 92e7ab78d6546d822dbeff7282feae4a42e6cbb5
X-Patchwork-Hint: ignore
Message-Id: <20250519103958.1D5D7872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats: fix
 typo in --disable help text
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
Content-Type: multipart/mixed; boundary="===============4394426187362795491=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4394426187362795491==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=92e7ab78d6546d822dbeff7282feae4a42e6cbb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Annoyingly, using "--disable warning" does not disable the warnings
checks.

It turns out that we look for "warnings" (i.e. with an 's') to know if
we should disable the warnings check, so update the help text
accordingly.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c134e1ec06..46b12cd992 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1276,7 +1276,7 @@ def parse_args():
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
     parser.add_argument('--disable', type=list_str,
-                        help='Features to disable, comma-separated (cve, upstream, url, warning)',
+                        help='Features to disable, comma-separated (cve, upstream, url, warnings)',
                         default=[])
     parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
                         help='Increase verbosity')

--===============4394426187362795491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4394426187362795491==--
