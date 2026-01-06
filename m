Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400A7D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15C8482218;
	Wed,  7 Jan 2026 18:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_8OZjgt6TaF; Wed,  7 Jan 2026 18:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A1F82965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809000;
	bh=Trxu937udYCJOzGkjpmmggkUDgGApzN1q9eZneNTx3o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UULj1ho0EZIsYALW9dS1hyaz5G7zT4aZCh4kZxJfsjFlqfr6Fpgu8iK9YcNVzbfO2
	 0ufJp4IQVBjbsZEe2mEiFOqtA1zesS5GB5yGuH+eQcGbk3/wHVw03rYpec+ALdrrnK
	 z2lxCW7zvPsD0KE3mVqa1vrUz8Kemct64r/1vjKl29kX538ApeCPrhFPypzpGg8m7K
	 0ZaiwFL1boV4pW6i6yX0Mz98fgmcswBsS4TuPFYvX0L/gr7LhKcadvkr5dD7WxSSkn
	 k/5pSzQp8mAsq0pNEA0sInxfPcqEYTE9n9pLkFA29NdbyhO6BVxRQNaRMC9fnUxlbA
	 nYZZttuMKVxig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A1F82965;
	Wed,  7 Jan 2026 18:03:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0228025B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70EF40A5E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fet3BcXjMfsX for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A94E740AE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A94E740AE9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A879781F75; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:09:22 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: cf87779694b7b6982c8aa948be5d86b33870f5b6
X-Git-Newrev: 3315c0d2c659b15fc87d70c788e4f38c319a184e
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.A879781F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/sdl: fix patch
 reference in IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=3315c0d2c659b15fc87d70c788e4f38c319a184e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the
`0003-SDL_x11yuv.c-fix-possible-use-after-free.patch` patch reference
was renamed.

This update the reference in IGNORE_CVES accordingly.

[1] 9fab7bb79d package/sdl: drop directfb support

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d372b654a45882f641ff65a4acf7126e66c35487)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sdl/sdl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 439c30b2a5..29697fe3c9 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -13,7 +13,7 @@ SDL_CPE_ID_VENDOR = libsdl
 SDL_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL_INSTALL_STAGING = YES
 
-# 0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
+# 0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
 SDL_IGNORE_CVES += CVE-2022-34568
 
 # we're patching configure.in, but package cannot autoreconf with our version of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
