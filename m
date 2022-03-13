Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38BBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A409605E9;
	Sun, 13 Mar 2022 09:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uXnQYmbRd7C; Sun, 13 Mar 2022 09:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 706D560E8F;
	Sun, 13 Mar 2022 09:04:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C87E21BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B50D360E8F
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_GPUwjHZIR8 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:04:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91011605E9
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:04:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i8so19379849wrr.8
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 01:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OrG2xgUZF2GEXRwvOFEUMoXcI2DbGwdE2OwGZIqJoZA=;
 b=eyVqCI+AqLQ4yzIouf0q0MZLB4QMEoSUFlKl2wWgzsNvtlaGocuOp6vo6VEmkGSCYj
 wuXxzc/1SEj9BgpRZFdo/A6KGJFFi2Xm+LPSQGBjAgmHFzQVRRZVuQIxlWeRboorjHPc
 uG32x+ligGmnXSlOvRd6sHAE7Daa7d7S24sk8t5jCvDJserIHBfTLV2pNV90yEmhXTBe
 PXQBuxfGquEpIdBdfYDHrQO077idxYINtDslCcqy6/2jGHrYkvBn5Q6ImOcwPBqgfvpS
 8dQokiZgd4QbQq9i6lF9KFh1hqm0COQhwLXNzZYbqyyWvnS3hko4aXkfZYpu8U072UdG
 6MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OrG2xgUZF2GEXRwvOFEUMoXcI2DbGwdE2OwGZIqJoZA=;
 b=6sya+IVCK4iOUXbamnnC1fHTTUvBeeHxgox0NBv/nV2bsswfjJ5AOMz5+shTK7I9M3
 gHpptKX9cj/Bm2V8L2rU0NSMoju5Vrx9nstoqHDyPjUFI8R9GlC8pvMEDVXPG0TS+e/U
 7S05Sh84cTJ0MgG4WzPAR29vDGPRKT0nP/c51N2L574B+JiWaf+MCda8MLvyhcUhApM3
 XuzN9IJunn7UbDe4OzoY9SAl5k2/yjO7MRSmtsrkNzdnuXLY8+SdlF4KWYOJQ+DzarDm
 0EN8zqMEZzrgsPSUSW0Bn6CZ2xtxlNVNlWSxpkQOuQjsoeRHjTjnw3tKDGK2XbiONSyf
 Nasg==
X-Gm-Message-State: AOAM5323c8hUAbcH7uV7ZHN+3woxfvugzLSz1UjAw/f2peghpYHpakSh
 udgaPA4ER05k+XUOJZwvEsyFFni6juI=
X-Google-Smtp-Source: ABdhPJyPxpLC/xo5CXZhyyTb91+kXt/07Bd+SA7QtlX9lUiNqOAIC+dI01KA0iLFXOjDtMUzfkRByg==
X-Received: by 2002:a5d:6852:0:b0:1f0:98e7:a963 with SMTP id
 o18-20020a5d6852000000b001f098e7a963mr12784559wrw.646.1647162276078; 
 Sun, 13 Mar 2022 01:04:36 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h13-20020adff18d000000b001f1de9f930esm17486971wro.81.2022.03.13.01.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 01:04:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:02:09 +0100
Message-Id: <20220313090209.161433-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnetfilter_conntrack: fix musl
 build with headers >= 5.15
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

Fix the following build failure with musl and headers >= 5.15 raised
since bump to version 1.0.9 in commit
9af9dfa543907c46091c706b0f3a0eb89445ae74:

In file included from /home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/arpa/inet.h:9,
                 from ../../include/internal/internal.h:14,
                 from proto.c:2:
/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
   23 | struct in6_addr {
      |        ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/19931aba8bee8867a53130ca4a53cfadbc4c5bfd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-fix-build-with-kernel-5-15-and-musl.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch

diff --git a/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch b/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch
new file mode 100644
index 0000000000..9e96594120
--- /dev/null
+++ b/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch
@@ -0,0 +1,60 @@
+From 21ee35dde73aec5eba35290587d479218c6dd824 Mon Sep 17 00:00:00 2001
+From: Robert Marko <robimarko@gmail.com>
+Date: Thu, 24 Feb 2022 15:01:11 +0100
+Subject: conntrack: fix build with kernel 5.15 and musl
+
+Currently, with kernel 5.15 headers and musl building is failing with
+redefinition errors due to a conflict between the kernel and musl headers.
+
+Musl is able to suppres the conflicting kernel header definitions if they
+are included after the standard libc ones, however since ICMP definitions
+were moved into a separate internal header to avoid duplication this has
+stopped working and is breaking the builds.
+
+It seems that the issue is that <netinet/in.h> which contains the UAPI
+suppression defines is included in the internal.h header and not in the
+proto.h which actually includes the kernel ICMP headers and thus UAPI
+supression defines are not present.
+
+Solve this by moving the <netinet/in.h> include before the ICMP kernel
+includes in the proto.h
+
+Fixes: bc1cb4b11403 ("conntrack: Move icmp request>reply type mapping to common file")
+Signed-off-by: Robert Marko <robimarko@gmail.com>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+
+[Retrieved from:
+https://git.netfilter.org/libnetfilter_conntrack/commit/?id=21ee35dde73aec5eba35290587d479218c6dd824]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/internal/internal.h | 1 -
+ include/internal/proto.h    | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/internal/internal.h b/include/internal/internal.h
+index 2ef8a90..7cd7c44 100644
+--- a/include/internal/internal.h
++++ b/include/internal/internal.h
+@@ -14,7 +14,6 @@
+ #include <arpa/inet.h>
+ #include <time.h>
+ #include <errno.h>
+-#include <netinet/in.h>
+ 
+ #include <libnfnetlink/libnfnetlink.h>
+ #include <libnetfilter_conntrack/libnetfilter_conntrack.h>
+diff --git a/include/internal/proto.h b/include/internal/proto.h
+index 40e7bfe..60a5f4e 100644
+--- a/include/internal/proto.h
++++ b/include/internal/proto.h
+@@ -2,6 +2,7 @@
+ #define _NFCT_PROTO_H_
+ 
+ #include <stdint.h>
++#include <netinet/in.h>
+ #include <linux/icmp.h>
+ #include <linux/icmpv6.h>
+ 
+-- 
+cgit v1.2.3
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
