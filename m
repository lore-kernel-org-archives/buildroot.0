Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAA3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 19:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D7F612AC;
	Tue, 31 May 2022 19:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xuke0s6DCLEP; Tue, 31 May 2022 19:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2C2612A2;
	Tue, 31 May 2022 19:50:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 323601BF85D
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 19:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EE8D612A2
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 19:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjfMrr-AdhPy for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 19:50:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A5E961296
 for <buildroot@buildroot.org>; Tue, 31 May 2022 19:50:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d26so14438175wrb.13
 for <buildroot@buildroot.org>; Tue, 31 May 2022 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M9XqOSUiMxBXt77mhBtY9ITgJiOl3fZv8cpw4Pl2LZg=;
 b=MXZfDHTR1Qb5x1opqf2ihQOVrBEXiQuwvIgD1i4qv04zuu3QW10ihG4KgSf/YXEj1/
 qYwGoU9WH/jhqH2nhGopxGAd2na523ssvTujvRbRZSzLpmKmhsU6tlUB/Mkdz2uIes9j
 KoAWQx1nyu70jNW9veXY2i//HV7l5buMqsKUpyAo8T6pfFMfB06Rd2ornv3UWdT9dNLJ
 8FbGu+wE82ZUAI+hjZHU2dO3JNHz6QoN8eD5X4PjD6N1EiPOLRWNdbz59eDFbaymUu2S
 cy8qrJ8v34GkW06XTdlaCD5uEI2ASnZCBinKGIU3NS7kUIhgQAo/rqXQaHlWhkojx95O
 d7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M9XqOSUiMxBXt77mhBtY9ITgJiOl3fZv8cpw4Pl2LZg=;
 b=mawLbf/DAM55JxzFIJbKdH2DcTJSeBjGS9kX0zaZvU3fPM+UHJV+5S90yZRhPkoh/M
 V4FLcbiUTkn4JqBULnhA2IVBdsrBIbqkFqIsSCRjeyOsBzCBqEbw9jmtzV3IKE1gTz4M
 EHdZsmJub9yuTUPoIWBzwBv5V8uM1WTNzyfM0FiqIbnSm/GIJuokyDwuo4U1Sqxu5dhz
 6HXLcW2NNQd5zPrsIxkZGVAeZyu/pmvAKhGoynLXiVQsdcisjo9mpZN2O0Ex/MjQwojo
 yJEONHRKXlzwKBLy6jDBiaTLrpElZnwDkCF59m1B26XDhda6up4qB8naIa132Yb45YTh
 YIsw==
X-Gm-Message-State: AOAM531qXHjyVPo18VzjDieKNFo/7tZVOVbcJ0WLNboUF4Dt8N37YfvT
 sWdifrIk3g1qxgM+WF1ziln3eeJiLoo=
X-Google-Smtp-Source: ABdhPJxB311HpbNHxD+bDLLaA+hkaVCT/rE99WDJUhUg2UIAS/OdqZnPDHbk4MFu+ZWvUuJE908pDQ==
X-Received: by 2002:adf:d08a:0:b0:20d:1029:4957 with SMTP id
 y10-20020adfd08a000000b0020d10294957mr49789162wrh.55.1654026635874; 
 Tue, 31 May 2022 12:50:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b003942a244f2bsm3797158wmq.4.2022.05.31.12.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 12:50:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 21:46:15 +0200
Message-Id: <20220531194615.468956-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rauc: fix build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.5 in
commit 41bbe8df540e2c630ad04f8db7383a7e7705f368 and
https://github.com/rauc/rauc/commit/be55282d71d967dcc0cf48303f8245cbc8fff053:

In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
                 from src/verity_hash.c:26:
src/verity_hash.c: In function 'verify_zero':
src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
   69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
      |                                                       ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...src-verify_hash.c-include-inttypes.h.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch

diff --git a/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch b/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
new file mode 100644
index 0000000000..916c8cca0b
--- /dev/null
+++ b/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
@@ -0,0 +1,38 @@
+From b19a9c26d88a913417e77aaf60c72cdbf393d1f6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 31 May 2022 21:22:36 +0200
+Subject: [PATCH] src/verify_hash.c: include inttypes.h
+
+Include inttypes.h to avoid the following build failure:
+
+In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
+                 from src/verity_hash.c:26:
+src/verity_hash.c: In function 'verify_zero':
+src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
+   69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
+      |                                                       ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rauc/rauc/pull/914]
+---
+ src/verity_hash.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/verity_hash.c b/src/verity_hash.c
+index db82a78..3b2c2a0 100644
+--- a/src/verity_hash.c
++++ b/src/verity_hash.c
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include <errno.h>
++#include <inttypes.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
