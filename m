Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A04CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E696145D;
	Fri, 29 May 2026 08:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpAGkRfndQWE; Fri, 29 May 2026 08:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B6C361484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043308;
	bh=ThEkRgZfAZqPrWw2zZxv7S5y6kO9yhNRJ4EeYzk4gC8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kjp7IYKlQNIJPgY53lniCogF6bu0YIuQjcBoRVAy/MhLzuaB4zPuZAFGaIUCahI31
	 glTM7TeIUDgBbcLqEFjbR7bnlH1HiNYZ2AVtmj+D6lfn+KqSQ+iBQjbhiCdqlreO9v
	 Syed5xXMNPkxlt4tYYJO7e7o2Q6jBTPbvQ46+QbS2BTeXAbFrPNh2R7NeltvGzSUEl
	 kk+CTELp//xI9D5LQHhrzp1Yp0EtNqvGjPETA5QlkCx/Thp6Vi/B6U5NZLLP4IUCIT
	 tTpaYUjRlRiaDQvS0xJt74+lfeoDvaa/DhQk9r4DYEaQCUEyxhsAiGqNn/q0pG4jNv
	 DXoyxz+8gVLIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B6C361484;
	Fri, 29 May 2026 08:28:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 124F6288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D9A061460
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCaxYLRm2DUS for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4764161339
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4764161339
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D92B4873A5; Fri, 29 May 2026 08:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:25:55 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: efee1ec45347e3e08869ff330b2045488ecaaf2d
X-Git-Newrev: f01bf75c6b53aba38a9bad698cb672628444f3fc
X-Patchwork-Hint: ignore
Message-Id: <20260529082747.D92B4873A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/liburiparser:
 security bump version to 1.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f01bf75c6b53aba38a9bad698cb672628444f3fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/uriparser/uriparser/blob/uriparser-1.0.2/ChangeLog

Fixes CVE-2026-44927 & CVE-2026-44928.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f328822cf17a1b5f5931522207edc64bba4b4456)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
