Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE71C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4FA540A5C;
	Fri,  7 Aug 2026 09:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRL5rlMTJDhV; Fri,  7 Aug 2026 09:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A280840A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095342;
	bh=KG4ZKwmFC9F5RAsXIggML42JGcg4fFcp8tdiT+XmJ1M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IyCXx6T3y+bNgKYWHOCz1zh3UL96Z7S/6AfJ94pjHJRPc0KfiKmGi8/DqvkGd6FyW
	 v8ztyp9kuxL6dAgSrNzE1vi61NktyvH3nqcSc8rpAgWng3ESMhGz1jQsxx+byL2Ztr
	 sSMsPhfUMJgBf1n8251cjm+fzQxmPLFOQzmQW2TO8U8JLBVPOtZf/8DLj0I5IWRMkt
	 2kKOEoC7D/74fYbH2dGzDUo6VKx080fYpt0H+o2sXaXYQAGrKFvVb04A0NTKxzBClZ
	 CcTIP9Ex3iwPpTZpmQBujHhGTXEB9I6Sb+IE/Hs8WYQNM3cbFTPo8MGjkwN1C7z/Om
	 8r5LcYAreybPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A280840A4A;
	Fri,  7 Aug 2026 09:35:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6AD1282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D92624019B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zqeq_pmNLxsY for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE06E403D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE06E403D8
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63C398CA42; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: aae95fb47dadcb4c121be22a8d7998748cf3f49a
X-Git-Newrev: 66e1be310b3a6638e4625dd507f8fe9b05b99e5f
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.63C398CA42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/openblas: fix
 build on mips64 n32
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66e1be310b3a6638e4625dd507f8fe9b05b99e5f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

BR2_ARCH_IS_64 is set for mips64/mips64el even when the n32 ABI is
used, so openblas was built with BINARY=64. Its build system then
passes -mabi=64, which conflicts with the n32 sysroot:

  gnu/stubs.h:35:11: fatal error: gnu/stubs-n64_hard.h: No such file
  or directory

For openblas, BINARY refers to the pointer size rather than to the
architecture, and n32 uses 32-bit pointers, so BINARY=32 is correct
there.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fd685fc8c2c061641e94bff8f5db76d49be6a18b)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/openblas/openblas.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 9a3bb42496..a5bf68f699 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -49,7 +49,9 @@ ifeq ($(BR2_STATIC_LIBS),y)
 OPENBLAS_MAKE_OPTS += NO_SHARED=1
 endif
 
-ifeq ($(BR2_ARCH_IS_64),y)
+# mips64 n32 is a 64-bit architecture, but with 32-bit pointers, so
+# openblas must be built with BINARY=32
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
 OPENBLAS_MAKE_OPTS += BINARY=64
 else
 OPENBLAS_MAKE_OPTS += BINARY=32
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
