Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72151E85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4508E825C3;
	Fri,  3 Apr 2026 17:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zayu_XZgsK9H; Fri,  3 Apr 2026 17:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C41825D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775238136;
	bh=0DgiSOi9ANn+qF33+qUPXOWktyuaIuQ2ZPHOmuUbtgk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KJ1DbdtA4HcNN++94cng5+sh0KEAjjmLGYWv8WfgtokjfuJrbd+VFpZg7eZs95Aw+
	 cbYwt3O7acaf8IWF5U0bYw7IYt2D2fvRFWVO0KH+hKcDluqkml8FXrrNkdE3mmWsfG
	 tp6HReNZIYjw86yarZ3643o2hbzEgP+2+rPhX5oJuV/Ywr/UhZ5xHRV01b38AspwTv
	 +it1cVPQPyVFnHMB465vDQabwZN+dSNZJgpUMblLPqsJlwh+BUMCTbrpSCz1tpwoJh
	 eZDhC8zDJhyj4nR5WOj1G6Op5MkBXHpLuNewaauYOmZRIJ6xtuHqYTDGCbSLHJXbYz
	 olzormCToM2JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C41825D3;
	Fri,  3 Apr 2026 17:42:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 281C41A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19F3B411A2
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rieiCn43qb6q for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3860141195
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3860141195
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A04CD80158; Fri,  3 Apr 2026 17:42:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:39:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82186898102ea15b23b011ba39ddffe0ca4b4c20
X-Git-Newrev: 2fb10c689c3a731988330ae52dc29f19b8dc4201
X-Patchwork-Hint: ignore
Message-Id: <20260403174213.A04CD80158@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 14.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2fb10c689c3a731988330ae52dc29f19b8dc4201
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/14.0.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 8642387392..626ed7b7d4 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.2.1
-sha256  6695da3eb7e1be0aa3092fe4d81433a33b47f4519259c759d729e3a9a55c1429  harfbuzz-13.2.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.0.0
+sha256  d4aa312728136e3dc7c3cda47b871614ce0d12bbb19f9dcac2ea70de836dc307  harfbuzz-14.0.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index df05596b1d..aef8681a13 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 13.2.1
+HARFBUZZ_VERSION = 14.0.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
