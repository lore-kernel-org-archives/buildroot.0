Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EF3C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 17:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C5344031F;
	Sat,  4 Jul 2026 17:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIj_CnvxN1-s; Sat,  4 Jul 2026 17:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D87F4095A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783186817;
	bh=II/M0bHARBbs68RS5wOIOypjqR97X/gntdRe3KCmzAw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Iut8LHcxUqDi5VY8JWMaEQ6IQ6Gc1wlBVT1QK8qQvXjuCbghl/nKqgz3DHZZbPSno
	 PcYQ2VuY6AICo3CijvkfoTlef3DCUZfSXcUSXlZDPPJFUvsbcH9GWqaYycy2lVPcJE
	 hS+jX6qqb8Gva87tY5iPaUlUWC9jWMvnf3jSEARGc3PWP7UvfZTgPpOWrAcuxROgRu
	 xtrcxiXWQks7HzwC58gZ6M0xF9m+CuBtzhxlvML55AeDwSCLUKGUM5WuHN1FZ/EZVy
	 OH0TJg/3jg/i7Ihad91dXaWOb3PvCpT3kTpJJYawdIa7XJs58WdfvzMPdzIotP7WXt
	 L7QMV0fRyuGSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D87F4095A;
	Sat,  4 Jul 2026 17:40:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E7AC363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4001940078
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgioDzysuNJR for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 17:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E830D40125
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E830D40125
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:40:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F120D8840A; Sat,  4 Jul 2026 17:39:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 19:30:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40aa02467447ebf193efe620604ecd97a59da1b2
X-Git-Newrev: 4853fb2a1b84870d59ee1bc06b8bfc819a9d586e
X-Patchwork-Hint: ignore
Message-Id: <20260704173944.F120D8840A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump to 1.4.84
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4853fb2a1b84870d59ee1bc06b8bfc819a9d586e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for changes:
https://www.lighttpd.net/2026/06/17/1.4.84/
https://www.lighttpd.net/2026/06/14/1.4.83/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 2a7c3c5e84..d0ee0a5da9 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.sha512sum
-sha512  a8ced6e61b6768d31fb643c1f75af906ee975000286a9a522415571878c7979fd9e5e39f36871e8f34f6ca5d3702fa4b20a0c1203b57ba446dae2dbb6efa71b4  lighttpd-1.4.82.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.sha256sum
-sha256  abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962  lighttpd-1.4.82.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.sha512sum
+sha512  47d3e802093822f5aa42b9b3324a95668d305c2e2074366b12be9bc812291ba423576e08b2a163a5f752b110139a76c7973086fbc01051f8f639998d8146ed00  lighttpd-1.4.84.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.sha256sum
+sha256  076dd43bec8f2ba9ce6db7e7ca7e8ad72271cd529805ead2400b56efaa026f70  lighttpd-1.4.84.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index a126e96167..613715b889 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).82
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).84
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
