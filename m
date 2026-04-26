Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA40FFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF6842235;
	Sun, 26 Apr 2026 16:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9a79UxndVwy; Sun, 26 Apr 2026 16:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF584221F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777221237;
	bh=MzAhMScNMHUgrP7xHiIwnkDAHvUvtgW2jMPe3RLssKY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MNV5tI69DSIyHusJa99CWUTic5kyE7MvLsnw8+cwI0H3evqegQuhUk/YNqfnXjmd1
	 h4TW9+YnS7cYgo5hpyRsl7Q9VkrGReXdZOibpyvwDe4WgU82rahMEinNtzBou3+7zX
	 SWJz01S7b0gYSw/Yjmd9RjQUOsIKAUEIiQ5SCKBT5EWtqGVMS+dALV0/K6uKjr3VPr
	 n+v1kA0y4+YcTC0sfybFd6czD/QRczdhe7imlAj/oJ5dIU5rWNDyVv90Rf9q0LuC1f
	 1VtlxfoIpBF+MTXVgD7HPuJnTSmbVYGslW6/5O5K2DqyLiJr2PrP9nKVJt+KZkY3/U
	 VNsBvxHo5pJaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF584221F;
	Sun, 26 Apr 2026 16:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E5FE2DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F81D61C58
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWnA-jAh-Y1N for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B79610A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86B79610A6
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:33:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3970E836C2; Sun, 26 Apr 2026 16:33:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 18:32:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3dfd775b0084e3fb07fa52c75c15577407065e4
X-Git-Newrev: c1a34838b9f88b04a2bd18610056368c092ddd1a
X-Patchwork-Hint: ignore
Message-Id: <20260426163355.3970E836C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: security bump version to
 2.15.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1a34838b9f88b04a2bd18610056368c092ddd1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.news

- parser: Pass userData to SAX text callbacks in xmlParseReference (type-confusion)
- entities: copy children in xmlCopyEntity
- c14n: Fix Type confusion in xmlC14NProcessAttrsAxis
- python: Do not decref string after adding to the list (double-free / use-after-free)
- c14n: Reuse tmp_str, xmlStrcat reallocates *cur (double-free)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
