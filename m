Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDFFCD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E0E615D2;
	Mon,  4 May 2026 14:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUfZee34fXcL; Mon,  4 May 2026 14:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE7C615C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906141;
	bh=xS0CowYhBO36FRWVQ8M1yBPRrgpNmm3sFI7FOs/7ixo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HQ7lfAIHvbO5yBw7TsVKSgjoXsBvhQQhJDmmJD/wXuZLWaxV4dY7lv+YpNh3vmI27
	 Aw26Uc248vJmrfC+RMlChcZcnBJG604QvlflJ4h2aIX4QO5fX8UOqiRemtCbDAGxJT
	 dX78y3vQr7eNpkWTxlM1oI29sbhZ/0L4dxCYMWKP82ccPszewBZtzdnXqMJk+oV3rl
	 sX4SVOdmHbOUbCnzSC4/m7m25T3EyVVAhj5LUIN4SLBNW8YXxX5OTeESdGOjW/GDdR
	 dkbnWyPPY32xKlfVlgaSpR7HhZg6tw4RZuiVuZPnDN7Hpoo8mijQLe/Qb3I1gtTPNY
	 zh/5C3fkB9QDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE7C615C4;
	Mon,  4 May 2026 14:49:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E39E25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04DDF846D2
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6TIuHPT9AVf for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E1B846D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33E1B846D0
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B66C8435A; Mon,  4 May 2026 14:48:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:10:35 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 0a6eb135425d68559ded1d7a6cc9b7ea34179d89
X-Git-Newrev: 72be0787299cd5be0cb91c0f29db2c2d2bbfb245
X-Patchwork-Hint: ignore
Message-Id: <20260504144846.0B66C8435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libxml2: security
 bump version to 2.15.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72be0787299cd5be0cb91c0f29db2c2d2bbfb245
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.news

- parser: Pass userData to SAX text callbacks in xmlParseReference (type-confusion)
- entities: copy children in xmlCopyEntity
- c14n: Fix Type confusion in xmlC14NProcessAttrsAxis
- python: Do not decref string after adding to the list (double-free / use-after-free)
- c14n: Reuse tmp_str, xmlStrcat reallocates *cur (double-free)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c1a34838b9f88b04a2bd18610056368c092ddd1a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 35c8810ed9..849d70cbb5 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.sha256sum
-sha256  c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d  libxml2-2.15.2.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.sha256sum
+sha256  78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07  libxml2-2.15.3.tar.xz
 # License files, locally calculated
 sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 0a365fa689..c1b5c4033c 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.15
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
