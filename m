Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56080C5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0892381219;
	Fri,  7 Aug 2026 09:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtljDCEc8Lrz; Fri,  7 Aug 2026 09:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21FFA811F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095233;
	bh=mlHG15w7sy3ZCfsUtDpMabW8fpWGvT6+huqTcjVfZB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RB5MDi/VcBhgQ4JsZJ9ikv0Wi+6G6fZBGS4dr7FHjcxy6MxWviOu8m28TYJGy4o/E
	 9+GsmGQuogXQ6GlNmAmoc7EgO/fjSPy5eQAkISPEAjDepMvxyFlK5dXpPhdgp8StGy
	 YJdL6ZtyiA/XN7QTIlthQox0IHZd76lEC7Vt/LEP73CtS4beVJARhUjFVhDmk3VIe7
	 FchQQQ7eM6xF/OcL03wKd/DA4MkVj+Nak35Eld8NSKhOffrnRtrTmNjBESE7ESdOTt
	 BHlWetaqGUAgKvSUOWF2WNuxNRWhc6YSyciy5U7rADM8vpXwC9r60QPtqEa2Fj+4dD
	 MVg5fdK6CXV8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21FFA811F0;
	Fri,  7 Aug 2026 09:33:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A46B1390
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E31D5811FD
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6uFjll_XglC for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE413811FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE413811FE
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 743698CA3F; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 18c3f6d8950de68b4084b6d508acec0240b3bbfe
X-Git-Newrev: d0d21e16cbe8f3e868226edce4e25d31322cb50b
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.743698CA3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openblas: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0d21e16cbe8f3e868226edce4e25d31322cb50b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index edab26493d..7ac712719f 100644
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
