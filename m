Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A9EC5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9054683C58;
	Wed,  4 Jun 2025 18:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbuNqn6zkeZf; Wed,  4 Jun 2025 18:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A4D83B7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A4D83B7A;
	Wed,  4 Jun 2025 18:28:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE10DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 063BF40084
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAwsTCZ1TXaH for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BB8B4008B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BB8B4008B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09EC5876DC; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:27:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f6ff1078798946bfa96c0d973536731e814f4999
X-Git-Newrev: 1933b2d744f07002effd6b85024de5ac50326473
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.09EC5876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sox: add
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1933b2d744f07002effd6b85024de5ac50326473
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

All ignore CVE entries of the sox package are considered stale because
SOX_VERSION is a Git commit and therefore the version matching logic
doesn't do the right thing.

This commit sets SOX_CPE_ID_VERSION to 14.4.2, which is the closest
upstream version on which we are based: our Git commit is 14.4.2 plus
a number of commits that fix a large number of CVEs.

Thanks to this change, the ignore CVE entries are no longer stale.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9c482f525a3f3d5c2d157e4dbc598ea1c7869338)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
