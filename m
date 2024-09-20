Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE8EC78821
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C76742D1B;
	Fri, 20 Sep 2024 10:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHOLaVUg5yqi; Fri, 20 Sep 2024 10:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB1942D48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB1942D48;
	Fri, 20 Sep 2024 10:36:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8F4C1BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E065E4151E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PX7a6J0DeFxi for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E266414D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E266414D4
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97A1F84138; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:37 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 3f059c0d3c61bbd756a3aea7f74241b1b73cd4c8
X-Git-Newrev: 26585c72d1c259244b0ee6e4a42ef47e266e113e
X-Patchwork-Hint: ignore
Message-Id: <20240920103606.97A1F84138@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/lua-augeaus: fix
 assignment typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=26585c72d1c259244b0ee6e4a42ef47e266e113e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit edb2d45e058c58acdd2db135c056c5c253041b03)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
