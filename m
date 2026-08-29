Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF299C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 18:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85F644064B;
	Sat, 29 Aug 2026 18:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgWZcjQGaxaz; Sat, 29 Aug 2026 18:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788028063;
	bh=MdcYXhhdXXrufNx7RQWus66cridy0rZbNiYM0yH19Sw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=moBonVa3LXZKP334xlCbX8iNZfxhc9iMzcT/9dT6Zz7Bj8Uo1z9u4ln/mYYSzdhVN
	 Rx0X9+Xklj2rnftnZqGzJbF9opE6Gg+kEejcHzznu/smyhKFHs4p0aAbvoS1pZGE6f
	 LMqc1MBjjwT59hAmfKKwEjddrV6SkUDqpfMmn50uvEC+NT8KzXRy6J/oRmQldN7Yvd
	 HzMUzTarT5T/bFfI+w6EM+/TrU5bKvaEZrrrTzxgQgmInZJ/az2iY99PcBIBxc2d7O
	 LdESXqkN4u8CLGQMqxALHeTjGQd2KJwtuCCSzFNAL+qum03u1YBQN3BNQNS3hbrnH3
	 hnaPWCqgnH1pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C01F24072E;
	Sat, 29 Aug 2026 18:27:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C866A9D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE0694054D
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDKHQ1wucsau for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 18:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17487404FF
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7944692292; Sat, 29 Aug 2026 18:26:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 20:25:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fe2d74ffd1290422d0fb721481f4acd60d12cc0
X-Git-Newrev: 437a3632ca3b706252fb4a960d9a3923d6d69414
X-Patchwork-Hint: ignore
Message-Id: <20260829182643.7944692292@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.6.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/437a3632ca3b706252fb4a960d9a3923d6d69414
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/p/fetchmail/mailman/message/59381086/
"Fetchmail 6.6.7 bugfix version has been released"

https://sourceforge.net/p/fetchmail/mailman/message/59350877/
"The 6.6.6 critical bug fix release of fetchmail is available"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index cbf1ef2afb..023667e207 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59347909/
-sha256  ab0320fe4df0b5ee8659189e66590d9de96aadbf929fe59f353ae7a317e9ef1e  fetchmail-6.6.5.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59381086/
+sha256  bece8aaaa68e029eed9fd55fffd2adc7dd6cd5e9574d5bf92e2d9208bd97a881  fetchmail-6.6.7.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 9b3c035844..9d00d876d2 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).7
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
