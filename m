Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF49EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD75684640;
	Fri, 13 Feb 2026 19:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7vEhzNrBvMr; Fri, 13 Feb 2026 19:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057A284558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011410;
	bh=aW/66w2P5+wd1Ibh47UmHXQ2pFB+3PW+2cWNdDpqgeI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EjjkESJNeYgX58OA+k1X7FBpk8G0/0u2MBSWN8dw2PyE50PC4dEX0JM5p81YeHl8j
	 BN9Z5AAiiTHflx295jQld17NSvQDEnJvipWuQYq8zag3KyHMjXcN+cEgv5U4kWVhl/
	 rc660KBLReI43UHzxMvuLPYsqnZb1zNEvOsd/lW2VoAPp7j1YSkS14SIi4BvD/wVbv
	 /prrM1lSCot9CjW+pLHLJPWVPLgZ00xUYT9KoqbX9Z/zuNqunJmXT8P+5re7C4ggPG
	 pCIdCuY9W2Rm/DbnOt1GrxAXBqoqB/vOClSup6cXB2kzYDBj0xqnLPYgedT/sgqCHD
	 2FMvgqDMYJxZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057A284558;
	Fri, 13 Feb 2026 19:36:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1104769
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B1E8844E6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvT_4Rr68eMH for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3976784548
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3976784548
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ECF381EB5; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:58:51 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d550a8ec49c5a0f77d28b614de6e8ca599b8d747
X-Git-Newrev: 5225221daa844a9fdf52df9a4fd5873811ce1538
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.2ECF381EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/safeclib:
 properly format upstream information in patch
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5225221daa844a9fdf52df9a4fd5873811ce1538
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Patch 0001 has the upstream information, just not properly formatted,
so we fix this.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Thomas: extracted from a bigger patch from Bernd]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c15b507838f7d7315610340fcfd1656a62e02cf2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                           | 1 -
 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b8b0935866..f2b8fc6c8d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -993,7 +993,6 @@ package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
-package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
 package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
 package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
 package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch b/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
index 3cb37b96f5..75f4c2bf90 100644
--- a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
+++ b/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
@@ -7,8 +7,7 @@ some armv7 buildroot variants fail on asm.
 we already probe for that, so use it.
 Fixes GH #115
 
-[Retrieved from:
-https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c]
+Upstream: https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  tests/perf_private.h | 49 +++++++++++++++++++++++++-------------------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
