Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0875CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC834613E6;
	Wed, 25 Sep 2024 18:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXPnFmkPbXcB; Wed, 25 Sep 2024 18:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF45613DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF45613DC;
	Wed, 25 Sep 2024 18:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5311BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1006F611CB
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0hvDmNIRmoD for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B98611D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56B98611D1
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53F16844B6; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 20:47:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c4dd46791dfa7f599d132d2d6f00f3bf57fd081
X-Git-Newrev: b55759c516b6f18f30b9e0bd185b414c56a62df8
X-Patchwork-Hint: ignore
Message-Id: <20240925185457.53F16844B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/supertux: fix 'according' typo in
 help text
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b55759c516b6f18f30b9e0bd185b414c56a62df8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
