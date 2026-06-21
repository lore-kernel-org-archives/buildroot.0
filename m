Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7B3CD98F2
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 10:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A56AB6FD02;
	Sun, 21 Jun 2026 10:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GW9FTL7gPsX1; Sun, 21 Jun 2026 10:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D0D96FCFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782038375;
	bh=B2Adc5b4xlJzCY0tAIb0jmZHIExKR3XXP0c7v3b2hew=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JIgykjtpQNc4m386jKyukr2VqQXyOMt8GPwf+wsFzqaZn3M+Ham2Yjt2p0NWP23jk
	 /bF336AdH/WKDc3bcQUZn8HRYxGTgAZsE2NfVOh/GBCpQf5dgjkFncudP9ER9iXTBh
	 TA+YoOaEaZ/YbpC6R8bw7R0abtA3IpoYRWY/Z4bAUI6Z9XrLbvHq0cjLHpLkauiZ3u
	 DNuTpI0GRHf4BBt2efXkkQ3cV/DJhgDDiuKrH8IHfLElFkRxLYt/qZINj7BKlJ/wdE
	 pEHq335hB74qk7HSmxkotiimn8KJlTmutbRyh3wkIHsTyINfK/Rycu7RbUwU6GHacx
	 qb/Jz5Fvt593g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D0D96FCFC;
	Sun, 21 Jun 2026 10:39:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC65C118
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2BB2424C8
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orKy3u546EdA for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 10:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1FB04018E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1FB04018E
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:39:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78142832B3; Sun, 21 Jun 2026 10:39:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jun 2026 12:37:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebcfdb8b0ae0077525558376ff9199ba6b6a34f5
X-Git-Newrev: 183c52448d77586aeba30ca9e5b1b7a9342b144c
X-Patchwork-Hint: ignore
Message-Id: <20260621103909.78142832B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: security bump version
 to 6.6.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/183c52448d77586aeba30ca9e5b1b7a9342b144c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/p/fetchmail/mailman/message/59347909/

"## SECURITY BUGFIX
* POP3 with RPA: fix calculation of buffer sizes to avoid buffer
  overflow on long service challenges with long user IDs"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 60c950476c..cbf1ef2afb 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59332343/
-sha256  efe01690d22bda359a579c77e2b0072658a092bff490ec0478a212c6b7d0eb70  fetchmail-6.6.4.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59347909/
+sha256  ab0320fe4df0b5ee8659189e66590d9de96aadbf929fe59f353ae7a317e9ef1e  fetchmail-6.6.5.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index d021c2c7bd..9b3c035844 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
