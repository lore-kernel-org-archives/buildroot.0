Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CB3C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 19:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADBE380FEF;
	Wed, 22 Jul 2026 19:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INGMtdDY3CXk; Wed, 22 Jul 2026 19:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DBDC80FAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784749549;
	bh=EklUW1oLF/heeaBrDEwE1MGvh6AmtRAvpHbeqhminSo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pBg90DxJ5ATne99vncdOBZqjDcd4LNmiWJMHMNoZo/xXJnI0rnFMmeajh5uLbwar0
	 kDHRYtsrPq5BT65FCHTHHMCpY0zNeM/L60BK/9+3w2Nht3HRZNII/e0SdGZEJmsh/8
	 j0ko1ZQvN7QBhlEGjxPWpkD8ZM1ShcxHtYw9yQMKEtwJh0TxNCoZ+mKTd8TbYe3Ct0
	 IiIkcvb+hve7cSH+UW8/ML5D/SS1FVVZ5XXGDWO9NOd0MIg4h6DQbL5rY5XajwgrqS
	 2O0YqgApntsgNey416GGLnba0Eww3kRKpCgbF2G/NWDQix2UTt49xxXa+4JUuYuZor
	 QycF7JjNzbc7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DBDC80FAD;
	Wed, 22 Jul 2026 19:45:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26DF539E
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 248EA60878
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n_vNB-ySNvp for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 19:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7454860873
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7454860873
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E7318A2DD; Wed, 22 Jul 2026 19:45:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 21:35:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a424126096b5c909f1a7f99abf944e3df596aeed
X-Git-Newrev: 86c478eac9c3cc76ed5dc2eb2974f4e395a1b765
X-Patchwork-Hint: ignore
Message-Id: <20260722194508.9E7318A2DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/timescaledb: bump version to 2.28.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86c478eac9c3cc76ed5dc2eb2974f4e395a1b765
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/timescale/timescaledb/blob/2.28.3/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index fe733f323b..75f9b542de 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0a940720bb5b0b635dae4d8aeceb13e83b196b8aab8717876af0f45efa47ab6  timescaledb-2.27.1.tar.gz
+sha256  c9f95c8865f71244cdd333076284377e83dad62f85679fbf1c94ba48a7d67334  timescaledb-2.28.3.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index bc38eb9279..9bbe502941 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.27.1
+TIMESCALEDB_VERSION = 2.28.3
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
