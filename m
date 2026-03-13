Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F3C107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 317BC8101D;
	Fri, 13 Mar 2026 21:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5nsb8MiLn10; Fri, 13 Mar 2026 21:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4996C81004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773437602;
	bh=o5VjOvpZzIuIYFLM0jUP4GOKHkWXXtvhrKAIa/ArPAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QAqWFCUd++E6i3YER9xVLxToTQmn+DEKnr4D++xvuwtgsCzHV14J7AuUpQANYIMGT
	 iFY6HFgAHh/xTSek77qgiA23DAzpiWubrLJgrPzWgbmI7W3Q1LeQtONjKuqfDhJdyl
	 9fvp78KY6di7TK7m92j3LQ5XOHNa1OwKeXizU7KGVGqjrNnb5appT6byCydrCdZFgw
	 b3dVN8+lz41EPZ7NvgSK4Bt/2HkthgEmOxopxLUcM4UvS4V+FHqcDLvSTMkaUkKL+Z
	 F2kkzX1WXAmIsNRbkrZL6jNzoJ9kjJiJSYKmnhR8QMtHnKZpoohbJstlltuocQnEvG
	 uU+rsCX0cIOJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4996C81004;
	Fri, 13 Mar 2026 21:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 021E5786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C5C60DF4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPxxsQYKlny4 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3849E605CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3849E605CA
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:33:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69AAB87044; Fri, 13 Mar 2026 21:33:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 22:33:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9cdca48a57f24f2babb8f72652e099e08a59cd5
X-Git-Newrev: b2ca7b402db5767d88008e961c1beeb6d8fc7d8b
X-Patchwork-Hint: ignore
Message-Id: <20260313213320.69AAB87044@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.13.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2ca7b402db5767d88008e961c1beeb6d8fc7d8b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ccache.dev/releasenotes.html#_ccache_4_13_1

Updated license hash due to copyright year bump:
https://github.com/ccache/ccache/commit/91a090aa0295b9c55cda1bda7b048d77c65400e6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ccache/ccache.hash | 6 +++---
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 1c666c9293..d408836c4e 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.12.3
-sha256  c8e3ef79531966ecfa05bd1666c483b473df9af00896935cc468cb5ed573c16e  ccache-4.12.3.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.1
+sha256  85638df95c4d3907d9dd686583f2e0b2bd4c232d36e025a5c48e91524b491c4b  ccache-4.13.1.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  afe4bea7c75355e3a1c7bf6eec6f95fab01f2e8116d8e495e5af4c3a45513ae9  LICENSE.adoc
+sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 30f87f7d90..1f12123164 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.12.3
+CCACHE_VERSION = 4.13.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
