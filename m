Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3829EA71AD
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 21:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4912361019;
	Sun, 19 Apr 2026 21:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tO3ECoDkkReP; Sun, 19 Apr 2026 21:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3848961001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776634780;
	bh=BeD4oKXGSAKs4OnNv5HhiAI9qlr/L7VlFXGp6br7UJ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kD96sBNibFYVmw2G/0V5o6aRd/ckYpFSyLtOdKB27ZBfk/O8UGAAUHLrY5ZCKC6Ds
	 OTZ9yTcJqVfolH2Enoqos8rm5mOVN/uNXzJoobGHT1bmpIzv3JahiDeoh7fnQSebMR
	 +YptGeeIUKB81SIFNuy0sEBROXJgbCL8J8nx6CY1aslS0HJZ3y643zK6+U+a0yR9BJ
	 ymmmKAkZ1F3Nb2RoJIxC+YG+4WbBchwl/sFVbUgCXuaB6YWl2M/n7YO7ORMqc8qq2M
	 34RUOkTwDBM4o6KVK12upEbUqJW92JdtLphHMkXkrH0tvVYRflulte3+1DY+zv3SjB
	 neC26B4TplkeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3848961001;
	Sun, 19 Apr 2026 21:39:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60A522B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46CB0407B5
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMyKza82E1wb for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 21:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2E140484
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C2E140484
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E85F281F98; Sun, 19 Apr 2026 21:39:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 23:30:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0104d731834ae1a50185f7bf456d62b06fda0f70
X-Git-Newrev: 0f5e9556a13cf662732aeaa829a4b0e661e3a7ab
X-Patchwork-Hint: ignore
Message-Id: <20260419213935.E85F281F98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pv: bump to version 1.10.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f5e9556a13cf662732aeaa829a4b0e661e3a7ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See NEWS:
https://codeberg.org/ivarch/pv/src/tag/v1.10.5/docs/NEWS.md

Changes in 1.10.5:
- Fix --bits option rate calculation and --gauge compatibility
- Security: ignore TMP/TMPDIR, improve memory safety
- Fix terminal state garbling on exit with --cursor
- Improve ETA calculation across suspend/resume
- Better --watchfd and --line-mode handling
- Address issues found by security audit tools

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien:
 - move DEVELOPER entry in a separate commit
 - add link to NEWS in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pv/pv.hash | 2 +-
 package/pv/pv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 76595904d4..4ddce35f89 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
 # using key: D8FF44A79CC8A61EF694FA7EB883E01314DA8E84
 # from: https://codeberg.org/a-j-wood.gpg
-sha256  aa1630c79af6960a8922ffa64d2c3e7f87486da21fcb57e277824294fd266742  pv-1.10.3.tar.gz
+sha256  ab21b4f8662280646b6a02e1b9f096790918f89c952bbe0d06fef75d3b52fb15  pv-1.10.5.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 41a7280f6f..efe305cf6e 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.10.3
+PV_VERSION = 1.10.5
 PV_SITE = https://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
