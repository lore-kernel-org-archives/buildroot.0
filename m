Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17527EEF312
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7E6340552;
	Thu,  5 Mar 2026 08:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_DlnN6HqgFV; Thu,  5 Mar 2026 08:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00361407C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697733;
	bh=q6b+Lj5zztSTFDwtP0esgTWz2484vmK5or2wvc+EFtY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Flg21qijKSTSXkggj/+OLVSVzRoeaJXNnlwG6GX5mSwUoz1UyK+T9CX684c6Kh11D
	 RbwGlAf58NtcqjmD2IwBxAHi9WFPoodw5q/iNQZBI2ao2CzCTSeQ3Gnf20LAHR7dPl
	 MI36ysU2HtaLDAQYa74Wm/lotcqGdYO+lVYG7VUEByQkgMDeaXEJiXzcHo0q0d8Ew4
	 Bd6decze1Pcn4xd+vk+mvIWBnjH80Rq1WB/9F9Ykc8hgUcpHYreQuaYKbpj73wW58D
	 7T+49tVFJvb/qTD2ubLM1LmIA+eiyrtLB/QDWo33uV3oSUk3vvsYf9qyLE1OemGoOW
	 1PZxc/grY/sWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00361407C5;
	Thu,  5 Mar 2026 08:02:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 253B51EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96D64405BE
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEdReIEPpO0l for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8023A4054D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8023A4054D
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B68C863A4; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 10:37:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0c14c083a930e2dbe63bcc1cf5ed453e858a742
X-Git-Newrev: 314b6f63681c42ea05724e73b6d6ea14dfb05024
X-Patchwork-Hint: ignore
Message-Id: <20260305080207.8B68C863A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nghttp2: bump to version 1.68.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/314b6f63681c42ea05724e73b6d6ea14dfb05024
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Includes the releases with the release notes:
v1.65.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.65.0
v1.66.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.66.0
v1.67.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
v1.68.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 4b60d6d143..30c2c9078e 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd  nghttp2-1.64.0.tar.xz
+sha256  5511d3128850e01b5b26ec92bf39df15381c767a63441438b25ad6235def902c  nghttp2-1.68.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 98f837e28e..3db48e7323 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.64.0
+NGHTTP2_VERSION = 1.68.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
