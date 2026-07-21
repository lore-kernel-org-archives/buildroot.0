Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68A8C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 19:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8497B605D3;
	Tue, 21 Jul 2026 19:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEBaeqFQ5PWA; Tue, 21 Jul 2026 19:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC0460632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784663416;
	bh=jSXu3Md1qheONazyNbDGjFxydeTiCN6HBdcIHEUU8ys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MTGyGN574m10xeB739MfpeoCQY/A8I/kaVwxBlhiqCpCmI4u3Ix2pWCRkfOu+oN6s
	 L2sL3xlmmU0CGKGhaYj+H5cWRSmaD7tP6n5N3oKUkRX1txzHAdgVPILnJ2cEPxTYFm
	 hyKZELxWGV8R2W1lBwdJU6YuXci8y/RZLkiHEz0jeFlJODn9Zz8eKQEQIP5VYn1aO0
	 +UiUpsS4UMmUsm8Mu81S6CQ00cwZ75S2gy1qVmBmJ0Sb7wF/CzsRvbS68fJTDuDOGF
	 f2bk2+l5S9mwWdqA7mt5U0zPJWT3//WG2S9iBLQ1SfgDE812rm/05lq4YAUFHUbkMt
	 GYc86dcdiZTPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC0460632;
	Tue, 21 Jul 2026 19:50:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F319F109F
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D293F80DB0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPkmSR-ycHJP for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 19:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01B4E80C44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01B4E80C44
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3B308913B; Tue, 21 Jul 2026 19:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 21:47:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93e7a673e83ee9b66f10f70cd3c7c0a53dcee6b0
X-Git-Newrev: dfe3b3adbe9bcb06cf4e3ccd87c21363f88c7e65
X-Patchwork-Hint: ignore
Message-Id: <20260721194936.A3B308913B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqmi: bump to version 1.38.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dfe3b3adbe9bcb06cf4e3ccd87c21363f88c7e65
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/qmi-1-36/NEWS

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Aleksander Morgado <aleksander@aleksander.es>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 3962e925ce..b3af29df4f 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  e254fafdd916a78a27126e6d72ae436662487f59c7de84d4d40286059af89093  libqmi-1.36.0.tar.gz
+sha256  8ee3b3a9002f2b45c825deade85710db006e01674f5f9359d351c192cc926015  libqmi-1.38.0.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index c14caa3113..5bf737634f 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.36.0
+LIBQMI_VERSION = 1.38.0
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
