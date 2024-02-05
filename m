Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9792EC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B19540AB8;
	Mon,  5 Feb 2024 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B19540AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jitvu0iq3-CH; Mon,  5 Feb 2024 17:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A8DD419D6;
	Mon,  5 Feb 2024 17:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A8DD419D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E48571BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCD9E60F86
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD9E60F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXeixGO69A-Z for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:23:31 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6FD160E96
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6FD160E96
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X2gqr2Ms4l81fX2gqrWG8Y; Mon, 05 Feb 2024 18:23:28 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 18:23:27 +0100
Message-Id: <20240205172327.2537523-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205172327.2537523-1-giulio.benetti@benettiengineering.com>
References: <20240205172327.2537523-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKnvDMa2gyqiIlETH3FmAgozwrmlPJRSK7zzcepJxJVK3wOaA7c7Ey5Oc8TiuaQELkRkUT0350jmpu+V2oWBkUqwNjgogMb3IvldyLBCCGgkIZJBCEiZ
 ag/ki0G1b9SYIjevkEEBi8PdTZZjbBItNa0d4vGtQwKYD3XnIro4NX7jLXLUqblvr50Wv/SR4M410GamF7kWZcy3gt8YHbtM/x3J38vFeyjv5TBK1HB08KI7
 Z027V8dWVpP46MTAnyXfQgzufu2ESDbZ4hf3Qiks/8yECmN71gSVGt9ocOGOoz95pNLTiAXT41dzC4ghr3v6I6DCvFXkFAie7AMYaY9UQ+x3+o9DFZRkR7hX
 B/XWWXHvAvrJtnfANb76Do6c5QhqCKq3KCvDVOr3s8F6NhaTGTI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707153808; bh=lc6g4baOl3GwOo4hajrA65FRbbjrhtlsLubn9izOiY4=;
 h=From:To:Subject:Date:MIME-Version;
 b=iyI96cZuC7dt9kGO3Yj76aL5XuR9HzFsY8VwXfMfw0/Nc6KSiZhkeHu30xt0X251i
 sVj5jhtP0DfmX0OlGfgTcX8XvgFRz7bT64nLx7lv3WV+cv7NB+34gDGUEtjJPmCmrV
 yJaAXb0cpif4tiOLfhz0I/UXQZUd8mXN9qpvrBpRuM6NrOHwNXuvAeKQ7RGePwmrWj
 bIe5yWLugcqdYEe98JjzAOL4zTJXqvGo+sPHz5XSQAIZgejKsLL7rVNiZv2tnRRNue
 gKnCqkGRmxCPKGJiwDhVCMuUjWuvwicwMnfzb/Vgd3Yollq94HNVBCELfE9YnJkmnO
 FnO7JB/5uU6Xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iyI96cZu
Subject: [Buildroot] [PATCH 2/2] package/htop: fix build failure due to gcc
 bug 109809
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The htop package exhibits gcc bug 109809 when built for the RISCV64
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_109809=y.

Fixes:
still not happened. It shows up while building under docker-run this
pending patch-set:
https://patchwork.ozlabs.org/project/buildroot/list/?series=384841

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/htop/htop.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 6dbaae3796..853620dfe8 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -13,10 +13,18 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
 
+HTOP_CFLAGS = $(TARGET_CFLAGS)
+
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
 HTOP_CONF_ENV += ac_cv_prog_cc_c99=-std=gnu99
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_109809),y)
+HTOP_CFLAGS += -O0
+endif
+
+HTOP_CONF_ENV += CFLAGS="$(HTOP_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_HWLOC),y)
 HTOP_CONF_OPTS += --enable-hwloc
 HTOP_DEPENDENCIES += hwloc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
