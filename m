Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF2DCD0400
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E6440428;
	Mon,  5 Jan 2026 20:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1C7uxyVviaQ; Mon,  5 Jan 2026 20:50:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7590E4041C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646233;
	bh=qXsB8W4fvU1k3XoxjnAcruU2OZ39udvW2wi6b1g/9GI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GvvkJpkPF54vtU6VNOYH6gRWWmmKM9aFqkHo7MrKkSdEF9uJofM2Rtqs/NpmBtAkL
	 Hu+pVQCIR000xyx04Ks5xCy9lR76PlFKhlr1SpIH3c5qdendaGtFmOae3mvjnwjqMX
	 XLFRHtIGVgB+A2n09AowBsy+xgs29Mfave5ubvSDikyF5RsjZlJB+usX2vxPnduZ6i
	 5lzHh0/DjHEGMEE3i0m3DBBllOlqVA67WzMzW/zAwHvfoZ+mv0FMqd9YjEJBng7XJE
	 bSR20D5Rwlhb75l1KHrdPFMPQTTXWzH3pDcPNT51AuITE7sgMDWDnLHplhNO0Nzw47
	 n77YWBg55/Uhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7590E4041C;
	Mon,  5 Jan 2026 20:50:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0A88249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BECA94041C
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxLtxFkVB0Io for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E124041A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9E124041A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B938D8427E; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 21:37:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d78978a0d0cc12b79364faee2c17585047f87ca
X-Git-Newrev: 1498900a086bd674ba3336a36005ce4793ef6ec1
X-Patchwork-Hint: ignore
Message-Id: <20260105205030.B938D8427E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-memray: add config comment
 in case of missing dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=1498900a086bd674ba3336a36005ce4793ef6ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package was added in c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-memray/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
index afd0adc901..831dfe2957 100644
--- a/package/python-memray/Config.in
+++ b/package/python-memray/Config.in
@@ -17,3 +17,8 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 	  A memory profiler for Python applications.
 
 	  https://github.com/bloomberg/memray
+
+comment "python-memray needs a toolchain w/ dynamic library, threads, wchar"
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
