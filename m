Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEF2606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FpxpQYh7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10DD380AC8;
	Mon, 26 Oct 2026 20:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puBngoVz8kjD; Mon, 26 Oct 2026 20:22:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1EAC880BE9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046176;
	b=A/rQFgAwAbFupCNVNXteb/KBhMwPeIrwz3NH1HN2EyXDlMfXRmGompUtyafT4H1EjR20
	 Si65OnP/Grxmj/jS034BDdxRe7IC3BtcIkd6Xc7pUR8wmJaS3y/7H8wdU79OT/J5tC8Dx
	 hr2kO3sm3u1imQbzJZwx7Rt79nJ1WEeKRvH8YvL2jX36E9jUG3sxxMuDZmpRKPCNdiD5T
	 cmmHPs+5nYhOFt3L+GDVs+4klXQlwZJT+CgkRnmiujWi0RMboZ0h5bTbhsTuZEu0H+tOU
	 rlQINQI6gdK8+MgBoQZA2XFvOPhjvidMTKn5i+qrEoUJc5UhRPV3cUH3LFV256dvEQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P7DHMbkH++8qucFLpIR3CWwlbNvC2VF86Z/u5w2SpX8=;
	b=nUj3TqXE33xuMl4hYIwV80fXuABEfSU4YuAEvF3rHFyqyhsz/wD3zRnP29sZO0JCZGRi
	 FzlxXpjO85FGJ0nF6DEMegIyXJQbgnehnrfYSvqmsIVTN2OMHxjBQwCUQYDMVstHq4atr
	 lUgS0aT2tNjUIf3QYGPilaNkk6GZVrLsVr6GieVsi2or0+0WsTxvnagzYsAsQZ6iyFb1t
	 r4UGm03AOkSkjb6lvD07Z8jKd6iLofoT7jMEXzPTjF6ouz73Gst5AE1930d3hPuiu2h2u
	 +1WnShSYnAV5UTPppXAulh9Bv7mcxmH0ENii+uWl2+lLJYlcdIDiEtj21xWzIS8uJjw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046176;
	bh=P7DHMbkH++8qucFLpIR3CWwlbNvC2VF86Z/u5w2SpX8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FpxpQYh734tFrorKEFGc7atL8pyvsBNN3DZ4Y5wnwvaOpAXN/zikZByP4d1zdXs6g
	 J5mnNuFLBLJ+c1xTmcr+bX71sn5pMFDKvFZrSKzw6Lmoiiy7s7+JuSPdxcXKgxe/g1
	 kMdpbxik74uceUn1gEsxJeFztBL9u5lLp6pJkibvVR8EA3hVV0k/xRhhCCTOQp929k
	 HTpOVr3BUgtbTZUMX7SYZjAs6j7Ynuzilb1VLc9SGDUOFHw8XaRzKFgUmIiJI7lamj
	 bIoFNJw1YhZlH9pW4oQWnoIe2OWewlZy12PB0uNA9VUKLKyvqHUNxvaQaS93s4/sQu
	 HyDw9q1MZwuMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EAC880BE9;
	Mon, 26 Oct 2026 20:22:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EF6C2F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147C240647
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub3_D-2UYQam for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 648C14063A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046174;
 b=E4wwcO9wvw+gWJTa6IEHhFQAGUmLiz1c0cMgJgVh1B9LU9i1PhSO7E5W9nv2FX9uH+AB
 l1PDOBnCZgW1YSaMZJYkHLIeLpmDe7DXLDK5QN217Dkt88Ghw9ZKkgZBUXlmzJ1A+1RU4
 4MWvTArRcexL673ALKJIW4WZJ6cWVbQ/H8gOWnncDLSI7FbiiMDG0hyBPmmkYB3yaSbf8
 EJxEe88p74unKxwq7gPaMxDhQDS2TRHgrOSfeZgcFauH4RCAoJ+nv1lyrC9VI6RpokWKo
 ForPWthKXu/eCcjZ52XpkTgVlGWucGCnmecougHqTS0ICRfZwtwXXQdQQj0lfVxPhmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046174;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F4K+qHUM3F78Xz+wsobISnUGsKa/xVr9ZLF60Q+/u3A=;
 b=FA9a1uak4FHhzcTeywa1odZd3yKhQFOVq+YT7UT9IKn6E1aFolHyhTUlGkR7SFfcrtkR
 1fPHk1CcUMZGPZEV1pVJH2jnr2v/xonwFohhnw4aDY4M9V8nziWX1gy/3l5SNKSTtl/WW
 i1S6OaDim+YZ2SQv5xw33t6zzEOUsGWUcLPOZV5dGGIfOEhrcIIJ4Psnu/mku8qkx60TY
 MB7epf4a+iwrMs0eStZfdlf8q6RMYj2As6SpJRk3yKp8hnRI73Ft6Anl43tUF+pdUhvH+
 IeZeLFGGCgvHnZW7HbrxYfTVu/Ipqn/1CJ4KW/1DzneTaiKGmiPTLpxrO0vbsX5glCw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 648C14063A
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 489719CFEA; Mon, 26 Oct 2026 20:21:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 21:05:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7874e2a772ab9f1c801c2f4cf6281bccc16d5c4
X-Git-Newrev: 2d9a90578aea2abc970656c07d2f5436ee441b93
X-Patchwork-Hint: ignore
Message-Id: <20261026202128.489719CFEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlb: bump version to 0.3.29
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d9a90578aea2abc970656c07d2f5436ee441b93
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/hughsie/libxmlb/releases/tag/0.3.28
https://github.com/hughsie/libxmlb/releases/tag/0.3.29

These releases bring query speedups and fixes for reloading a silo.

The zstd option no longer accepts the deprecated true/false values,
but we already use enabled/disabled.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlb/libxmlb.hash | 4 ++--
 package/libxmlb/libxmlb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
index a7a0c53be1..7d18c22fa4 100644
--- a/package/libxmlb/libxmlb.hash
+++ b/package/libxmlb/libxmlb.hash
@@ -1,4 +1,4 @@
-# From https://github.com/hughsie/libxmlb/releases/tag/0.3.27
-sha256  63fa0275f7454d77c10e0af37f79dfdb071821caf429a57dbd9598ea3a9defd6  libxmlb-0.3.27.tar.xz
+# From https://github.com/hughsie/libxmlb/releases/tag/0.3.29
+sha256  448294be33bfae62f00fa66e506f1cae80237ce71b7ab6530aefa75005eeb08a  libxmlb-0.3.29.tar.xz
 # Locally computed:
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
index e9829e4c4b..8384876ecd 100644
--- a/package/libxmlb/libxmlb.mk
+++ b/package/libxmlb/libxmlb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLB_VERSION = 0.3.27
+LIBXMLB_VERSION = 0.3.29
 LIBXMLB_SITE = https://github.com/hughsie/libxmlb/releases/download/$(LIBXMLB_VERSION)
 LIBXMLB_SOURCE = libxmlb-$(LIBXMLB_VERSION).tar.xz
 LIBXMLB_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
