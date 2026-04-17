Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56294F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F17281951;
	Fri, 17 Apr 2026 15:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dG-eHhEJScX; Fri, 17 Apr 2026 15:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F13A3818C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439385;
	bh=BwZpBZYbRKlJSNhJ8lP+Ugj2KQg8hF1YpuDT8hYPE1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rZi3gPDjt4hT2qSCz1E+M0pIvFWCgna49jFD157KwNCE509FkG518a7vF+5A2NYtU
	 NSabGzq+d/GNf5PK85ArXUMUjVyr4mrL3nJpH9gGkG4M2bhane4IqxqLAz+Yz7n2pU
	 zXdjefkTpr4cllxrkgs39ZBXv5H7XU+i4eY4cc7zXXS/kZuj75Xe6KWRTSrutsTPIU
	 IKHFxJaEdOtn2Si1O4/jurfZydr18lpNrhzYK2cChumaJQiwVU2gzbEIWpazUi3q5d
	 3G81lGPmYN7HhlmxNfDcA6590ARs9inepGp3Voc/OcAh1LXpjM2b5qimcHLxOVJqXg
	 EFgjVrtfwTZHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13A3818C0;
	Fri, 17 Apr 2026 15:23:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF679259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C35A40DF2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoXpcq6GGQCJ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A5AE40DF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A5AE40DF3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEBE181DD5; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:19 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1b5a7bb021e92a1faf528c5f59dbd7b114bcf108
X-Git-Newrev: 930b6d393036f9c8155157df7749f2d0b73da7f5
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.CEBE181DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libftdi1: enable
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/930b6d393036f9c8155157df7749f2d0b73da7f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index 31ffa1aca3..4fac8d2e39 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -13,6 +13,14 @@ LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
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
