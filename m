Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B291C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 21:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 180A3408A7;
	Wed, 18 May 2022 21:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntLjJiwy5X5j; Wed, 18 May 2022 21:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01F9340469;
	Wed, 18 May 2022 21:14:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D64FA1BF410
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C43CC610FA
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXqum_kOiRFT for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 21:14:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2F67610F0
 for <buildroot@buildroot.org>; Wed, 18 May 2022 21:14:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k26so1825248wms.1
 for <buildroot@buildroot.org>; Wed, 18 May 2022 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ps+tlZMRjk3sa50YAdiusge575fhg/euGpQCTl42njs=;
 b=g/I8nCtBcNE5UpF3qeUaaH5sUSvTDZV+S4e6tt2+5m7yOWjIRDgX5bAF2tOPXIpvYz
 wKf+OtkLDJpSNqn0RfqfGRdKtY5rNEWOf7tBgcG48FfoxDJk5/spPtKBqqEeVfd4mtXT
 EynC+oBcLF7oXipZnnoVM8oCBZknpbtpltCztJqWc3I0II0zRojSkR5j5HsJ0FfIGA8U
 RR5fkspLjgzXLUIDpgq6n0WrWOxv6znGcSlZpnARkhT4gnglhQEa7u1/I0ljLrdumZit
 f6jvXZ0lMIMJ67Jlvj4xe/hidGKGSqVkUrwHHfK92xyYHl+4vppzm2Djb6sDe+VjrIUX
 cJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ps+tlZMRjk3sa50YAdiusge575fhg/euGpQCTl42njs=;
 b=oVGfA+xgAqoXIcGPJqxe++jb84fwpFFK/UzDmjkhbMhb/fe0LS+zLHAS6zEP5xDsmd
 22IpUgmj0WKK6g3WRG14tlQndC4S+5RQ7bM70PT+VMr4b1xZwQ9zKuHfUUVptIizFfKX
 8l50LY5LPKYhI4dFeBPqvgU2wDDQo0Zhz4Jxytss/DvSfIFJeIKh0avivgxYpuTSfI36
 Ya+OkUCQGr6i5B3iJCLrK8BKWw61P3l3RYmZR/Y08SsGcwdKLrtH5pLVIwP5J3YBGyYV
 7qMO+7BLZTOq8axSWCQKhAu2ZnoA4cETpCiuecFkEemooE8hqLCIMd/9jATiptV+RZMD
 t6MA==
X-Gm-Message-State: AOAM533ubih9CTaerR7ZydOkG1rm+DlxAN41rSYwGlWaI4RK76tsO4Bx
 Gzq7QuNLIF75JcY+24+JY4acsnYGBL4=
X-Google-Smtp-Source: ABdhPJxGGbdob/7BMxKWgvZVs91SagvwmxLUxxXR9ydWxv4INf4HdtHsmO90NvEMZW3S/NURqWUugA==
X-Received: by 2002:a05:600c:4f4d:b0:394:6ead:3523 with SMTP id
 m13-20020a05600c4f4d00b003946ead3523mr1023502wmq.109.1652908457492; 
 Wed, 18 May 2022 14:14:17 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b003942a244f30sm6303355wmj.9.2022.05.18.14.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 14:14:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 23:12:00 +0200
Message-Id: <20220518211200.431651-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openvpn: fix pam build with musl
 and libressl
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

Fix the following musl build failure raised with pam and libressl:

auth-pam.c: In function 'pam_server':
auth-pam.c:894:23: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
  894 |     char ac_file_name[PATH_MAX];
      |                       ^~~~~~~~
      |                       AF_MAX
auth-pam.c:894:23: note: each undeclared identifier is reported only once for each function it appears in
auth-pam.c:894:10: warning: unused variable 'ac_file_name' [-Wunused-variable]
  894 |     char ac_file_name[PATH_MAX];
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c8834fa5ddcac6fd22fc9406e10221e64cdb8856

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h-pam-c-add-missing-include-limits-h.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch

diff --git a/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch b/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
new file mode 100644
index 0000000000..34a6dbd034
--- /dev/null
+++ b/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
@@ -0,0 +1,41 @@
+From 0fed64a91d894b46105bf7e8b16edea4d90ab70c Mon Sep 17 00:00:00 2001
+From: Antonio Quartulli <a@unstable.cc>
+Date: Thu, 21 Apr 2022 15:19:09 +0200
+Subject: [PATCH] auth-pam.c: add missing include limits.h
+
+On most systems limits.h is pulled in by some other header and thus no
+error is ever triggered, but it's possible to find the right environment
+which lackis this and prevents compiling auth-pam.c (possibly when using
+LibreSSL).
+
+Include the header explicitly as it includes the definition of PATH_MAX.
+
+(note that this bug is fixed in Gentoo since 2020 by including a custom
+patch, but apparently the issue was never reported upstream)
+
+Reported-by: Michelangelo Scopelliti <kernelpanic@gmx.com>
+Signed-off-by: Antonio Quartulli <a@unstable.cc>
+Acked-by: Gert Doering <gert@greenie.muc.de>
+Message-Id: <20220421131909.32053-1-a@unstable.cc>
+URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg24136.html
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+
+[Retrieved from:
+https://github.com/OpenVPN/openvpn/commit/0fed64a91d894b46105bf7e8b16edea4d90ab70c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/plugins/auth-pam/auth-pam.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/auth-pam/auth-pam.c b/src/plugins/auth-pam/auth-pam.c
+index f893b51fe3..7033944568 100644
+--- a/src/plugins/auth-pam/auth-pam.c
++++ b/src/plugins/auth-pam/auth-pam.c
+@@ -47,6 +47,7 @@
+ #include <fcntl.h>
+ #include <signal.h>
+ #include <syslog.h>
++#include <limits.h>
+ #include "utils.h"
+ 
+ #include <openvpn-plugin.h>
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
