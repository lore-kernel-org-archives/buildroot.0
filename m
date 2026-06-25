Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F520C44500
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34AEE411A0;
	Fri, 26 Jun 2026 14:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMMGWHXKr7Ac; Fri, 26 Jun 2026 14:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ABE3411A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485539;
	bh=q+kok11qOEp9jZ8U5wnLLze49PfrddTzpxJKRboAOWc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DSqVK68dseYEPCtiuM3zabo0KjG2wtThbXoLJhwKT6yx9zGFaezoa4+459cvHsbmS
	 TA1gcksW7jTPSUYoEwU7efieQvmHcExKA0KJjpUEarZnz7we29+AGAgpJtFhwKNshF
	 1Z+5xbdFvT9bOu/dTFpCh7N75n/HAVRA293HC3wge4pNn1+5SfJLwPUegDS8vtptDV
	 6qKCRUIESRyyFM02T2+JPTWIjOZkUPTimpCqVJEHJQ/ZDS+7l9pjF2RtQUjWPAy78+
	 ThW8tx6C00nkj9knKN++ptOsJEWA/aDHcL/EUy7ffUfqIaiFgBU2SMc484GHvtMXUs
	 3XTBsUhPEx73A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABE3411A8;
	Fri, 26 Jun 2026 14:52:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00E49231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E376881160
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGlnkd_TELR0 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13F148108D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13F148108D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06D9D8649C; Fri, 26 Jun 2026 14:51:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:44:38 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4aeeffe1666f361a0abfc34264040a32699e5780
X-Git-Newrev: 7059bb9c432883b4397d18dabb2f24ac19a1e8a1
X-Patchwork-Hint: ignore
Message-Id: <20260626145123.06D9D8649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/fetchmail:
 security bump version to 6.6.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7059bb9c432883b4397d18dabb2f24ac19a1e8a1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://sourceforge.net/p/fetchmail/mailman/message/59347909/

"## SECURITY BUGFIX
* POP3 with RPA: fix calculation of buffer sizes to avoid buffer
  overflow on long service challenges with long user IDs"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 183c52448d77586aeba30ca9e5b1b7a9342b144c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
