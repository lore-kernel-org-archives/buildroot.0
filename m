Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3BBCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 16:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E33E584412;
	Fri, 15 May 2026 16:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fs6QbxEwvIBt; Fri, 15 May 2026 16:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9719084401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778861213;
	bh=EcbBWaRTD7iaybwUn2L0pXRTGehQ+N0hRO7Nmx6L6vY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E+kSv2boLp0J+wgJCXokXjmjR0Ihzy2Jpn+4UYntFJVQd8wI3Qtbf+qGnUop9LCXK
	 1Ifz03cH5+3BdE75BmIUh2eK/qeuOCYB8QbPnMpaiJpIW5AVYd2TYq9AQdAcTRtEHN
	 MrlJvi3e9mNEMlIcC1w7Bf5KXGVdMNsSjrGglrC2kwvy4BAER3R9I9Id31tx3T+hPj
	 TsxGtIes1d1t40biQ7jlYoPQlvUAKejpo/YvvA3yN+8Ru7Zrr3sXxvNt3hmYppEX+c
	 M/uD4YFSqhaKwmw9ZtawQdKedQmRuDICLqpjfKf+oxl8nkrp0d+RLmJxqspbC/QhbP
	 BTAZAKs+Hd5LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9719084401;
	Fri, 15 May 2026 16:06:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5694536F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C3D040EEC
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvHDmIX6NAax for <buildroot@buildroot.org>;
 Fri, 15 May 2026 16:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5630B40256
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5630B40256
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:06:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 999528639D; Fri, 15 May 2026 16:06:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 18:03:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2ad5b883342b92c354c8a110ffbaf1ca7dda20f
X-Git-Newrev: 40e9341b0b2955c0ed2fc7454a1a392e565d6e2d
X-Patchwork-Hint: ignore
Message-Id: <20260515160644.999528639D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libks: select
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40e9341b0b2955c0ed2fc7454a1a392e565d6e2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
