Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17456C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 18:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA22940ADA;
	Fri, 22 Apr 2022 18:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypEqTCpmYRQG; Fri, 22 Apr 2022 18:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74E3540AC7;
	Fri, 22 Apr 2022 18:50:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBB21C11A5
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DA8561049
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVInXM8demwb for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 18:50:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34EA660FFE
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 18:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QIdi0FYV3BEVIVuZQHtD+3a5+/De0/wSPbz1MLYgmJo=; b=NDU98NPsj60VuvjjXEENG8S0IQ
 5h5kkCNIw7k+RKKs3vfWeK62QTHJav+WauMNTrywxzShbLxMxinsbvv4007b4/f5cZo+i611V8q3c
 W9HzzuzqLF4AsNOOBNUHP/dwXk/Ipldd6tAVt2bej4QGdHW7BSgD4/BMQKsFREZtC18Sw6oVsI8nk
 pUMi5M+ANf7giVwCj3OJ1OwdQTDpvnKZkvqnCR3pCCDJXGutJZNqFnIeuVPjV+3SPGSzMKPa8z3k1
 xYwZa5JzReohhNpDdSjgCh8Gs1b6HpXbWAOsjhzZYDoo7SmnfHV8IijLa1mKgzd2mw815/KvcNNfx
 hUmzi8Uw==;
Received: from 91-153-34-227.elisa-laajakaista.fi ([91.153.34.227] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nhyML-000Bq3-MN; Fri, 22 Apr 2022 20:50:25 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 43ba9d05;
 Fri, 22 Apr 2022 18:50:15 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 21:50:15 +0300
Message-Id: <20220422185015.3486540-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version 2.36.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release, with the usual flurry of correctness fixes, and a patch
to fix the build with the accessibility support disabled. Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 1e1aa62117..3923c32111 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.36.0.tar.xz.sums
-md5  b7b951cd7f6eb4a8585338505ce71234  wpewebkit-2.36.0.tar.xz
-sha1  904629a9ce3a4ab67d47315b008dc3152d504205  wpewebkit-2.36.0.tar.xz
-sha256  096aa9f87d9bfbfc80f558388a86721cdcc508b42ddef10bd270aec9aee96d5a  wpewebkit-2.36.0.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.1.tar.xz.sums
+md5  7ba1c7fd0f67891ad137d11cac12f7a9  wpewebkit-2.36.1.tar.xz
+sha1  0918a4daded01f42e65ec02a69f21cd6705311db  wpewebkit-2.36.1.tar.xz
+sha256  ec83d8b2f8c3479ce9950d69440f3b9876ab70200fe6f4e07686054a0cba5723  wpewebkit-2.36.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index df29d6f170..9c9a9a2838 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.0
+WPEWEBKIT_VERSION = 2.36.1
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
