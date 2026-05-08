Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0754BCD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 09:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BE1615B9;
	Fri,  8 May 2026 09:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg0L2Ah5LAVC; Fri,  8 May 2026 09:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A83C56132F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778231120;
	bh=jC2On/scnMS96ekhGue+7RASi3/bjMlAuaRCU8j0bVA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LeiDBBr2sqqs1rlMpw1ZvWuLyAf6AVrEK1ozRFws/NUVZtGd19Fvk1x/q87gGml88
	 2ERvn8OHOYpxnqjmnSniOn9+tmxVMhViIgLdlvLmOGWluGOxNWHYGZU0RIKug8TJFh
	 rVGVhJjTNklksvYq6+wm9tO0QNXHpPhnvv1OO8Gxasb/xjreX3EAnkJMauZJNte9RX
	 +j33Oi3kw3RpL85uLgocv/cGxAbc2qoHBUFqTnRVaKQEkyDSUJ6/736D13KHA84ePL
	 vmAEwnZpQt4LYwfmXXcNfysmWLN0GaDgdLEn2UJUcD7yLnTyiltPVJE6nrBhkOvhwz
	 MMHsLsmY1JW2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A83C56132F;
	Fri,  8 May 2026 09:05:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B626317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B63484250
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7f7pcHI3Sps for <buildroot@buildroot.org>;
 Fri,  8 May 2026 09:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F2C484249
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F2C484249
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:05:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3523885517; Fri,  8 May 2026 09:05:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 10:52:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 108f51c1b35479a8c1c3c3d9ab58589ef26217f3
X-Git-Newrev: 952aa90078dcba233b5b9723f4855ade4a695b4c
X-Patchwork-Hint: ignore
Message-Id: <20260508090515.3523885517@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: security bump version to 8.5.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/952aa90078dcba233b5b9723f4855ade4a695b4c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.php.net/ChangeLog-8.php#8.5.6
https://news-web.php.net/php.announce/492
https://github.com/php/php-src/blob/php-8.5.6/NEWS

Fixes CVE-2026-7263, CVE-2026-6735, CVE-2026-29078, CVE-2026-29079,
CVE-2026-7259, CVE-2026-6104, CVE-2025-14179, CVE-2026-6722,
CVE-2026-7261, CVE-2026-7262, CVE-2026-7568, CVE-2026-7258 &
CVE-2026-42371.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d400f8e0bb..c85df44d73 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  95bec382f4bd00570a8ef52a58ec04d8d9b9a90494781f1c106d1b274a3902f2  php-8.5.5.tar.xz
+sha256  826c600b7c6f956bd335558ca3bdbcab23b22126c1cc8d9348be2280a2204bb7  php-8.5.6.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 9976884001..0eae93fac2 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.5
+PHP_VERSION = 8.5.6
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
