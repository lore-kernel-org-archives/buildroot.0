Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2968C109C05B
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 20:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA9EA6069F;
	Wed, 25 Mar 2026 20:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lawXjK9R1kNm; Wed, 25 Mar 2026 20:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE322606E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774469323;
	bh=pHASjDWVahC28/9NiIx3LhioamREwCUatcvpZYaeD/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rZB1dYJ7zaj+agbkZD6AcUHEQqSeDLG3eTyPqZvs/JBQMC0xJEOHWqScld3EXqOrE
	 mXpa4ADdaPML7xsPhO7ZLk+5TuWGMeIMaxsGnLa05ChiNxvIz9SN+bj8PorKlLJulM
	 pVR8gcIbMtQEl26vW1eR9y3rr3ccGxaO4iF+NoeWjefeZpXdcGFQtEIQrCeJt4FEza
	 wdeChXafnuV9fSZI7f8uaAyeJaIzxuOTcToMrxRI4cayOy5ugSTj4jkujPZBezJWMJ
	 VbbQPzoEPHsLpBZ76/KUYmIMGp+Y4YafqYJOXaaczg3ex0JzzngOqZeyvbR9hahzsg
	 +XaaSqYJLYrEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE322606E5;
	Wed, 25 Mar 2026 20:08:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5EDB1D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C07C40B43
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITtb5qzsE_qW for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 20:08:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA3EF40B13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA3EF40B13
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:08:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36AF97F88D; Wed, 25 Mar 2026 20:08:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Mar 2026 21:04:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d26ff6c144e17327351dcf8aa5dfa6181afee85
X-Git-Newrev: 0fa55218f44e30d62843e0b99921a4b26e6aa6c7
X-Patchwork-Hint: ignore
Message-Id: <20260325200839.36AF97F88D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.18.47
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0fa55218f44e30d62843e0b99921a4b26e6aa6c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/changelog.html

Fixes CVE-2026-1519.

Fixes bug:
GL #5708
https://gitlab.isc.org/isc-projects/bind9/-/issues/5708

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 4671eab985..09d35a3698 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.46/bind-9.18.46.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.47/bind-9.18.47.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  6b59f0de30c6901cce783007d06f7dd717ec3aa74b5bb5cc5159f93f0be4fc1d  bind-9.18.46.tar.xz
+sha256  9d544ba013decd1ee60e3c99d5548dd21aaaf5db96205dfc8623f39f061f14be  bind-9.18.47.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e58dcda34d..b889f922b6 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.46
+BIND_VERSION = 9.18.47
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
