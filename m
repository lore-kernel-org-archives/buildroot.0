Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D76E95A62
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 20:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBB941B99;
	Sat,  7 Oct 2023 20:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CBB941B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4y8c2Q_XD9N; Sat,  7 Oct 2023 20:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4663341BA1;
	Sat,  7 Oct 2023 20:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4663341BA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC3461BF3BD
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB3F441BA1
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3F441BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dI9jqkWltrX8 for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 20:56:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA0B141B99
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 20:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA0B141B99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E0B084229; Sat,  7 Oct 2023 20:56:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Oct 2023 22:52:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53d90b74f3ca7c258e6c34e768138703f5286345
X-Git-Newrev: edfbc27fac56ccedc9e67684ca491c232f2a93d3
X-Patchwork-Hint: ignore
Message-Id: <20231007205658.8E0B084229@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: drop leftover comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=edfbc27fac56ccedc9e67684ca491c232f2a93d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b574a9606e62 (package/erlang: do not hard-code the Erlang
Interface Version (EI_VSN)) removed the need to care about keeping
the erlang version and its API version in sync, as the latter is
automatically extracted from installed files. The corresponding comment
was removed in that commit:

    # Whenever updating Erlang, this value should be updated as well, to the
    # value of EI_VSN in the file lib/erl_interface/vsn.mk

However, the removal of the comment above the package version was
leftover (probably because of a conflict with a version bump that was
improperly resolved).

Drop the comment now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/erlang/erlang.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 29e2b74cbd..1600b59381 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# See note below when updating Erlang
 ERLANG_VERSION = 26.0.2
 ERLANG_RELEASE = $(firstword $(subst ., ,$(ERLANG_VERSION)))
 ERLANG_SITE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
