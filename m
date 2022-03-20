Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8758DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 15:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE53C40586;
	Sun, 20 Mar 2022 15:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzdZgT1u3Kv8; Sun, 20 Mar 2022 15:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEA8340576;
	Sun, 20 Mar 2022 15:49:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD4E01BF57C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B381E40576
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8o57sOaNZ_N for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 15:49:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80FC74056E
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 15:49:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id r7so7280978wmq.2
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jpf+nFSpcJofA4SBIx6oKjY0myAsLY0AEhsLXlDWlmI=;
 b=HAjW8iBv4aSXMisjaFJCkyZ9XW6FQjiH8sjL0CGh2Wtka2ZKlBcuNDNg0YnpEWgp6J
 THpAKLm+tmSvxw/0S+xcMfOLmD15/aoGCWDBko4LeM+/JfLmIrjLQT8epN5ugM21shNx
 dhLMhp+SvxhCn7hxjoJJq1UpsRoP3YWL5ZsZYPnfy/43HqC1KDwzb0zCqVEG3a6kGzdJ
 +WWDMwNtorXKx/VbdFjuUJ3CSlw7Tf2GtVumd70WjxQl17cUFhpzq4MSLw4lPWcUigNP
 lZNqh0mmCLFeWvXSX7aA6dyaDcH8floFF/NC+rq9Dj6LAk3z38ULhhKUu7niPOmtMuTL
 QgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jpf+nFSpcJofA4SBIx6oKjY0myAsLY0AEhsLXlDWlmI=;
 b=hA3k9Chg7NJrQ/idSsdRTxNiUWNk+csiHXOt/r9JJbreTK7fjWuUZ6MiZDHoig0xg3
 nwbgLOt3yBE2mAxKg406cVVXrb6o9rz9wtpT8ks2wZ45LdMaFqENlN2hqyyW+w4C4z7Q
 RXUBA7wAXUV14eXgxsM17aOiE+Ib9XL4MsZOkMcyjtrRTTRymUbK3tWCYV7uK4T83qR6
 2LNmiDDEu4w6LDJdpSRj0gd4u2RKXpa7PocXFlXa1rmwCRi5TP3AqcTCg3HxwOrtFNq7
 K34xp8F8E4sPiQM94AUDTqvcyH/vV6/5QQiYzOiEZdBwEF7HK5fitvKhEfFj0eUGrmbd
 IwGQ==
X-Gm-Message-State: AOAM533JQ09deo5ItdyPMar+gEP7Xdk32OGKh0NhFUrmgI4f3FLiYyx6
 ro4xpnfacAXwxO3Si5y5nI11OMHCSo0=
X-Google-Smtp-Source: ABdhPJwM9kLIBX/kvti3VoXICgV9hMOte0VAEuoM/d/xH5wNo9Yw2SpdR47hfL1MjwuySPekesbaJg==
X-Received: by 2002:a05:600c:1e02:b0:38c:a5c2:243 with SMTP id
 ay2-20020a05600c1e0200b0038ca5c20243mr1034288wmb.150.1647791347277; 
 Sun, 20 Mar 2022 08:49:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r186-20020a1c2bc3000000b0037bdd94a4e5sm11792699wmr.39.2022.03.20.08.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 08:49:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 16:47:50 +0100
Message-Id: <20220320154750.1273563-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: fix build without
 threads
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

Fix the following build failure without threads and openvpn raised since
commit 0199dc161769e5f28e9aebc634230ece08ff5008:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'

Fixes:
 - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h-core.c-fix-build-without-slotevent.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch

diff --git a/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
new file mode 100644
index 0000000000..5b2829c5ca
--- /dev/null
+++ b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
@@ -0,0 +1,37 @@
+From 754911f553414a77d5b52001f5ef6e3a1314c4d5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 20 Mar 2022 08:50:15 +0100
+Subject: [PATCH] lib/pkcs11h-core.c: fix build without slotevent
+
+Fix the following build failure with --disable-slotevent:
+
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OpenSC/pkcs11-helper/pull/50]
+---
+ lib/pkcs11h-core.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/pkcs11h-core.c b/lib/pkcs11h-core.c
+index d7bb4cd..0bf11e8 100644
+--- a/lib/pkcs11h-core.c
++++ b/lib/pkcs11h-core.c
+@@ -726,9 +726,11 @@ pkcs11h_setProperty (
+ 
+ 	switch (property) {
+ 		case PKCS11H_PROPERTY_SLOT_EVENT_HOOK:
++#if defined(ENABLE_PKCS11H_SLOTEVENT)
+ 			if ((rv = _pkcs11h_slotevent_init ()) != CKR_OK) {
+ 				goto cleanup;
+ 			}
++#endif
+ 		break;
+ 	}
+ cleanup:
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
