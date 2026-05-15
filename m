Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF603CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A766A84217;
	Fri, 15 May 2026 13:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifqyZDfmTbGk; Fri, 15 May 2026 13:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B125184215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851748;
	bh=y8hB6WPR8eexjVq/pLBaUijUADbZ7MWYA7ubO5sqSSU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=orWsr9Tm1zG5CQujZPH64a6teMQK3rJrnF0yH2c6547tNkaqeFUY5Y8wcefj8wa4G
	 HfhItsSR/7BRic+faKI9U7zEhLxVnd8w0qA/al5sqJnUsQGSJR9GKlt8kEj2SImhih
	 fUL4kgbjOYjd9A8g10M7j52zN/9Ampd8q8TmLgfgz2eQeeEq8rorVOD5vkd7B4Tqfm
	 Yq+lNkUjPcNxAbiHO2/EuRcvC+EVlY7oo0t8J+YQX8pZ2zZpMgfmWFDJeaYUMbms3G
	 LBVT1xcJeEWkyFeq0Qiu7LKbwCR7HYFimm+FJuDrWUJ7uPh5cpiWty0k5dc2Rs1pfn
	 JeDv5VTz+Fopw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B125184215;
	Fri, 15 May 2026 13:29:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03EAD36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F003C61575
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUaOhe5NU0EX for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09BFA6156C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09BFA6156C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B1458634F; Fri, 15 May 2026 13:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 14:27:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1717031cb685e46d35a4cfc82eda83eb661008e4
X-Git-Newrev: 761c4f74a9d631ee1c02118012c3d8d93eaaf1e9
X-Patchwork-Hint: ignore
Message-Id: <20260515132817.5B1458634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpjsip: enable
 parallel builds
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/761c4f74a9d631ee1c02118012c3d8d93eaaf1e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Parallel builds were disabled in 2016 by buildroot commit
781ce19d746efb6a5408b4d50b30626784eff324.

In 2020 upstream added two commits which fix parallel builds
https://github.com/pjsip/pjproject/commit/ddf48e2045fa155ef5242d9d7dcec27f8c5ed873
https://github.com/pjsip/pjproject/commit/78683646c8bc670ec730a42494e075f671a08e28
to version 2.11 which was added to buildroot with commit
2c7ad667ec4a25226848baba809e492ca0ff06da.

Tested with -j100.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 3ddeb7a9d3938fd216ea8d218dd58b26b89e3bf6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpjsip/libpjsip.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 8cea8e3abc..38adeff626 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -13,7 +13,6 @@ LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_CPE_ID_VENDOR = teluu
 LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
-LIBPJSIP_MAKE = $(MAKE1)
 
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
