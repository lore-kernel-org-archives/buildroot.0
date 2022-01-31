Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512FFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 23:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D805B4036F;
	Mon, 31 Jan 2022 23:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oq8cV-IuzOna; Mon, 31 Jan 2022 23:02:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD019401E1;
	Mon, 31 Jan 2022 23:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B08651BF836
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC68E82C84
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRYrANM0oec1 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 23:02:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0EB482B34
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 23:02:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a13so28372296wrh.9
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 15:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+DQAL48IbjdBZm0GV+yHxotPJCYmpXpUDYYjFQ6uqc=;
 b=Sz8wXxIWLOH/A8NVHJttVPTBbWkkeIFEo86Ua74IkSXgBAZwYCAsQiC2tfwm37sxai
 fx5Eh3l6gW5HBEBkOpc+PL6BPob0hxmu6wW+trxEcY3dQxV1s+mV21D9l+DsMKHb29no
 ykUJmw88ZIatByGt2NLoUwczs1Es5vRawdCDNP4EHQT832hl+LCWuvAPt2HVfynpkg5Y
 QSaagyyD8u+ARFUWUW8bBxthxEZk6JxegNUjwpduGYADAC1kBEuf27E8O787rTrYeGJ5
 3Ii8fz8QfSqX4dsEb3qc5ptnagzit552fQ4kxNCMuv32HWNleOG21OYczrwer2SgMl3b
 dujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+DQAL48IbjdBZm0GV+yHxotPJCYmpXpUDYYjFQ6uqc=;
 b=q7s/jtnfg38/X20ahVsyGNylhdnqlpPkA7xs/YKHz0w2nTPqljnt9PYPMX0rUfQbGU
 dO8O1lE58y1+xeVpfN9434+qsfW8QdZzu9PnPvXUh6qlubImPNxI0x1UrzctZIazHYc4
 3gla6FUE1EBTFBvPo9RVqhtHFpRN8IdA69Rt1RV6svBV+f80R+KNI6pbsdFR7QpUPiTR
 bKk6A75DvPlkCxwl2ZUGgntB8+jzeMKSsqI5vx1Z4CJOULpKjjgRAakiVdU1FJF1sxlr
 tkNcXF64rJViQ36kkA3DbegfmALhYJy3kRMCPfTS6MCNGMe+bNerJu3ULh2aCnwDk6mB
 Zf4w==
X-Gm-Message-State: AOAM532GKYsWgkl1E56wx2PCkjYhiyjl3lA7kNs493tK6AinowFG/Jfh
 1Xx1y1VlBQGhPVQwsTjGXaxY5oJt/Ss=
X-Google-Smtp-Source: ABdhPJxi32WW6Kcgpc0zFfUxnN1ll0wXzpnolcgurglTQqh5MSpu1KZjar8OIP5RofoxcHP1+I/JnA==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr19717003wrz.414.1643670147565; 
 Mon, 31 Jan 2022 15:02:27 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id bg17sm926458wmb.2.2022.01.31.15.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 15:02:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 00:00:15 +0100
Message-Id: <20220131230015.181368-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iproute2: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump to version 5.16.0
in commit 8f54d6d7859c0eabf303a44b26e6fafb1cb50143:

ax25_ntop.c:5:10: fatal error: netax25/ax25.h: No such file or directory
    5 | #include <netax25/ax25.h>
      |          ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/455840288bbe13ed585b0e2dc7b20a294dd1eee1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-lib-fix-ax25-h-include-for-musl.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch

diff --git a/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
new file mode 100644
index 0000000000..1f8860c5d8
--- /dev/null
+++ b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
@@ -0,0 +1,37 @@
+From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Thu, 13 Jan 2022 08:14:13 +0000
+Subject: [PATCH] lib: fix ax25.h include for musl
+
+ax25.h isn't guaranteed to be avilable in netax25/*;
+it's dependent on our choice of libc (it's not available
+on musl at least) [0].
+
+Let's use the version from linux-headers.
+
+[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
+Bug: https://bugs.gentoo.org/831102
+
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+
+[Retrieved from:
+https://github.com/shemminger/iproute2/commit/8bced38a941a181f1468fa39541e872e51b6022f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/ax25_ntop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
+index cfd0e04b0..3a72a43e9 100644
+--- a/lib/ax25_ntop.c
++++ b/lib/ax25_ntop.c
+@@ -2,7 +2,7 @@
+ 
+ #include <errno.h>
+ #include <sys/socket.h>
+-#include <netax25/ax25.h>
++#include <linux/ax25.h>
+ 
+ #include "utils.h"
+ 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
