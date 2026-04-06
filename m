Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBFEEF4EA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F11C608D1;
	Mon,  6 Apr 2026 08:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id De5zMHxFAz2S; Mon,  6 Apr 2026 08:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DC5F608BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775464720;
	bh=XO8TDCMCw2PKORmIfKMNYvl5yAQ27W6uMvKWdIO9c2E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e4P7TyaOym/MtIlOQKxOUMmOhuWe5xEL8alRspXaf0NN96060roTnR1/nBidpc7Xc
	 /rCjv1An/gEUnuJdYCehVbyQJIrzFk/0BttkOeOLNjW+IYhRv9/BfjnyeXT71Noy7N
	 mc1Qq+q/zvF9gJmsqi+cuCP5rKYhE3kj5ZdvCXv7QEAEgirX7mHnSJzUMvP8GYOxt6
	 WvZAnZ2abuY6Y+xxRtzYfniPRrDtYHcQD2zICalu+G4qse22iru6rXYMWydrzAGGX+
	 c9/Z0Caqj8v0rol2/BEEZHZ3gJdlV0TgK2hVfirqO1kkM3o9MZtvZAPzNml8VLjQlj
	 dsUpiL9opLmkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DC5F608BB;
	Mon,  6 Apr 2026 08:38:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7436B1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 659DE608BB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6p9CR3ecUpOg for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DC4C6083B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DC4C6083B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:38:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2FB280420; Mon,  6 Apr 2026 08:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 10:37:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c3a015a5e12f8027c926d81d506f0d63012d104
X-Git-Newrev: 60a95e04d434ff31366a987df0e635fbd9400876
X-Patchwork-Hint: ignore
Message-Id: <20260406083837.F2FB280420@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luvi: update help text
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60a95e04d434ff31366a987df0e635fbd9400876
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 00317f0aff243986983650671fd220ab040af50f switched the
package from pcre to pcre2 but forgot update the Kconfig help text.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luvi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index 19d3307f12..04163141b0 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_LUVI
 	  The luvi core can be extended with several Lua modules by
 	  adding its bundled Lua binding libraries.
 	  To get the Lua module...
-	    * 'rex' select PCRE (BR2_PACKAGE_PCRE)
+	    * 'rex' select PCRE2 (BR2_PACKAGE_PCRE2)
 	    * 'ssl' select OpenSSL (BR2_PACKAGE_OPENSSL)
 	    * 'zlib' select zlib (BR2_PACKAGE_ZLIB)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
