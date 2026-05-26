Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895CACD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 18:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1837561063;
	Tue, 26 May 2026 18:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooGWy_gESVQq; Tue, 26 May 2026 18:27:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BA3C61051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779820038;
	bh=oA8o7xdcDH9s50JrBgUBHQL4N3ydtLsjlKBVb9WLAxA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lT8t2AFONbCmlt/PLhfg0v8Ypr349LP9qeTOwnOhrZilFMAimUieNLI6pFaYmOYsU
	 1aCOO0/xemyNy0xXsvxwVwCn8YVgmH0ewKcxTPD2I01vCpODxYIi9ChpWd5rixuNBb
	 1FJ0Wz2p7qAGGN/Wt9MnBWkrVp3wYVa9JUuOrY/azFq2nNTZskb0/73NCzvONxVQh1
	 /LnA5W34Ux81+3bbLhBCH6MBRkqgypaN67Bsu8Z1XRXbgU10LvM+TNTM1Im7QBuZAH
	 4BPmSfUOcAIhaUo+hNzFRCHngctx55bJqObBlTsiOSGKbOT5wjEoexMnHShygnJR9S
	 KLcMHAu6g7iFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BA3C61051;
	Tue, 26 May 2026 18:27:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08DB721F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3B8961051
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1Z-WVdx5jVw for <buildroot@buildroot.org>;
 Tue, 26 May 2026 18:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3493361050
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3493361050
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:27:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10A7E86F54; Tue, 26 May 2026 18:27:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 20:25:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a85bcf789d2ccc844c77a1c6238c53e8518ea380
X-Git-Newrev: f5ff9e3cca644ee9a8401cd3c950f80d8ea7b083
X-Patchwork-Hint: ignore
Message-Id: <20260526182705.10A7E86F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pure-ftpd: bump
 version to 1.0.54
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5ff9e3cca644ee9a8401cd3c950f80d8ea7b083
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/jedisct1/pure-ftpd/blob/1.0.54/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pure-ftpd/pure-ftpd.hash | 2 +-
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index b31afb2956..dfda62f0c1 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  329a1d524476d7a137dcf65af04ec79ddf1c225e2c4ac4a2e884663ef4897fa1  pure-ftpd-1.0.53.tar.bz2
+sha256  c2bef41f9635c3a87efd65f089c16ca5df9fd02db199d9fdcf12b206b93d41a6  pure-ftpd-1.0.54.tar.bz2
 sha256  b0bc52c61f9265bc00c509bd40dab60950371166b59416a1484bf226f480796e  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index bf2599ecaf..daf8e6eda8 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.53
+PURE_FTPD_VERSION = 1.0.54
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
