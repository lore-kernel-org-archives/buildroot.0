Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23505C5AE5A
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 15:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B51DA40926;
	Wed, 28 Aug 2024 15:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWRHKVIb8AVd; Wed, 28 Aug 2024 15:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB87406DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB87406DD;
	Wed, 28 Aug 2024 15:32:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBE831BF2AA
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 15:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7709812DF
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 15:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wy_iw7O6LLdJ for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 15:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CAEB812DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CAEB812DC
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CAEB812DC
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 15:32:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1F31F3535C40; Wed, 28 Aug 2024 17:32:14 +0200 (CEST)
Date: Wed, 28 Aug 2024 17:32:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zs9C/g1czFdKG5Kf@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724859134; bh=YDcqhug6cBPnvoR+f5NQ2X+lzXZMesA6tXcoDbsZUEg=;
 h=Date:From:To:Subject:From;
 b=WsXggR9FPKM8xg7GLKIX1xy2fejoUSYIlWDc8sjy2Dd8WzVCPLnAbtzzxEwXBpqlo
 DKp4U5wqOSxw0TR716LZd84J+MeZUjVt6SsunEnl20vBhutJ5p+Z+kjDWBmFi1sfQM
 TNu+yokpZSNejhgn/2n5Qv5jD54ICErQin/inwPiiq014cp/JSn20Im4b7fW7vAStc
 fw/WsIb1MvgcL/TkH8CZdR7927rcc28r9pdrNngRN5u0Ot7GmXblUwyBfMXTnJyTPi
 yjrw2FD5s51L0Id3Mw041ZVwFzrDueeR/mrUL5jDVq48cpn35gouE8Ry7vrpjQMi2I
 yb6rh1zPKbcQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=WsXggR9F
Subject: [Buildroot] [PATCH] package/tllist: update download URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix download URL. Tarball is renamed, too.

Fixes:

 http://autobuild.buildroot.org/results/950/950688493021c12c4dea98ac4b220355d917ff69

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/tllist/tllist.hash | 2 +-
 package/tllist/tllist.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/tllist/tllist.hash b/package/tllist/tllist.hash
index 2806d62355..73d382767a 100644
--- a/package/tllist/tllist.hash
+++ b/package/tllist/tllist.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3f3fe2f7433719cec816c63937a7aa36e566bd317763ef46d11562073ab6361d  1.1.0.tar.gz
+sha256  a1f0ce0dc4fcb4ce59c37202a1d914c853a8bd2d7c5d57d623b15a8dd9778767  tllist-1.1.0.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/tllist/tllist.mk b/package/tllist/tllist.mk
index 69a34a65ab..26e21ccbe1 100644
--- a/package/tllist/tllist.mk
+++ b/package/tllist/tllist.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 TLLIST_VERSION = 1.1.0
-TLLIST_SOURCE = $(TLLIST_VERSION).tar.gz
-TLLIST_SITE = https://codeberg.org/dnkl/tllist/archive
+TLLIST_SITE = https://codeberg.org/dnkl/tllist/releases/download/$(TLLIST_VERSION)
 TLLIST_LICENSE = MIT
 TLLIST_LICENSE_FILES = LICENSE
 # header only
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
