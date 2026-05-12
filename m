Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9A3CD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3996940FED;
	Tue, 12 May 2026 19:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8cum_BOdC8V; Tue, 12 May 2026 19:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6841640FE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614035;
	bh=ozYoHBJWtGz6XcaGNVt+Qr/zc5st8vGWpXZvEkGk3tI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j/oz2KPO1xNbQvHZnLz+BrgI1k82u147jv63gbZEcs3yxoG3DzHqzYsvXJw5i57PB
	 nOKB0lpIEDwwpk+2Er32g3UP43Kn6lEdHwNUbtH4p7HPiPBdDry8K05FWK7pqyKS/O
	 YvQvNHqAoDncj/XNRhRKsRBO2tDb/siFHj1x3hr0NHwIoeWmvsXIJHbpwgg3MEEs1x
	 VkGKBGcOAkPHum2q30XdfcNiL8M8Lf7OpC8kMtzt1y1LsQKL49EQFGeZGlTaAChiZG
	 1otPjMNIsg3r/i/UKluMfGMC0MIWTQF7hFpPvkvSV7pZ0NvVRVWi5U5SXJtInDHg30
	 1McF3Z03QPCCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6841640FE2;
	Tue, 12 May 2026 19:27:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C097115F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5CFF40FE2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwtfdu0Jvh_w for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A959240F9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A959240F9D
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:27:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5182085F9C; Tue, 12 May 2026 19:27:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 21:20:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9684cb9b4406e01683a9b5136100d81040d56aa0
X-Git-Newrev: f328822cf17a1b5f5931522207edc64bba4b4456
X-Patchwork-Hint: ignore
Message-Id: <20260512192708.5182085F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburiparser: security bump
 version to 1.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f328822cf17a1b5f5931522207edc64bba4b4456
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/uriparser/uriparser/blob/uriparser-1.0.2/ChangeLog

Fixes CVE-2026-44927 & CVE-2026-44928.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liburiparser/liburiparser.hash | 4 ++--
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index c18df8eb98..ad5bf40d47 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,4 +1,4 @@
-# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.1
-sha256  acd18cfb14d1851705f863f7a625be693fb3971fb85d4996faa21147f0315fcb  uriparser-1.0.1.tar.xz
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.2
+sha256  7b2496f9622b4b201186a3d159d278605f1fb7262402a10cc1c0824889798b00  uriparser-1.0.2.tar.xz
 # Locally calculated
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index d8dcc22063..9d1b9a1aac 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 1.0.1
+LIBURIPARSER_VERSION = 1.0.2
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
