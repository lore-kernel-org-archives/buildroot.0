Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011D7D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F8B84372;
	Fri, 12 Dec 2025 07:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KT3gIQkokODG; Fri, 12 Dec 2025 07:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 454C384241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526316;
	bh=TqJH2iwJPqqaFUXOySRHyS5Ild4W8EE4z36ECg11zpw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JNWUPH+N5AX0J3vurvCjaS2CriWW07gtv83YOkf4kj9WBzqgGnn3pgxTS/o3I5cxI
	 acu8PR21UHMShf3Ctk4eRyGAGkkrMQNW0tm7M39Qb+DX+RXireAADlztzpGyHXxwNw
	 7OpzA/uoNKREHZu/uPM6zK5c2TNlVGm3QYtXwG/w/vMxFq71ydquzrop29Vm8m5ibi
	 YGJ7I0JY/CMmgIE0/RL8GIZT/60dfnHe1gmEqdd//xbFWQ3FPU3KogsQnd+bMJ6S23
	 vQ7YSF7tMqMUAlib/3qOd4NIwe+ChGBYpjNanL66pmUjbdgRGPafEqfwwiyTkrOHZB
	 irLkoWP0tb7jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 454C384241;
	Fri, 12 Dec 2025 07:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDD43E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C5B841179
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tj3IARU-VKTM for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DD9A41184
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DD9A41184
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CFC985C4C; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 20:14:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae7b3344d422154095cfd7efd9d106f0c74fc6b9
X-Git-Newrev: 51fe7dad2cde7491b23a9a120db9f58f498e98d4
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.6CFC985C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nano: bump to version 8.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=51fe7dad2cde7491b23a9a120db9f58f498e98d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://www.nano-editor.org/dist/v8/ChangeLog

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 714046414a..c8bdb0913f 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.6.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.7.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  f7abfbf0eed5f573ab51bd77a458f32d82f9859c55e9689f819d96fe1437a619  nano-8.6.tar.xz
+sha256  afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9  nano-8.7.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 183dc07e7e..ee82225a72 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).6
+NANO_VERSION = $(NANO_VERSION_MAJOR).7
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
