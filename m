Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3C3E6B240
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 10:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E3CF8210E;
	Fri,  1 Nov 2024 10:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6PTxpILGxzs; Fri,  1 Nov 2024 10:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B2C58210F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B2C58210F;
	Fri,  1 Nov 2024 10:53:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E79423B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 10:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C89268210E
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 10:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJxKEYwKulhA for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 10:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE1F58210C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1F58210C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE1F58210C
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 10:53:01 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4502BB0053D;
 Fri,  1 Nov 2024 11:52:57 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri,  1 Nov 2024 11:52:49 +0100
Message-ID: <20241101105249.2198353-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730458378;
 bh=Wp18aV2sghD5DanP4g9EAq7fSr0gNhqb7A1125QlhYk=;
 h=From:To:Cc:Subject:Date:From;
 b=YiagTiCf1l19S4IdbF544M8yVdZoknHX5pZWp5bx53ImHx/4cZzhMYn5LTqwVY2IN
 FxmmXsUw4VuBoE6nymCsVyZboklpUl1z1O/zKFsBssKxmWqEarHoAuVLOPFQkVXAao
 shAt+PCwmGgabBKcQu1E2Z+cpZk+TZCcJF5oSVtcGVfloWOPzJ4simS/XFPd2b+WNl
 zqA6g8EaCCA9OoPtwAAJDS06sfaqydfMXZwrgxst5In5+gI891kuUG3jUa9IviZXh1
 hStf6Z0vnmWhWQhmQzRkI852t4fm9Ve3UheYOOSnYICJIMNYG35TMVjTol1KOclXMU
 FoYHWjkmJCjdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YiagTiCf
Subject: [Buildroot] [PATCH 1/1] package/libnl: bump to version 3.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the commit log, see:
https://github.com/thom311/libnl/commits/libnl3_11_0/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 0254077 with commands:

    utils/test-pkg -a -p libnl
    ...
    41 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 77d7781493..caf75616fe 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,4 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_9_0/libnl-3.9.0.tar.gz.sha256sum
-sha256  aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb  libnl-3.9.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_11_0/libnl-3.11.0.tar.gz.sha256sum
+sha256  2a56e1edefa3e68a7c00879496736fdbf62fc94ed3232c0baba127ecfa76874d  libnl-3.11.0.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 6f50fd6afc..a0441b7835 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.9.0
+LIBNL_VERSION = 3.11.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
