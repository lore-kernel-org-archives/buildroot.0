Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3658CCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 10:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB9D841C1;
	Fri, 15 May 2026 10:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HlUxEZCB2r9; Fri, 15 May 2026 10:53:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A896841BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778842434;
	bh=M2xtNljGJ6eu6KPmCSlr7z5D9ZTeUPiYVeT7do+JJUU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=douSH07/BjSs7Abm73eRtkglN0kH7oqE2gHLfpFf/2Q9bktE7iTkdA1+/Egr4fNJc
	 Cr59hDECIj4bm3iPWf2RyHx/uh9p/fzk7M6rhZKvHDfsQ1Qw5kBMdz1vrikhSxaVgi
	 8kNmzMsI1Rw6XCfZaeQ3SiGjN1cJ9/fxB+jqO561zTIj4OzBodfZwXzpu6jBJSBriF
	 eb9I24QmNu8uxZ+D2l8azpl0NtlNCR1KE7vtEuaZX5nMGw17vixLTh0JFjAWIaty0N
	 XMXH6nbJpN1N+pEip/eFYpTbseTaRDgZmfJBQKrPEEhttEdJ5AWQHxodqLTzwCs1iL
	 PFGyKN0hmLqzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A896841BA;
	Fri, 15 May 2026 10:53:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F354D36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D750241784
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEb33Oqibgxy for <buildroot@buildroot.org>;
 Fri, 15 May 2026 10:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30058414D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30058414D1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80A188633A; Fri, 15 May 2026 10:53:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 12:48:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7c941cb88b795e90b00892043c75c525b1d336f5
X-Git-Newrev: 30c34bdef32062f32e6afaff225c2f27e156fb57
X-Patchwork-Hint: ignore
Message-Id: <20260515105346.80A188633A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cryptsetup: add
 Mbed-TLS crypto backend support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30c34bdef32062f32e6afaff225c2f27e156fb57
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

cryptsetup support Mbed-TLS/mbedtls since 2.8.0:
https://gitlab.com/cryptsetup/cryptsetup/-/commit/cb7b7fd863e4303d15ab15ae4fe8f21608d62a40

Signed-off-by: Andreas Mohr <and@gmx.li>
[Julien: add link in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cryptsetup/cryptsetup.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 716a244915..22c564feab 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -41,6 +41,9 @@ CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nettle
 else ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CRYPTSETUP_DEPENDENCIES += libnss
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nss
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+CRYPTSETUP_DEPENDENCIES += mbedtls
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=mbedtls
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
