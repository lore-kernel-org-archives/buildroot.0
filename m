Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C77CD98E4
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 13:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7925385A52;
	Wed, 17 Jun 2026 13:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeBCoxn9MtZe; Wed, 17 Jun 2026 13:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF7E85A3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781702216;
	bh=Yg1FepjT+lnLeUcCh1vpfSxlI8lUwUSckDFthb//bzM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pg+eMZUpSO64egoDkGIoFyi5oNK1cxmRWF6hdCjM3XjwEZlJB6cvcKtiyT7nXO4/9
	 W35m8ngmNGzarz4wj3no7vaOyScWurVpocxgmw9O+oWlmFc9ucWEE3H/SwjvKod8fp
	 /LGmsS944jOvuBEBjhQaEcFsaIGlk+R7wZIxU0H9/wEzPFigExNoBb23wVIDhTo/+u
	 qaXz51OanCq38BheptU9zcKYPbotUsT5Wj+Em5zV6sWNm8AX7wOn37V8pNE1at7lgd
	 HYOgt4QCt/JiwyE7DqhvW1+/jjS3mOjpZD81b0TqRTswuwVjszdfP1lh0D5/7vyASM
	 xmZ48r8UV2h1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF7E85A3A;
	Wed, 17 Jun 2026 13:16:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6403D33C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5909285A24
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpsCBNr0wWlV for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 13:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 991B3859EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 991B3859EC
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEC568121C; Wed, 17 Jun 2026 13:16:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 15:15:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8536a5d04a6a83d9ec4b4922b99c14a7c4a8ae92
X-Git-Newrev: c0f95301ec29ae14a8b1ce36ab752e786d7397ab
X-Patchwork-Hint: ignore
Message-Id: <20260617131629.EEC568121C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: make openresolv optional
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c0f95301ec29ae14a8b1ce36ab752e786d7397ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In a standalone iwd setup having openresolv or systemd-resolved to
apply DNS config is useful, but if iwd is used with another network
management service (e.g. NetworkManager) the dependency is
unnecessary.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/iwd/Config.in | 6 ++++--
 package/iwd/iwd.mk    | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index d8fb6a6ea0..eaaae8d865 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -7,10 +7,12 @@ config BR2_PACKAGE_IWD
 	depends on BR2_USE_WCHAR # ell
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_ELL
-	select BR2_PACKAGE_OPENRESOLV if !BR2_PACKAGE_SYSTEMD_RESOLVED
 	help
 	  iNet Wireless daemon (iwd)
-	  Enable the readline package to enable the iwctl tool.
+
+	  Enable the readline package to enable the iwctl tool. If you
+	  want to use iwd standalone, you probably also want
+	  openresolv or systemd-resolved to handle DNS configuration.
 
 	  https://iwd.wiki.kernel.org/
 
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 76cc00fd22..8f662ce5e5 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -38,7 +38,11 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
 IWD_RESOLV_SERVICE = systemd
 else
+ifeq ($(BR2_PACKAGE_OPENRESOLV),y)
 IWD_RESOLV_SERVICE = resolvconf
+else
+IWD_RESOLV_SERVICE = none
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_IWD_IWMON),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
