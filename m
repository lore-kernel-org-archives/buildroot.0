Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726CECD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 200F1844C3;
	Fri, 29 May 2026 17:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_gDuy_75OB3; Fri, 29 May 2026 17:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EFEE844C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780077392;
	bh=G3TKZNVv7zECgj8n0MpaNWwuigJRbx5pRUFtmw/6FiU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ij4NyiOnR47Ut9z/+0piP5rNaZOBDVmHqhey51k4+wawB9nBsX4DIbdPIAOoJg+BB
	 83Xaq+nWxM/sV8jP9RoiuXIg3igZvOU7+ZZ7E8arlD+dJFDSAOOlad657ogvG/T5Qf
	 9KzECUUdfjenAhk6dW4ufo12VM5Ola4xdTLvyd5E6cHIkmLzBZcBbMb3vlUk+yLTO2
	 rnI53IYlxFO3IfjaiRRLvpETHYhpaT/Nk8H3MBz0oKqsPlTWf8k97wTeMFdYEL95TU
	 /uXyVqLezS9tTzphJhjy4p2W+W3kThXHmd65d1pTF8USJpl/KnaONF4hjCHYUSEmW2
	 jPcdiPYQTs0+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EFEE844C1;
	Fri, 29 May 2026 17:56:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB494D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C960D844BF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTpJFQv9nHEM for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D4E1844BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D4E1844BE
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:56:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 814858740E; Fri, 29 May 2026 17:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 19:55:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0cacc6acfb9357bc5aec61f7d9e330c2e41a190
X-Git-Newrev: 88882b21f2f57f7955190f0d4999a0221af70180
X-Patchwork-Hint: ignore
Message-Id: <20260529175617.814858740E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ustream-ssl: needs OpenSSL
 ssl-trace
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88882b21f2f57f7955190f0d4999a0221af70180
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit e1050a3a50886c72d3ff2416dd8db2fe3c389973 bumped the
package which includes upstream commit
https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=956fba242ac0a4bcfe3db103d4d1f41545c924fb
that adds the usage of SSL_trace causing a build error when OpenSSL was
built without ssl-trace support:

/home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:
 In function '__ustream_ssl_set_debug':
/home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:490:44:
 error: 'SSL_trace' undeclared (first use in this function); did you mean 'SSL_write'?
  490 |         SSL_CTX_set_msg_callback(ctx->ssl, SSL_trace);

Fixes:
https://autobuild.buildroot.net/results/17c/17c88282c32f2edfa0991e0e10cb45013c947be9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/ustream-ssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
index c328a6ea12..6fc54f3bef 100644
--- a/package/ustream-ssl/Config.in
+++ b/package/ustream-ssl/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_USTREAM_SSL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE if BR2_PACKAGE_LIBOPENSSL
 	help
 	  ustream SSL wrapper
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
