Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108CBCD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2F66167C;
	Wed,  3 Jun 2026 21:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlcrK55mZJtb; Wed,  3 Jun 2026 21:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA1060FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780520582;
	bh=bYGMZdijhiJC0ToV21MiMaVBRP9GCsNdpRptdil1I7o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zsh34hLhKcSNLKe+9asd2nNbELh6YMOLLm7wWYOYX4vCPUvWXNM1egMqKkO/WXFNM
	 BRU51RoRY++t63FneX7iR7AHUemao2U3TLrMsp0PUEFNelPNtRaJFJNrxJSKMKHzRP
	 U2SWrPZhnFT38x4Bf+KI26BYuNt44FaMA9oiUAcSWj6bCDhXtIPhOxD5H75USZXNeZ
	 X/oYG3MgbOrOS5QMLGgEHW1pbjIsjX5CXWy09cCi6yIG/tB0UctkcMb5Z+IucJDNPA
	 JtK3kHfTJ+xqD30sJYRZF01Pl7F5TBzoyc+AeGqdNGIjlm5KMtDaYoAHD6MZYX1kMd
	 Lrm4FpK1ncIrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA1060FE8;
	Wed,  3 Jun 2026 21:03:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16EBE2F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F14344236A
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtjnLXIRHmUr for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 515F842366
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 515F842366
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:03:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42B26879A4; Wed,  3 Jun 2026 21:02:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 23:00:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e35ac186f1494f55fa83fdf1f3729f0d2a44edf0
X-Git-Newrev: 720343782503cf9e1e12a7dc37373513289498c0
X-Patchwork-Hint: ignore
Message-Id: <20260603210245.42B26879A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/transmission: bump
 version to 4.1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/720343782503cf9e1e12a7dc37373513289498c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/transmission/transmission/releases/tag/4.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index d554f8034e..45a3863dca 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  e743283ee03a42c4d0b08fed2bd52b554aa6c9f65b4d4d45b795c32d98762a79  transmission-4.1.1.tar.xz
+sha256  4c6070bdfae264a629cb2b0f1eaf567cb9c6208f9218aa446c0aee883eb0f1fc  transmission-4.1.2.tar.xz
 # Locally calculated
 sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index b7e204dfce..c811dcd6e5 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.1.1
+TRANSMISSION_VERSION = 4.1.2
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
