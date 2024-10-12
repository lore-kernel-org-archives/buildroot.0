Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5601CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B1561574;
	Sat, 12 Oct 2024 15:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLylm5kBylHI; Sat, 12 Oct 2024 15:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C1A6156D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C1A6156D;
	Sat, 12 Oct 2024 15:08:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A85F1BF8A8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDABE60698
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXr1TMfWJpae for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6BE16069C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6BE16069C
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3AC080795; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:40 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 26f24e2f7aaba8286e0de8295a0c95c0844bfabd
X-Git-Newrev: f909812eb8c69a19145549fb4b0b71d7dc053bbd
X-Patchwork-Hint: ignore
Message-Id: <20241012150800.A3AC080795@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/supertux: fix
 'according' typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=f909812eb8c69a19145549fb4b0b71d7dc053bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit b55759c516b6f18f30b9e0bd185b414c56a62df8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supertux/supertux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index 3941632f51..ef930b2fcd 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -58,7 +58,7 @@ endif
 # context-sensitive by cpp.  SDL_cpuinfo.h is included by SDL.h.
 # Including altivec.h makes arbitrary code break."
 #
-# Acording to a bug report in GCC [1]:
+# According to a bug report in GCC [1]:
 # "You need to use -std=g++11 or undefine bool after the include of altivec.h
 # as context sensitive keywords is not part of the C++11 standard".
 # So use gnu++11 instead of c++11 only for altivec system.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
