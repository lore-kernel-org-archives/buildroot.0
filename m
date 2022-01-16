Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3649DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 22:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC499605AB;
	Sun, 16 Jan 2022 22:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vlrEG2e8abm; Sun, 16 Jan 2022 22:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF24160ADC;
	Sun, 16 Jan 2022 22:04:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E589A1BF3CB
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE1D3403D6
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQdjUGFy03sQ for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 22:04:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E86040383
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 22:04:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso20023728wmj.2
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 14:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9oNtmFzifo/wZ23XjBJZ9fGwpqr1P21xsVykdsOn43Q=;
 b=h0gBWGyWQR6uJbIYxd6OTcmTLWYS/JeAJg5CJbb5GFB20QUyAeJ5E4ANH9XLyMHILy
 I6ICJZjO7ntYb8M8CRgJf28kINGjwqF7pUXGMlMDBIFs5zRbQwU2zctg13nwYYeK6wDK
 sKdBCyRxvhFwmJpuSl2T7HOOywc5zvFZRuwoUInzsqoe9PIRFdu7fw8y8TTM63gIxR2Z
 X+3dUCPX+8cxqY3jxxufQ+NVWKGksJHpFdd0yEaV2JVfP9OyfdS86kxT7JxkzqoRAQIe
 W3lMy3T3YiZo2qwkK+hA0Hv6Bv8no6avgTIPvy/5AGr6rHYJ7lPY7N+vG1wkXQzYXvDT
 LCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9oNtmFzifo/wZ23XjBJZ9fGwpqr1P21xsVykdsOn43Q=;
 b=kzQM4FX0Mo3IbF/tyqEcQCyLSZw/ivMGR14+O6bfyRpkph0VPV8kEWTIaSfzW554HD
 FEEP2KKSZYPEzqNEjDyN4k3uz5neaR/KQF3Hym8ZwQbsE2ySOKjS6aaq513kZwmcCM86
 KpHLehTEo7u3KkzWBmPDoYSVG01idkOw23AXv0Tj9N1fxnQo9K3nbyXeMqwox8gYABCy
 /k3SM8GFUbtzgzrkXka+BK1b4rsPBkX/QMU1a3SdMbNvqHalw89eAvhX4nK16DmSIvVg
 EvlF9tY+++SjnR0EDG1JbvuzIr2Z/HzJa2uBNvlAprrRwVpNcnsNS/H9tv8djsU5v4GF
 vIHQ==
X-Gm-Message-State: AOAM530EIrmRoeLkIyLXHTddV/hXUQ08+pDVwazz5ycCph8L3/ek/Db+
 oa7vHq531qFPnhSwo8Ue+OEvyIjgRQo=
X-Google-Smtp-Source: ABdhPJxWQ5Sr7FYjXXlIV5jjQFYJNvgV/a5sjoT70+X56n+WTpxdzNRFKDl0NYZ27lpmRqdQnmHkwA==
X-Received: by 2002:a05:600c:2481:: with SMTP id 1mr7727687wms.3.1642370668291; 
 Sun, 16 Jan 2022 14:04:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id s8sm13940222wra.9.2022.01.16.14.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 14:04:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 23:03:02 +0100
Message-Id: <20220116220302.3434242-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: fix CVE-2022-22707
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In lighttpd 1.4.46 through 1.4.63, the mod_extforward_Forwarded function
of the mod_extforward plugin has a stack-based buffer overflow (4 bytes
representing -1), as demonstrated by remote denial of service (daemon
crash) in a non-default configuration. The non-default configuration
requires handling of the Forwarded header in a somewhat unusual manner.
Also, a 32-bit system is much more likely to be affected than a 64-bit
system.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...x-out-of-bounds-OOB-write-fixes-3134.patch | 94 +++++++++++++++++++
 package/lighttpd/lighttpd.mk                  |  3 +
 2 files changed, 97 insertions(+)
 create mode 100644 package/lighttpd/0002-mod_extforward-fix-out-of-bounds-OOB-write-fixes-3134.patch

