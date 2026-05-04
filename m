Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A179CD3423
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 08:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 695B161348;
	Mon,  4 May 2026 08:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yB8Y1iiXm86X; Mon,  4 May 2026 08:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A74261253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777884092;
	bh=sN768xpbS0QCFWy9R1pVmxagDPQJtkb679i9yWShi4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qb6wb2B9NWtbcvW4BB0SMJCVdnuCzqTHhuHP0xBWL+3g/6L9g2RhwY5yiOp8tRhl5
	 4Gs6y9mpULlNqt/VTXFfDT60HoO+v2TYu3Ml8/9mn0EAMRCmBMaNjy+ZJCZdTCFC6g
	 DXDzFqvp4UYNtaWnzqdwWtmgfhZMOo8H1o3OX5nzm2ogW1rMYvHQmkJB66R3lByN42
	 Chbr2xMd2ii0jJ0k9W9e41SH49I1dmrpiLANazVEQtrD/dIPDSorBWFsbkVsNFFiB0
	 BsImX46F/0Wl9RGHkpm8uVMnW+JGcN/KsPUNw/c1WSj70i5qIf40Vh8kqz3HOJXTRg
	 W1/jOJk03uz4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A74261253;
	Mon,  4 May 2026 08:41:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B69E8190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C94F41588
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhkO4Axl5Xw9 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 08:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E027941440
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E027941440
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:41:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8DA184245; Mon,  4 May 2026 08:41:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 May 2026 10:32:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8008da299f2d7321b3831b1cdca315aa3973ad04
X-Git-Newrev: 3ddeb7a9d3938fd216ea8d218dd58b26b89e3bf6
X-Patchwork-Hint: ignore
Message-Id: <20260504084129.A8DA184245@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpjsip: enable parallel builds
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ddeb7a9d3938fd216ea8d218dd58b26b89e3bf6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
