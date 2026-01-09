Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1C0D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719FC82B97;
	Tue, 13 Jan 2026 19:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36sRRlW2RltT; Tue, 13 Jan 2026 19:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C4E383578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333010;
	bh=RWRyYkQKSwbDesZPu5a3DSjGo2mHlmGUYUo1Lu3ouh0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O82NPNLjJWt72zjkAB4IQTx9vBUPY/NR8mUWN7grXHP7LOxB2FARFwlljShB3Gmec
	 Xz69lbzSQADI1S4LrUaO8XyMEN4a3NiNGHgEVfIuGZU9cnqJxh38X6SqEjRaPPt9dv
	 ORJvNbCblFb9hPTtxlHFJE+b9m8nHjIw35rc7kDZc3xdESg2lUyGsXC8wjNXfybUDF
	 v0m+ZCkEIv+AE+7Rthef0KZeYhcgsDZpVpwRObGKUaIwFlcvb1S/VOgh92T12q48WV
	 oLVpasVxN9aFEoEmw9wO0h/177vP7pk2LPSn4b0nB1BuInM7duBdQ7Weq8pD9HYqci
	 cimfMY2Ka0vrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4E383578;
	Tue, 13 Jan 2026 19:36:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B9671C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04E024048C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1BnJBe6ISiS for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E189404C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E189404C2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BFB98854B; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:13:40 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3eac10574c6e96d10998d1675e75ba73456620db
X-Git-Newrev: b33e415990ab4e119bd2938c18321dc2a6dc3e66
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.3BFB98854B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ledmon: update
 patch to fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b33e415990ab4e119bd2938c18321dc2a6dc3e66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Updated patch following an upstream review:
https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b4668eded3d8087600f3aa67c2d354edfa7ce97e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...rovide-basename-if-GLIBC-is-not-avialable.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch b/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
new file mode 100644
index 0000000000..a205f41b6f
--- /dev/null
+++ b/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
@@ -0,0 +1,42 @@
+From 4c0477bdaef56314eb4df4a432be54cc49238be0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 1 Dec 2025 19:07:42 +0100
+Subject: [PATCH] libled: provide basename if GLIBC is not avialable
+
+If GNU basename is not avilable, define it. It is safer to use that
+rather than include libgen.h with XPG basename() definition.
+
+Suggested in
+https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739
+
+Code copied from
+https://github.com/md-raid-utilities/mdadm/commit/9dbd11e091f84eb0bf9d717283774816c4c4453d
+
+Upstream: https://github.com/md-raid-utilities/ledmon/pull/272
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/libled_internal.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/lib/libled_internal.h b/src/lib/libled_internal.h
+index 2355d30..2061fc2 100644
+--- a/src/lib/libled_internal.h
++++ b/src/lib/libled_internal.h
+@@ -70,4 +70,13 @@ led_status_t device_exclude_pattern_add(struct led_ctx *ctx, const char *path);
+  */
+ void lib_log(struct led_ctx *ctx, enum led_log_level_enum loglevel, const char *buf, ...)
+ 				__attribute__ ((format (printf, 3, 4)));
++
++/*
++ * Ensure GNU basename behavior on GLIBC less systems.
++ */
++#ifndef __GLIBC__
++#define basename(path) \
++       (strrchr((path), '/') ? strrchr((path),'/') + 1 : (path))
++#endif
++
+ #endif
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
