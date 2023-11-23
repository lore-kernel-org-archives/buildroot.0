Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD06C61D97
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 17:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C33E140519;
	Thu, 23 Nov 2023 17:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C33E140519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQB4fny4ghFu; Thu, 23 Nov 2023 17:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7EDE40549;
	Thu, 23 Nov 2023 17:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7EDE40549
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA43B1BF3DD
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 17:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF73341FBF
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 17:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF73341FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MF6fTIZEbxep for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 17:40:02 +0000 (UTC)
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BAFD41FB8
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 17:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BAFD41FB8
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6DgErHsQa54nL6DgErkul8; Thu, 23 Nov 2023 18:39:58 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 18:39:57 +0100
Message-Id: <20231123173957.2385041-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPRsb+wTnWNdH/Phcvu1J5EzUYAz1+BR5dEFwYhCgWpS6rieVXumxA3MJZsw5JMhkVoqRU0zewjj37AiqNuJUF+6pEAGgYuJjQaTwocZLseNCraYAzAb
 DzXxQ8yw/NkCvue0m8ur/mgjBUuqHTc1p8z7eyOoeBh0ddyzhKG9Y0oTREpblgJb5QGW1pw0TCO5Nbn5+MDzUZXiWlHSnTm1yhAhGRhuSDxV79Bjftw4WKc1
 GLxIuklfH0xmoxbexrr35CS/OnNwTXqxBBWZFKbr5BvjdGz8x5ykSeZ+n7EuRr1+vtj0oIGd+KObOYWUOLtRTQBIa7b18JtVN6ByOTO1DU0DyEv4SE2aKHNj
 Z1ap/WGmAER6dTnl+wQfbNSY3wRZiZ5khkrD3GH3VY+JS0qso6nz5jKtd//+YCU5J4rlD97d
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700761198; bh=Ho3xq7IAvf+c65x7elA/oqF2Mtd5yEO37GDA0T01UHk=;
 h=From:To:Subject:Date:MIME-Version;
 b=PbKkgWndrxMtr1wnNYnfc8Fi5zZHkwd/12Xkbi2lnIKB9h/9Fa2d9LKRhzJ0+l/Ig
 gQed+uLF7OhsQiftjlXO7Xwio08Tmx1vvdneM4W/eXHC+e/D8CL+yedQ9Qgi0uC0qz
 gEmt7GBa0CvAN3+yfP8MoQSHDZsQVAYLtN/dq8cyaljOC1nEA70BqnQF/fKj3KNGms
 LkAV41z9nS9aZc4tOeLp0GWIug87LWpEKom0oiZceOht0KfpdQx9lcg8cYAeWZ8Mt/
 48A63hWjwdQQdh766TAeLJ8P/xAN92RA/yWzP2mngjVFyqN5afvvlByiG1U3JHDfQ5
 YqTaIdA8HnRqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PbKkgWnd
Subject: [Buildroot] [PATCH] package/swupdate: workaround runtime update
 failure
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jim Reinhart <jimr@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 James Autry <jautry@tekvox.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

If SWUpdate is built using -Os optimization it will fail to update using
Mongoose webserver randomly and always while using option
installed-directly in .swu file generation. So let's workaround the bug
by building with -O3.

Reported upstream:
https://groups.google.com/g/swupdate/c/oHMihNw8ZHA

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/swupdate.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ea4a5a62e5..7801be07ce 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -217,10 +217,19 @@ endif
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
+SWUPDATE_CFLAGS = $(TARGET_CFLAGS)
+
+# Workaround update failure showing up with -Os
+# Reported here:
+# https://groups.google.com/g/swupdate/c/oHMihNw8ZHA
+ifeq ($(BR2_OPTIMIZE_S),y)
+SWUPDATE_CFLAGS += -O3
+endif
+
 SWUPDATE_MAKE_OPTS = \
 	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+	CONFIG_EXTRA_CFLAGS="$(SWUPDATE_CFLAGS)" \
 	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
 
 define SWUPDATE_KCONFIG_FIXUP_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
