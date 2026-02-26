Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26A5FD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9B460760;
	Thu, 26 Feb 2026 20:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tpz6lmU64Dar; Thu, 26 Feb 2026 20:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A7B860719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138733;
	bh=HeJec3ci1pkkX9kVbPv2+/lHRkcejMcGbTuHz4zKF5s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MQqtb9BlEQCuSpWKYhyf6IZBJOQVznddzEIinIsL6cqd8A71ALKGqBhGjEF/z/lc2
	 DGkt61VZqs2fpJrVvUF5dMFwluckSYjfFWls989TkR1cGcW1JzBExL0EBcc3d8C9fs
	 3sBPjtTIuilLizG+K/ZEmOrlbaY3WsM1QF0vCsrJx1pGgkiUH2D8588aHbmM7mtma/
	 dVI6UGQC63YmesypXoFxFkzMsVKC4phCveEfF379AOekFWVVVIy/zo01355l7kO8Nl
	 P3Vf+msXUuHGHA4nttpZSjooBxy1aqC2jFXWQpJQgcDKgXs+q8FUiQeSMdF7MMeMb9
	 WtRNWeFnBWV8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A7B860719;
	Thu, 26 Feb 2026 20:45:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 869AA23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7805181199
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtLjW-lTyvKy for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B239F81191
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B239F81191
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C4BB8755F; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:21:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ac9c499ca0c1e1b1a3ddb64b7a8a10c4f2191e89
X-Git-Newrev: 4e8eca18c27a4d55d781fa272b3486bdad03b12e
X-Patchwork-Hint: ignore
Message-Id: <20260226204529.9C4BB8755F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/util-linux:
 correct missing comma in license info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e8eca18c27a4d55d781fa272b3486bdad03b12e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

A comma was missing after the rfkill license, correct that.

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
[Peter: reword]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 53445ca6418779bd5fe27d3ca84e11116259e548)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f43a1a128b..82448d97f0 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -21,7 +21,7 @@ UTIL_LINUX_LICENSE = \
 	LGPL-2.1+ (libblkid, libfdisk, libmount), \
 	BSD-3-Clause (libuuid), \
 	BSD-2-Clause (xxhash), \
-	ISC (rfkill) \
+	ISC (rfkill), \
 	MIT (hardlink, flock)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-2-Clause \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
