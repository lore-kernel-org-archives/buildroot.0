Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B56D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5835A60DED;
	Tue, 13 Jan 2026 19:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-F-Sy5WJjdY; Tue, 13 Jan 2026 19:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F009A60DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333057;
	bh=FEmirzL9YnDZ3x3RaFsLj1XDfOGCkT8IUdtjZ52STxs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ft2Fy8Dz+XDX26X7uZpxBMslMHJmbt+Vq9J0XheFLoADsYuaLJ+nsLb+MNCFVUCSO
	 Hp14MZ4PS1x3Y3wKL9UXh0PwPmh5xHoZJWmQO6/vJxMLrJP00AyJzdsI0LZCcEKSDH
	 WoeljDlRriDRsOETIGZ2CzS/7nXszCPwTt/43U13B3+/cYf3xEd4mYnW2hGPOz/hi8
	 wQ6ieBYIxKCPI6+xT1NJLb/C+eqtHQZkmsP3Lu9YeRQl8FDCSU+WONtn3qn/72K+SE
	 ybpdW0eLzyEJ2kCChgdgU7Wrwh7foa712ZAmNyzKTBVivC5w41tkvgyKnoNiWhl0yF
	 MqSXJpV+ev3Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F009A60DDB;
	Tue, 13 Jan 2026 19:37:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14136231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CBE340557
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGeqmgNmxKDb for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A9484052B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A9484052B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A08C86184; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:40:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a804a6975ce316ebbc6d23a3523e06fe299c00f9
X-Git-Newrev: c30b55858ae5d04651b56a429342d056a477acf6
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.1A08C86184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpulimit: correct
 function signature to use named parmeters
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

commit: https://git.buildroot.net/buildroot/commit/?id=c30b55858ae5d04651b56a429342d056a477acf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Update 0005-Correct-loop-function-signature.patch to include a named
parameter otherwise the following compiler warning turned error is
triggered:

busy.c:6:1: error: parameter name omitted
 void *loop(void *)
 ^~~~

Interestingly, this builds with GCC > 10.x, but fails fails with GCC
<= 10.

Fixes: https://autobuild.buildroot.org/results/8592e4eb5959124acc885a1cbc2f9d24fb7bcbd1
Fixes: https://autobuild.buildroot.org/results/cf12d080ddd7a2398a79be430d935071ca3250a3/
Fixes: e63181bc0056 ("package/cpulimit: Backport fix for function signature")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 04ca5dc2cd3844b24a75d382c9374c27fc136415)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpulimit/0005-Correct-loop-function-signature.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cpulimit/0005-Correct-loop-function-signature.patch b/package/cpulimit/0005-Correct-loop-function-signature.patch
index 5b7f4a01dd..5b44ab9782 100644
--- a/package/cpulimit/0005-Correct-loop-function-signature.patch
+++ b/package/cpulimit/0005-Correct-loop-function-signature.patch
@@ -1,4 +1,4 @@
-From 74e95c96e8d82e4e374f86142972fcf4305fe1f2 Mon Sep 17 00:00:00 2001
+From e94b6dd7b3ca884f72f02879fd85792a3aee961d Mon Sep 17 00:00:00 2001
 From: Florian Fainelli <f.fainelli@gmail.com>
 Date: Wed, 2 Jul 2025 20:47:58 -0700
 Subject: [PATCH] Correct loop function signature
@@ -23,7 +23,7 @@ Upstream: https://github.com/opsengine/cpulimit/pull/127
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/busy.c b/tests/busy.c
-index b3afb7cd853b..93f0bcce67a8 100644
+index b3afb7cd853b..8acbcd82e04f 100644
 --- a/tests/busy.c
 +++ b/tests/busy.c
 @@ -3,7 +3,7 @@
@@ -31,7 +31,7 @@ index b3afb7cd853b..93f0bcce67a8 100644
  #include <unistd.h>
  
 -void *loop()
-+void *loop(void *)
++void *loop(void *unused)
  {
  	while(1);
  }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
