Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F266070E46
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ixBrpO5J
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7611607D5;
	Wed,  4 Nov 2026 20:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-eF1jyTfwRW; Wed,  4 Nov 2026 20:08:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C914960790
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793822914;
	b=Znf8pmi5oPZvSEUsrQZbwWEiT4BQ9ZyZUNArLh4vBrSCyYXYdZbPnvZ5YRxbuu/c3pIY
	 HTl6e5gAMejLCI3wzx5IK+88VZmJbMzpZEWNiLHdyzhMc87Hq98ddCXZCXI2Lhzs1roor
	 zLp9eAZcWiPvcw3qmciJPE5Y6okuwDuW1VIaU9bucvG1Rj0aVxzoHICYoOpechNqzLZtw
	 OWSxk3Wz9Lb8W/2HbKRBG9ixIHS64QSRk3siaa2SF35M/NEEWkFlHcZ4cCv91cNjvFU37
	 VfM5fOEanVv/m/E/hnrEj8wqGbhx9kt/03VKWoaFsQy5WA1OeQA8OjwDHY2N5FIgpOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793822914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n19p6XE9FnaOHEgXgeNDRjbsJtZKrwz/Rbv119W/uvo=;
	b=mYMnnIDb5f8jEF1bt/xCfzpYuBLuTvbShC/wpOBFjYZlZGl/x1P7u+V8H2gqBk+ZLf8g
	 whD51sG8nQbPYpSF99f9sFVZl3UPt0XgRaHQXEr9DvZLUSYcIuoCFq0Mx9Ak/3ivOFlWJ
	 t8fua8vAE/7BwzQ2l0mQ7W50BEcFJhh8iGg1Ox8XeX2LDQTP347pNS17ZMx0ZLj2NjgXC
	 yIM0K+DT6R5gYtRPbfHNx9aqdxrmttLvj/u0KrfcBK7zw2/TLBNzQ5O2jiXtMFiV3d0J9
	 TGH+FSz1d4JsGivOGxm2I26Sp6JI7Aqs+WexpNJI+uP25nFPQ+arhFpYwCpNrPRMDMw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793822914;
	bh=n19p6XE9FnaOHEgXgeNDRjbsJtZKrwz/Rbv119W/uvo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ixBrpO5JB+iH+gZoaZPUEjugzV20sdtoPhgjQXFoL4/Pj72rALUMwS6wC5111cIWN
	 YWG5YT+82m2fp0pH6kCUb1hd8fFXySMxbSvAR4j7GUlxcwI1HLmoOYBgYp4ChHUAJZ
	 Eh9UhYfoJ0XobpvcRHMcCOL6dc+Du/lXX+ol+MoQtBxZIJDMr9DLsdMltkHzK1tPBA
	 +4mhA8fE/5EjDLLUkeGncIFjj2s7VQ6Qnns4oAIPrZxheQ15C/JLuNZuetZhf0spm6
	 RFy5rNko1HbKsKX7TslXCK+LpXOwnJ0jYTbiP6MWdrwJxGfwKz0/XrLdf8sa/F284a
	 1Q7P9+f9dHk6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C914960790;
	Wed,  4 Nov 2026 20:08:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85948D3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 775A840062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KW44kCTBZVi5 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:08:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AA10B40083
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA10B40083
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:08:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B30B39DDA4; Wed,  4 Nov 2026 20:07:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 21:07:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40f85148f29ff1de220a235249f0251cbf15258e
X-Git-Newrev: 2ed88525fe8b5f6077253dc5ec703fa53a69b5c9
X-Patchwork-Hint: ignore
Message-Id: <20261104200701.B30B39DDA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmod: bump version to 34.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ed88525fe8b5f6077253dc5ec703fa53a69b5c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 34.3 (for details see [1])

[1] https://lore.kernel.org/lkml/auSsJsiiuE97DA_M@rpl

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 032f96adfe..c021efc1c7 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54  kmod-34.2.tar.xz
+sha256  985554de49c21a58abd68c6cda2251384e1e5bb08b3b14c7f02b51f4c90c2958  kmod-34.3.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 4bd64f8456..a42b6daada 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 34.2
+KMOD_VERSION = 34.3
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
