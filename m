Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B41CCD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FBDD41A62;
	Mon, 15 Jun 2026 20:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQiMqWlsS26G; Mon, 15 Jun 2026 20:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3272441A63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781556623;
	bh=XHqd0A+pszgv4JW9YgHjlFXKoIjgCXzirx2NcK4aJPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fi/q1FLzP4HZyba6M4UKwygEBkS19Hbl8OHXzTxznjmIT+xmSLDfIKWJZU4adYcJn
	 B42Ybg8zAPqblrbbuAZbg5pJhQs0w+3SMcJ1ksBemyfdMwd+YvxXQ8OgPUdeRQnFvS
	 qjvchiB/Cp9JqB8uHFF4B+dry11A/mBzss2nESqKJpR3WI1dtBstLWcRAjEZpmby3D
	 D2QixB21XCHWzLl71Lxpiv+mm+nL+7l/XVxS2qfGUBaLzvARfkGJsm/j74PqwvEB7Z
	 Sen1adOdqLxF8m6xN3Sg2YdCPf3OPYrhMm0eHUQXloHNvrZh5iFhxtuVqTILkrDaTe
	 +RTYlcuvdttcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3272441A63;
	Mon, 15 Jun 2026 20:50:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9D4A2B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F71D41A63
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHq5ZV68b7dI for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B43A741A62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B43A741A62
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:50:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E29E97FE14; Mon, 15 Jun 2026 20:49:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 22:45:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b18cdc3dc52ca23dcb906a0d26b658cbfdf5acf
X-Git-Newrev: 6ea98e0f1e4ee96fe7d87e972acae53355a41318
X-Patchwork-Hint: ignore
Message-Id: <20260615204959.E29E97FE14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ytree: bump version to 2.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ea98e0f1e4ee96fe7d87e972acae53355a41318
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index d986b68518..1fbf7eca73 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2366d2d5fc1f644460323863e5be9974584bc9b2d66d7247165a8ff1a0991114  ytree-2.12.tar.gz
+sha256  caeeeac334dac83921bd8b657ad2d4cf234c15da4ffc7d15dad0bda99e52f197  ytree-2.13.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index c597367f9a..cdd16fd3dc 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.12
+YTREE_VERSION = 2.13
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
