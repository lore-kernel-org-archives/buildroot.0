Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E567CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25125410F2;
	Fri,  5 Jun 2026 12:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paJfg6Q8VS1Y; Fri,  5 Jun 2026 12:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD6441180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663182;
	bh=Sc7JdLet9u/Vn0PWszavFOESmJtpLOgzbLh6497fbbc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m6aCUBgKu1o+Q6X1NUlTmz4+nReGzjTENS35zRevfLFCMFpTk2sX9ckcvTSzU6TYS
	 VWMUk5ampl45zT8xMbC9G0AANz3dt9myTQLnrRr6ozFtlxHQVv/LgcdeW3WjMGYhsg
	 o2R3qIQVt6Nc4bIiyDpXExpWbI1ImCeTiud8aUkiuezTlOA26k3YuNeg25cyqIb7ie
	 OJOIzfh2rbtDV+rT9nk8akWEuryhXftJ3FlN1XT+vUQ10b7uKvYvj4CMMPLogpSvri
	 ChR0DIipWhd8RzfnBkHvpQt2uZeA/lROooq0LmAzYdDUZHo9Yk15o61wSlDII1jzb+
	 JaifuXTa1N/QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD6441180;
	Fri,  5 Jun 2026 12:39:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0285FF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6966281EF3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrCd8uxSe6fh for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A5481FE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69A5481FE3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92E0787B40; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:36:50 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 46794e33bc651e5ddd0f6fe5ffa84880e2b36207
X-Git-Newrev: 17ab58e658caf539c47c7990a70138e1b85bb049
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.92E0787B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ustream-ssl:
 needs OpenSSL ssl-trace
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17ab58e658caf539c47c7990a70138e1b85bb049
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 88882b21f2f57f7955190f0d4999a0221af70180)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
