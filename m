Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305DDC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33A96849F9;
	Mon, 19 May 2025 11:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ad1ehu6OGWi0; Mon, 19 May 2025 11:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C951849FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C951849FB;
	Mon, 19 May 2025 11:05:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E47E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB0444121D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3Z0mQBZBYd5 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD380423A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD380423A1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8BE381E90; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 107e935e1c0f9776776791d7d98a536e627c3354
X-Git-Newrev: 9c482f525a3f3d5c2d157e4dbc598ea1c7869338
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.A8BE381E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sox: add
 SOX_CPE_ID_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c482f525a3f3d5c2d157e4dbc598ea1c7869338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

All ignore CVE entries of the sox package are considered stale because
SOX_VERSION is a Git commit and therefore the version matching logic
doesn't do the right thing.

This commit sets SOX_CPE_ID_VERSION to 14.4.2, which is the closest
upstream version on which we are based: our Git commit is 14.4.2 plus
a number of commits that fix a large number of CVEs.

Thanks to this change, the ignore CVE entries are no longer stale.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sox/sox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index d0329bf50d..42e47a916c 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -12,6 +12,8 @@ SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 SOX_CPE_ID_VENDOR = sound_exchange_project
 SOX_CPE_ID_PRODUCT = sound_exchange
+# The Git commit in SOX_VERSION is 14.4.2 + a large number of commits
+SOX_CPE_ID_VERSION = 14.4.2
 # From git and we're patching configure.ac
 SOX_AUTORECONF = YES
 SOX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
