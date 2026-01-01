Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0D2EEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A674F812C7;
	Thu,  1 Jan 2026 17:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FdpaNpbklbP; Thu,  1 Jan 2026 17:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82775812BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767288198;
	bh=hppUGSWRa7ZtTBR47gqiQRqUqQtVp8yIiAlNZSoFpSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WPH0RBpke8DZ1IkrrgsvbXV6VvddWjB2TbWtIYIeMphlWqDXvE2iW5fR/DM4CHm97
	 Zsc4TLTW7hnAGyCZOk5jUXatvPU2x1ppSWMknrTqNhB0jJArVvHRLHScoV1jy+H3gL
	 jL4vYBJVCUrvkk8UMSVZeVd6fooeHa8lVlWt9I1LN1gNhSfQi2zFq159JhVxHJQdZA
	 yZOpo3NrxCKHIyASM+HhGHx2Y5bMAZUW6sdIe03Iet5h7yIjj4Rtbrcm8xA3+mfoS+
	 ioogskGlQ2AMIirKTG5GTxPj0u/p6AcX4Agu4GpXmW/QJbxD2CmypZo+SugyCF1H8Q
	 FYvbSg0e5jJrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82775812BD;
	Thu,  1 Jan 2026 17:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD4BB351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9362060685
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TzdJGXkAalz for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E0D6067D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1E0D6067D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:23:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB27E87E3A; Thu,  1 Jan 2026 17:23:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 18:23:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33178c538541be224e49b5f548bd5404de3912fa
X-Git-Newrev: 04ca5dc2cd3844b24a75d382c9374c27fc136415
X-Patchwork-Hint: ignore
Message-Id: <20260101172315.CB27E87E3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpulimit: correct function
 signature to use named parmeters
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=04ca5dc2cd3844b24a75d382c9374c27fc136415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
