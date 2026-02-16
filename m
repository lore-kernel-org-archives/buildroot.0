Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565AEE83821
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B6782605;
	Mon, 16 Feb 2026 19:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzfsYdtSB_wD; Mon, 16 Feb 2026 19:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FC18249B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771268854;
	bh=k5Kh1zzIBWl0yFpL5vcAEg2kwId0lQmJvGwk5ATJWDg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CAYwZ2Hpm3tSdaOTGX3r3+vlTaRvgGhDlyZSdQQdF/EdhkOJ+f/6k2rO3gBM2zIsI
	 eoTJOG/hI2yVCkps4ea/Oi+s1x5Jn9IrktdP13eQkB3gYPBLbG2uzGkL9J69Erojxf
	 qFCfopy6BZdnmMA6GcgjtJehL5+JiXtlKYlvsvFbdq2a988U+3h/N/h6Q5wJU8d/OR
	 Nz27RiPPGjNM05Tng/PkNuqZovRZC6A4I6DTCNv5wtDCde8AcweHBKV9PgECsKrHat
	 GLDrfz/YKUuOdU3VJLi2fUw7oqDDH/J9/9UgJGoImt2v0W4krgHze7NKgDnUhN/6Ah
	 7O+QFMlUnLqbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FC18249B;
	Mon, 16 Feb 2026 19:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D4D7270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E87148237E
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtQg0baGPoAx for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53B3B81E1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53B3B81E1C
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33A86822E3; Mon, 16 Feb 2026 19:07:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 20:03:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: beabd8baeef37f1780f52e3c9d464c611731ba98
X-Git-Newrev: 53445ca6418779bd5fe27d3ca84e11116259e548
X-Patchwork-Hint: ignore
Message-Id: <20260216190728.33A86822E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: correct missing comma
 in license info
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53445ca6418779bd5fe27d3ca84e11116259e548
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

A comma was missing after the rfkill license, correct that.

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
[Peter: reword]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index af6044af32..7617041a46 100644
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
