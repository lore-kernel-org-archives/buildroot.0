Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F64F1061B1E
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 20:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B3A40802;
	Mon, 30 Mar 2026 20:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORFKBBa_WV0D; Mon, 30 Mar 2026 20:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE7B6407DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774901250;
	bh=DQzkpUzUCxo0ohu+GcsF6RTesmv2bwT1PQNx7sr8wc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NYI0VTHKnR4JIQY7JmfSEw/37bpJUkP8+14fCOMQcG9Y7KcKcRBXF1Z2xaRxxD54E
	 paJWaYN8PzvVtuo92ROF7VBK85gLlVNxRqh+9xfpbNJw3WC5rQXP+0FRelZSxVb8+a
	 8GzjV8Ad3L1j5Z2P1Oy9hjg1cXZd+gXK8LSlEjuAdCVlCLlLdOVc3XVybc45NHegyJ
	 qgOa036qLKteJeqmZNpct0d17fVMQyy7W/yOtOGdsQ01E6Y/h6ROuqjqvshgx/P8ZY
	 bRNdEi95EJs07w7dBruGXTpXLQql9v1NhHao5Tf3M7KA7uAy0JfubZVwQKgBk/rFvL
	 EAUfEQNmuTMEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7B6407DE;
	Mon, 30 Mar 2026 20:07:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88EC04D2
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AF7140540
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGCQ1-t8ab_q for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 20:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D5734002A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D5734002A
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:07:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B92057FDFF; Mon, 30 Mar 2026 20:07:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Mar 2026 21:59:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dad17ea06260ef0bd23eebc47c95a8510310bf5
X-Git-Newrev: 774a09423e00360b51d3ed35ff9635c6bfc38cd8
X-Patchwork-Hint: ignore
Message-Id: <20260330200727.B92057FDFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: bump to v0.40.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/774a09423e00360b51d3ed35ff9635c6bfc38cd8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:

- https://github.com/yhirose/cpp-httplib/releases/tag/v0.38.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.39.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.40.0

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index 076b30cfa1..eb2b77bcd8 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  909766cd7697153c9e588b0f96defe1868b7bb11d94b8d4f0c83bb4875bc9066  cpp-httplib-0.37.2.tar.gz
+sha256  b52ecaebf0f94086c8b3305650412359d920c5267f6d9ce87f883198783af678  cpp-httplib-0.40.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 56e8c27fc4..5cc60565c6 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.37.2
+CPP_HTTPLIB_VERSION = 0.40.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
