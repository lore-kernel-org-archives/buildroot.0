Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70559C5B567
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 19:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2440480F34;
	Mon, 10 Aug 2026 19:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdheMsvO8D7K; Mon, 10 Aug 2026 19:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF5480F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786389232;
	bh=7fyC2b2FfY9aUo6FeU0sJHDOa9/C7NlFOH8CX7prTy0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ls4GsFsDZae7MEZQuYFXUyV4byUJUwnCsiRD5W+Yh89NHDDrUTkA6aZU45L5ypxaT
	 wNHyCOLUW+HwzvkrpDKmN1ELwbzcHRBpoqbWi/xc+OQTNnYQNtmrp4sqD8Wqp7+Pbi
	 8xbb7M1I4k769gOuNtMEyJGnMookLqv33Q99tXS/BCsAZLyi/MdrXnZt2JH4Z8spId
	 z5ThNBu6n5sijWWDvWsWBKjQjVTn9Rqdu7HlZJPZAkTq5fR4IZLX9xYQOV2tLELjpV
	 HYTvESrNyjlogU63JvhbN/lSAgyX164c/D1AdzC+u6Q1DWMeFpYjlR74UgRQ3s2jDa
	 SVCjZHz+AB1qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF5480F28;
	Mon, 10 Aug 2026 19:13:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A68D24E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7073240175
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vz6qtSoSZJ-O for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 19:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91D0F40174
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91D0F40174
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DA1D8D30D; Mon, 10 Aug 2026 19:12:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Aug 2026 20:41:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c2d207f8c65d025d12e40d786f5208933684f44
X-Git-Newrev: 0d372ec29a7d527237b4e638aeb6d3ff42f0bc5a
X-Patchwork-Hint: ignore
Message-Id: <20260810191301.6DA1D8D30D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc-bare-metal: bump to gcc 16.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d372ec29a7d527237b4e638aeb6d3ff42f0bc5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gcc.gnu.org/pipermail/gcc-announce/2026/000193.html

GCC 16.2 is a bug-fix release from the GCC 16 branch
containing important fixes for regressions and serious bugs in
GCC 16.1 with more than 102 bugs fixed since the previous release.

For the list of bugs fixed in this version, see:
https://gcc.gnu.org/gcc-16/changes.html#16.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc-bare-metal/gcc-bare-metal.hash | 4 ++--
 package/gcc-bare-metal/gcc-bare-metal.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
index 216c383a02..1e1003eec9 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -1,5 +1,5 @@
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.1.0/sha512.sum
-sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
+sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index d4f011c2fa..4ec154bb53 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 16.1.0
+GCC_BARE_METAL_VERSION = 16.2.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
