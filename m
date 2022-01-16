Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4D9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 22:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93C6B405AB;
	Sun, 16 Jan 2022 22:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WuJlypSBHvsm; Sun, 16 Jan 2022 22:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3B3640435;
	Sun, 16 Jan 2022 22:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA11E1BF3CB
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A48BE40435
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fB9-IK-4fpal for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 22:08:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 813AC403D6
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 22:08:50 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id p18so16620577wmg.4
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 14:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jOkf6RBOd3bpeLfzmFIe0H8YgZqneviiaNWVwsfL3ok=;
 b=NxRwXFnQQc+H4mtJYRG21GbgBDYkoDRmqJb4B9LFL7VRfNk/VDYF2EHvZYIpb5Na0o
 /ndT5RCCj5Jf1lfEzfS9JXLJPaie7drsQoXrEIedaopZRkBTeUxMeXu3KfV1zxHiFOVD
 8CEmciQrmOuHOMikRrKBa1AxWvYqdA8KJJ9QoCaraP+co5NXu78JiYA0pFFrPi23HSjl
 YduYBlN/f8g3nmJV7kqhr9WWiTWj6mxllZMQ3HW3bde7LG9aJe+i6d7WcLqttOtYPvdJ
 oFGDkc4k9i79dmNS+Dh9nsK+q1m4M1hz2l5dyf3MwMIPqJ1EXtXokgl2Ro6IlyGz6d19
 Utkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jOkf6RBOd3bpeLfzmFIe0H8YgZqneviiaNWVwsfL3ok=;
 b=e1GvA1YlHrxESNnM9ijYlcYshBo5ZTIiPppw8IxJcmqKj99esMjyDcaEMiVtrAyxLG
 JOUdcB4xlXM0hExIrRsEEGNw/CdK8E61VAYFe8J+dggsqnYbRIXO42JLrf9B10dTzkYI
 AjwDXyjE6wilZqvj/HuePovmFvq6ZKhC3wpKV9w09TMPM+mLzmGXCIylHzBlL41L1PCo
 HPsjsS0sVzK56kPwizFjFAKtotmAyEj3ekIcmApkPMLW7ynQAgq0RDN/IvhFN1QApoNz
 /QoAQDkQDrHXvajwPs1l9ZcRgfqjehnxFaNlKIwMr5vIbmrra38Nhs5E5q6s43jH9u6O
 WEEw==
X-Gm-Message-State: AOAM530fqizDUsfh4BfJHHnPGy7KQ4qwRwvjSiLu6dd/HrnSwMVC+Zx9
 3Xaqi4hSJ9OdTNHtfVkLLLGZ8cciNEk=
X-Google-Smtp-Source: ABdhPJwBP7RyVgbCU4Dtlh3JSiSI3iKJ4ElxDyUjTXZ/CEYrDCsim1FEHp0GhN/YYr79YfKCduxwnQ==
X-Received: by 2002:adf:ffcd:: with SMTP id x13mr16615245wrs.672.1642370928695; 
 Sun, 16 Jan 2022 14:08:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id o12sm3825222wrc.51.2022.01.16.14.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 14:08:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 23:07:24 +0100
Message-Id: <20220116220724.3460985-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liburing: fix static build
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

Fix the following static build failure raised since the addition of the
package in commit 03ca6f4e39874583060317e7e15e9e360220877e:

>>> liburing 2.1 Installing to staging directory
PATH="/home/buildroot/autobuild/instance-3/output-1/host/bin:/home/buildroot/autobuild/instance-3/output-1/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" /usr/bin/make -j4 -C /home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1 DESTDIR=/home/buildroot/autobuild/instance-3/output-1/host/arc-buildroot-linux-uclibc/sysroot install
make[1]: Entering directory '/home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1'
sed -e "s%@prefix@%/usr%g" \
    -e "s%@libdir@%/usr/lib%g" \
    -e "s%@includedir@%/usr/include%g" \
    -e "s%@NAME@%liburing%g" \
    -e "s%@VERSION@%2.0%g" \
    liburing.pc.in >liburing.pc
make[2]: Entering directory '/home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1/src'
     CC setup.os
     CC queue.os
     CC syscall.os
     CC register.os
     CC liburing.so.2.1.0
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0xa2): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/54c67e0f5bd2b5f520a250dc13b5846f94fc1790

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburing/liburing.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 74ce4156f8..874e268d43 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -30,11 +30,13 @@ define LIBURING_BUILD_CMDS
 endef
 
 define LIBURING_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBURING_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBURING_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBURING_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
