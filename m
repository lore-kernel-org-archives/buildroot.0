Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAA7F9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C78806E9;
	Tue, 14 Apr 2026 17:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HhEmtwxo_u3; Tue, 14 Apr 2026 17:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD2080681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189592;
	bh=ktB1TxWkjvu/wjdEoHV5yRZ+86pznfdbivzTArGktIc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gNxryWHWveBs26WxLRk9diYRM9IIeH8sfcJE29jb3xLwmc//NTC3P1dcLXy6EPcG/
	 QTo4CO82uZVx4btXUbgw8hSV3b5C6urLD5mnXY8HOuYBGjcv1UQ3bLw6yVSmNQvhqg
	 8+sOmQ5L1Fp6f/r3AZusdxKM+tq3KGNdbaYBM6HYytBo2xuvXqVzsAkUO4W0QDqLkE
	 t91lPefouLJhoVmGwtDiuHGZYWgY/JGc40Uk1dsMrb5ApNrYJNKNBwLau6awo6AUe7
	 XPJ0kzcocRW2zgUFt5+agHNKw//8kCApkiK4Wi6rk+P+Jve3m/5dyMPTDc/DlCKacr
	 dtvWc7yETmqEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBD2080681;
	Tue, 14 Apr 2026 17:59:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB132375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C159A42C99
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ERSPCgZfQBw for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5EB942C7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5EB942C7B
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:59:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77947800A3; Tue, 14 Apr 2026 17:59:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:57:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4264a174b0450e0d966d479c79c979c7d8dab761
X-Git-Newrev: 25ce346dd9ebc56c17cc360f030daf78b9a58f6b
X-Patchwork-Hint: ignore
Message-Id: <20260414175950.77947800A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoundtouch: bump version to
 2.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/25ce346dd9ebc56c17cc360f030daf78b9a58f6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://soundtouch.surina.net/README.html#changehistory

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsoundtouch/libsoundtouch.hash | 2 +-
 package/libsoundtouch/libsoundtouch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index 853f3b90bb..f208f350c9 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3dda3c9ab1e287f15028c010a66ab7145fa855dfa62763538f341e70b4d10abd  soundtouch-2.4.0.tar.gz
+sha256  e07abf20ce8f95850c280132e1f61ad400fc1f4011b7fac698a503de6aab6733  soundtouch-2.4.1.tar.gz
 sha256  84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 3140d890f5..e7b25a69a5 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.4.0
+LIBSOUNDTOUCH_VERSION = 2.4.1
 LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
 LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
