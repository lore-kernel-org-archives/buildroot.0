Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F2CC02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56DB441264;
	Sat, 14 Sep 2024 14:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoVFRvUL1Mxt; Sat, 14 Sep 2024 14:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001CB41A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001CB41A5B;
	Sat, 14 Sep 2024 14:00:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6711BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97299606C0
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQEjkr-FCpNM for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9FD46073B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9FD46073B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B54D082B75; Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:54:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39b784bd5772fa14294b5da750143e5532dd68f3
X-Git-Newrev: edb2d45e058c58acdd2db135c056c5c253041b03
X-Patchwork-Hint: ignore
Message-Id: <20240914140013.B54D082B75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-augeaus: fix assignment typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=edb2d45e058c58acdd2db135c056c5c253041b03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua-augeas/lua-augeas.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-augeas/lua-augeas.mk b/package/lua-augeas/lua-augeas.mk
index 930cf49b86..8a7f2b5f7b 100644
--- a/package/lua-augeas/lua-augeas.mk
+++ b/package/lua-augeas/lua-augeas.mk
@@ -11,7 +11,7 @@ LUA_AUGEAS_LICENSE_FILES = COPYRIGHT
 LUA_AUGEAS_DEPENDENCIES = luainterpreter augeas host-pkgconf
 
 # LDFLAGS=$(LDFLAGS) is present to pass LDFLAGS from environment to the command
-# line. With LDFLAGS set in the command line, related ordinary asignment present
+# line. With LDFLAGS set in the command line, related ordinary assignment present
 # in the makefile are ignored and so lua-augeas makefile cannot not add '-L/lib'
 # to this value.
 LUA_AUGEAS_CONF_OPTS= \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
