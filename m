Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A668D2E9D8
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 11:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B17E9606B4;
	Mon, 11 Nov 2024 11:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1a20OjEgXwx; Mon, 11 Nov 2024 11:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB942606B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB942606B6;
	Mon, 11 Nov 2024 11:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1B326C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 11:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9735C40360
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 11:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VVhnQB0ZcP1 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 11:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A4D44035E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A4D44035E
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A4D44035E
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 11:06:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2EA741814B9; Mon, 11 Nov 2024 12:06:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 12:05:39 +0100
Message-ID: <20241111110541.1934934-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1731323178; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Aff9ZHfo64VV5RT9iPxFWDFXGJuaC/yAhKp21U/NZqo=;
 b=mGwj6QwsTXCroadNn7nrotBF3iYZbVngzoszNCJgRyykJMrHNPHMF5Y5RjuIWhP6hXdAlp
 VpJpgIGOISkYnBGKn/GFKZ+RvgSBrTzE2HdNpOi1Qt4wkF0nl80Ck4HGMLAQSs8ykTyn0Z
 XyP3ivXzEudr0m8hQ0fAoheLSUBRgvI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=mGwj6Qws
Subject: [Buildroot] [PATCH v2] package/boost: update download url
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

boost moved its package hosting from jfrog to their own url
provided by the C++ Alliance. According to [0] the old urls
might cease to exist after December 2024.

[0] https://lists.boost.org/Archives/boost/2024/05/256914.php

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

v2: improved wording of commit message and include link to announcement.
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 61284b967a..c0d17f7670 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -6,7 +6,7 @@
 
 BOOST_VERSION = 1.83.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
-BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
+BOOST_SITE = https://archives.boost.io/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
