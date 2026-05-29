Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6D1CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64F1161364;
	Fri, 29 May 2026 08:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6aLYUfe6xzt; Fri, 29 May 2026 08:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693166145C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043305;
	bh=OELrHTRbtX5CxLm7wiXz63xMRz4KbbntI/HnOC562WM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V5YVcAu0+Ud9534eCXeCGkI7tpk2QPfuHOTTHm2qqs99M01i3YduK3y1g6uHxab9p
	 /4HPpOs7ZKg6PIThiaxYcZKflpZNRqsMHVQuExM9v+o8PN8qbHrzAIfdJvHbK52mxD
	 v09QLFD/uCgf8nsSK5EqFh9Bilry82ozn19zo4JJyA7sTbyR4vNdqxtNNfdkqeOENk
	 tDMLzvLFG5Gtjn0x/hKYnjboLRv2OSoaDijOE+aJVV3xyq2+jLow0AOIRE89eznFKp
	 /MBO138N6vgkEE3PYnT4R/SK8Gdcq7U7dCFDfkb3HzQFxe8e/hMKDPd8WqkVcLRTtc
	 d3azMd7Mo5vLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693166145C;
	Fri, 29 May 2026 08:28:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2334B28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9015561444
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXb3jKKo28rV for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3BF6136F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE3BF6136F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BC6587099; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:17 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4de77652d63264a2a5e63307be06db5eee9345ad
X-Git-Newrev: 843b2dffcb2216994d0207d50f76f5a0d4917374
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.6BC6587099@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libks: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/843b2dffcb2216994d0207d50f76f5a0d4917374
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

libks makes use of ERR_* functions defined in openssl/err.h which are
included by openssl/engine.h resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

/home/buildroot/instance-0/output-1/build/libks-2.0.5/src/ks_ssl.c:111:17:
 error: implicit declaration of function 'ERR_free_strings'; did you mean
 'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
  111 |                 ERR_free_strings();

Fixes:
https://autobuild.buildroot.net/results/aac/aac25e5c584ede962cac95c353afd64bf720199c/

The oldest build error on the master branch dates back to Feb 2025:
https://autobuild.buildroot.net/results/83a/83a207bee796afbc619b62c5ecf89c662484170f/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 40e9341b0b2955c0ed2fc7454a1a392e565d6e2d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libks/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libks/Config.in b/package/libks/Config.in
index 4781d188bf..17a008d7a0 100644
--- a/package/libks/Config.in
+++ b/package/libks/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBKS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
