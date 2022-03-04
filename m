Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97CEC433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 19:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4345B841E5;
	Fri,  4 Mar 2022 19:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGgj2wg4_HYd; Fri,  4 Mar 2022 19:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CA7841DD;
	Fri,  4 Mar 2022 19:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE481BF2F8
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 19:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BE2B841DD
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 19:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlznwwTKnbv2 for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 19:06:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62A9F841DC
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 19:06:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bk29so14052774wrb.4
 for <buildroot@buildroot.org>; Fri, 04 Mar 2022 11:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vi2X+ycpFrope/mRb2V2RioBum7hbA2n9QfYo5GyHE8=;
 b=J8EWNWkMnQ0O4uyJWFBAulWgFoRhwUHN98nXH5YfR8fMTPqfXGk6Vu2Ax3xJfZu1jV
 YIQn+fu//TUXJLAXDzr6Fykml1G30KMKo6Ql2nB1gJmlEu9xa+wdJdHTXODp/xRmW67l
 Ni9Kxpa8sOzDbQvPo0r/9KMFBMjJDvo9lhk5Zu9xsMFIabZg4CfADWHAJFTRqVyX4UL0
 opC1vmuiX6P/Th8uP5zgVAnBs60yJwsvNPsn6EE2vgKk2tFrgbOw3s+l1TYUy4BSoFGz
 LXylpZ7d+L91JTmpcWRdoPKkDfIJ4XH8InRC+NbcIatxdQXCFy5q/RmrGoU1Ep04LjQS
 PcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vi2X+ycpFrope/mRb2V2RioBum7hbA2n9QfYo5GyHE8=;
 b=rf8gen2uCPhh2x3hcnspGstYwmPNRb8PSx7vgfwzFwStQ9QcsW4Qe4kERR8e9VtU4+
 jMeHv7zZHLXWqdd5CQsKZ7bJ2fDQy6L1cTQY/hxrcTRJMFLn2Yd4yCGOTnYIfkX6dOuV
 DgcBuLWrXPU60pqV+Jka2dziOfLbqXx6YqwgD45+vg5PjBjpqEn/C2Et/E3PU4cf1+hr
 hV9zZCZ3dqbm+DzKZIxNUmUAybNtbq31wDJIpCpx1bM6sStsx2ULhMuOaSTEjo1Vnrzf
 3OWkEKhdgHgBrHvk5tzj3Cz4zQu1gr+WNKWYDoC+JDbuFua8ZjVgF618B9FVVg/6CGeu
 3opQ==
X-Gm-Message-State: AOAM530iiMAG4aC0CxXSKRnHgxMC5XcnKZhaU+nt0jpR1BtC79tucena
 26/EG1073wh9Vv0LuPyBqg50tRoTFmE=
X-Google-Smtp-Source: ABdhPJxBwTOxAl3KPvlHT2wxf8Zb4UDRGW7myoQjj6cWv6CMMEfOXwTQ1qpHDf9Z6UzGeaGGdz3dtg==
X-Received: by 2002:adf:fbc4:0:b0:1e7:2060:d65 with SMTP id
 d4-20020adffbc4000000b001e720600d65mr109993wrs.583.1646420797335; 
 Fri, 04 Mar 2022 11:06:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d680a000000b001f1dabec837sm243085wru.113.2022.03.04.11.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 11:06:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Mar 2022 20:06:00 +0100
Message-Id: <20220304190600.4021243-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/weston: fix build without
 shell-desktop
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without shell-desktop raised since bump
to version 10.0.0 in commit f67a6e9b7a7be9adbc405b3126000056120a01af and
https://gitlab.freedesktop.org/wayland/weston/-/commit/9e90760ab054db2234f73374600489fa5584ad7c:

In file included from ../tests/weston-test-client-helper.c:43:
../tests/weston-test-client-helper.h:40:10: fatal error: weston-screenshooter-client-protocol.h: No such file or directory
   40 | #include "weston-screenshooter-client-protocol.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8ece588f52fc1b4e422f8bce9b106d9d3822f1a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ncy-on-screenshooter-client-protocol.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch

diff --git a/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch b/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
new file mode 100644
index 0000000000..927215380e
--- /dev/null
+++ b/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
@@ -0,0 +1,38 @@
+From 2ac6b6b084a877adde64db7faff2ed22eb3ea97a Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniels@collabora.com>
+Date: Tue, 8 Feb 2022 22:39:42 +0000
+Subject: [PATCH] tests: Add dependency on screenshooter client protocol
+
+Given that the test-helper code relies on the screenshooter protocol,
+make sure it's available for us to build, and the dependency ensures we
+build in order.
+
+Fixes: #588
+
+Signed-off-by: Daniel Stone <daniels@collabora.com>
+
+[Retrieved from:
+https://gitlab.freedesktop.org/wayland/weston/-/commit/2ac6b6b084a877adde64db7faff2ed22eb3ea97a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tests/meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index 2d464ddcc..222091cd1 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -29,8 +29,9 @@ lib_test_client = static_library(
+ 		'weston-test-client-helper.c',
+ 		'weston-test-fixture-compositor.c',
+ 		weston_test_client_protocol_h,
+-		weston_screenshooter_protocol_c,
+ 		weston_test_protocol_c,
++		weston_screenshooter_client_protocol_h,
++		weston_screenshooter_protocol_c,
+ 		viewporter_client_protocol_h,
+ 		viewporter_protocol_c,
+ 		'color_util.h',
+-- 
+GitLab
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
