Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B8BCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CC2A42287;
	Fri, 29 May 2026 08:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKU6PjYVIxs0; Fri, 29 May 2026 08:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61CE94228C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044477;
	bh=idga8tHtp/EK9aSeq7//GJpq/3CKeYGGWnsCX+VF9uI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rjKZEFCWWLKHg5QS6Ak23ex9z0gWt5i32Fd/zy21US8GAO/LUblbXF7sm2fSnBXmI
	 HjJ74nf/uGeidCyvGt0QF+O7WfmxGDi7/inWjVYJ78dHoxBClcusKlVFfQiLHzGoh5
	 03zykbQqzmsJyno9s55Ain753tJBgLFSQKkow4J+LvGv/P+GHRg+ggCyZiHG5fYh4z
	 kN2xSmx6N2D8RrAP7FJX5RxxQn1b5pZy8sLzlUduklx/+ipHtMbM25Je735wzfFzRs
	 A4z/6CLGCKZCZqwK+TTDkqUNBVLxNwXYM1aqPDXdvGSllrDAo+IaV42CnxE9bgS3nz
	 wgruDO4iXxNzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CE94228C;
	Fri, 29 May 2026 08:47:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0E9E28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C33E461517
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoNInJaophG3 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC5C661497
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC5C661497
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59F2A873AC; Fri, 29 May 2026 08:47:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:43:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b12c9d3ccccab56c32857c6424a0617d70e613c9
X-Git-Newrev: 9129a431921d51d82eaee66f98d4969534978fd4
X-Patchwork-Hint: ignore
Message-Id: <20260529084740.59F2A873AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/luksmeta: modify
 !BR2_STATIC_LIBS reason
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9129a431921d51d82eaee66f98d4969534978fd4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

There are two libraries with same crc32 definition

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/luksmeta/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index ddc9b6f3bf..45732733e5 100644
--- a/package/luksmeta/Config.in
+++ b/package/luksmeta/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LUKSMETA
 	bool "luksmeta"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
-	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
+	depends on !BR2_STATIC_LIBS # Build fails because of multiple crc32c() definitions
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