diff --git a/package/lighttpd/0002-mod_extforward-fix-out-of-bounds-OOB-write-fixes-3134.patch b/package/lighttpd/0002-mod_extforward-fix-out-of-bounds-OOB-write-fixes-3134.patch
new file mode 100644
index 0000000000..2cad8a6d18
--- /dev/null
+++ b/package/lighttpd/0002-mod_extforward-fix-out-of-bounds-OOB-write-fixes-3134.patch
@@ -0,0 +1,94 @@
+From 8c62a890e23f5853b1a562b03fe3e1bccc6e7664 Mon Sep 17 00:00:00 2001
+From: povcfe <povcfe@qq.com>
+Date: Wed, 5 Jan 2022 11:11:09 +0000
+Subject: [PATCH] [mod_extforward] fix out-of-bounds (OOB) write (fixes #3134)
+
+(thx povcfe)
+
+(edited: gstrauss)
+
+There is a potential remote denial of service in lighttpd mod_extforward
+under specific, non-default and uncommon 32-bit lighttpd mod_extforward
+configurations.
+
+Under specific, non-default and uncommon lighttpd mod_extforward
+configurations, a remote attacker can trigger a 4-byte out-of-bounds
+write of value '-1' to the stack. This is not believed to be exploitable
+in any way beyond triggering a crash of the lighttpd server on systems
+where the lighttpd server has been built 32-bit and with compiler flags
+which enable a stack canary -- gcc/clang -fstack-protector-strong or
+-fstack-protector-all, but bug not visible with only -fstack-protector.
+
+With standard lighttpd builds using -O2 optimization on 64-bit x86_64,
+this bug has not been observed to cause adverse behavior, even with
+gcc/clang -fstack-protector-strong.
+
+For the bug to be reachable, the user must be using a non-default
+lighttpd configuration which enables mod_extforward and configures
+mod_extforward to accept and parse the "Forwarded" header from a trusted
+proxy. At this time, support for RFC7239 Forwarded is not common in CDN
+providers or popular web server reverse proxies. It bears repeating that
+for the user to desire to configure lighttpd mod_extforward to accept
+"Forwarded", the user must also be using a trusted proxy (in front of
+lighttpd) which understands and actively modifies the "Forwarded" header
+sent to lighttpd.
+
+lighttpd natively supports RFC7239 "Forwarded"
+hiawatha natively supports RFC7239 "Forwarded"
+
+nginx can be manually configured to add a "Forwarded" header
+https://www.nginx.com/resources/wiki/start/topics/examples/forwarded/
+
+A 64-bit build of lighttpd on x86_64 (not known to be affected by bug)
+in front of another 32-bit lighttpd will detect and reject a malicious
+"Forwarded" request header, thereby thwarting an attempt to trigger
+this bug in an upstream 32-bit lighttpd.
+
+The following servers currently do not natively support RFC7239 Forwarded:
+nginx
+apache2
+caddy
+node.js
+haproxy
+squid
+varnish-cache
+litespeed
+
+Given the general dearth of support for RFC7239 Forwarded in popular
+CDNs and web server reverse proxies, and given the prerequisites in
+lighttpd mod_extforward needed to reach this bug, the number of lighttpd
+servers vulnerable to this bug is estimated to be vanishingly small.
+Large systems using reverse proxies are likely running 64-bit lighttpd,
+which is not known to be adversely affected by this bug.
+
+In the future, it is desirable for more servers to implement RFC7239
+Forwarded.  lighttpd developers would like to thank povcfe for reporting
+this bug so that it can be fixed before more CDNs and web servers
+implement RFC7239 Forwarded.
+
+x-ref:
+  "mod_extforward plugin has out-of-bounds (OOB) write of 4-byte -1"
+  https://redmine.lighttpd.net/issues/3134
+  (not yet written or published)
+  CVE-2022-22707
+
+[Retrieved from:
+https://github.com/lighttpd/lighttpd1.4/commit/8c62a890e23f5853b1a562b03fe3e1bccc6e7664]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mod_extforward.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mod_extforward.c b/src/mod_extforward.c
+index 733231fd2..1a04befa6 100644
+--- a/src/mod_extforward.c
++++ b/src/mod_extforward.c
+@@ -715,7 +715,7 @@ static handler_t mod_extforward_Forwarded (request_st * const r, plugin_data * c
+         while (s[i] == ' ' || s[i] == '\t') ++i;
+         if (s[i] == ';') { ++i; continue; }
+         if (s[i] == ',') {
+-            if (j >= (int)(sizeof(offsets)/sizeof(int))) break;
++            if (j >= (int)(sizeof(offsets)/sizeof(int))-1) break;
+             offsets[++j] = -1; /*("offset" separating params from next proxy)*/
+             ++i;
+             continue;
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5d53767263..eb9556e619 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -39,6 +39,9 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+# 0002-mod_extforward-fix-out-of-bounds-OOB-write-fixes-3134.patch
+LIGHTTPD_IGNORE_CVES += CVE-2022-22707
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
