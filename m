Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C62F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC004814D3;
	Fri, 17 Apr 2026 15:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kglKDDXM6vut; Fri, 17 Apr 2026 15:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD80C81786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439232;
	bh=wtogp4ZGR9u3IWgVPxEDlrMlfxw+0ROInZu87ct0eZI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pl2LM26pVQFkm7t0KL2IWzdQ9OE0ghpOysWBDxuulUOZVg5AJzWEdgaomJ06LymnF
	 Q+5bhPMkLsBXl5G3LqhU60aNl/mEjDEpyciTet90odVJKUG4vc7PNReX2o4lIXt8Fw
	 7urVz6izR1Oom38CxJfXEFqc/qL5qstyWQ0OpWjO9rfHsboDRdL1hZv+6aJ5OtMAOS
	 dx+uOVkh9+kA6czllG5/zMn27o0inBtvLVqDHZ/nRkGqInqqfqK4sBaU6zNTBYTN1U
	 5cfa8pIzP/gMZiB8wuqgSg/eUP3+lZaf1+/kseMwx+M/ndinFGzvala0pY82hGWLXb
	 fxfpu94IY7j+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD80C81786;
	Fri, 17 Apr 2026 15:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 637F7396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 940134052A
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cm8jEsjouWOf for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB8F40591
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDB8F40591
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F517819B4; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 16:16:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 59b2b238c1a1d606339a5fc7ad44e4dc1ddfbd38
X-Git-Newrev: f07e45130b384910492e2ce6a2ca69c07a59cfc2
X-Patchwork-Hint: ignore
Message-Id: <20260417152008.6F517819B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libftdi1: enable
 static only build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f07e45130b384910492e2ce6a2ca69c07a59cfc2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

libfdti1 provides configuration options SHAREDLIBS and STATICLIBS
that allow any combination of static/shared libraries.

Fixes:
https://autobuild.buildroot.org/results/d7b9a45ccffc1c9e3fd796c3e46ee396b7d88272/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Marcus: explicitly check for BR2_SHARED_STATIC_LIBS]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 0a9b365de4c0d4d2ba6c493b0dafda28dc00ec2b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libftdi1/libftdi1.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 66798addc4..557a435a72 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -14,6 +14,14 @@ LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=OFF
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=OFF -DSHAREDLIBS=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=ON
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
 LIBFTDI1_LICENSE += , GPL-2.0 with exception (libftdipp1)
 LIBFTDI1_LICENSE_FILES += COPYING.GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
