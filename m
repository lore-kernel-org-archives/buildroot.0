Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857DEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 16:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B2A961303;
	Thu, 19 May 2022 16:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVRHl2vOioDD; Thu, 19 May 2022 16:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A59D612FC;
	Thu, 19 May 2022 16:43:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46FD61BF37B
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F2D84337
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKoAfS5bAbk7 for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 16:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43A1484329
 for <buildroot@buildroot.org>; Thu, 19 May 2022 16:43:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k126so3209607wme.2
 for <buildroot@buildroot.org>; Thu, 19 May 2022 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5J2jT/A86HSFgNsoUl1lKGFx9uPp6y5oo3ijKnRDOk=;
 b=HwTefLKN82DsUaHo/DqzUFhOx+x6UA++wlbPgEFRlsGrJ3Xh2nK2NUW/eYYIP1+GxG
 XShT8BAUodne04jYrjzHclyxR5+SFGb8pDjEtMS5jQQee1uXNtHLHPzSvENQ0gNC4h5G
 iH8ZIngTH3cFpYk4mysNoaehxk+IhYIvZJEgPkWEaJCV9RGFOOyjgqIF5+i0RLY6Zwnd
 JZWhdEEzD+O3cpNacgmvv3NQ8r39vlfE1NP1hGjLFsonkbgDkQz1rZcQlqrz4tpqKyD3
 LOiEbJE0dRasgqIpSDn5BoPSIm2jmXcLwRTqJWspsgyZQvX75eeCaj8Tivm0O+OTXy89
 vr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5J2jT/A86HSFgNsoUl1lKGFx9uPp6y5oo3ijKnRDOk=;
 b=4PxhTiwMQ07kTDhp6O9UqnUIo9L8FmNl6IVNwLo0SZ0eM8UqjLMaSvmx5LZYyqbSm5
 UyqN/QTPi+l6SbwYdhL5ZrAYykZXuGTdegf87zF95UrtOsaNeFOtdleD+0A9GrTFhs7S
 ytKHkFcMvKpYME6t3m+paeT5JhGhhyO5FfMU9svl7yp2MvRcHSybCUFfZ3lNo1iuDRWy
 22xWcqM2Xm5f+j5XF8XDEc1m6yXXnc/YHVvg8C5ItUw1ptV6Y/pQ039y7Bno7tExBCqa
 4gTBk/tW9ZOpJ9Ijz+SCfe6H7Z+cwYz4RwiS2XKYo/xHSMLqkQXYaNH98xkVT/9Q75QR
 tKFQ==
X-Gm-Message-State: AOAM532j0krCm5Cvuy+hCEy/eWFYY40gGnBAkJNZFMMXfhNHcaW6UZLG
 QuIqAUgi4LGroW+2+bYOXaXR0u+kqtI=
X-Google-Smtp-Source: ABdhPJxczn0R2lG01NwIWYZ9dQSZnTRTqYVXqaI6pVVW0Ayoo0R40LRYm633LU4QvQs1/j+VPm9lEA==
X-Received: by 2002:a1c:2c3:0:b0:38f:f280:caa3 with SMTP id
 186-20020a1c02c3000000b0038ff280caa3mr4537210wmc.14.1652978582173; 
 Thu, 19 May 2022 09:43:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c365800b003942a244f29sm88590wmq.2.2022.05.19.09.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:43:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 18:40:38 +0200
Message-Id: <20220519164038.918088-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zchunk: fix build with
 argp-standalone and NLS
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

/home/buildroot/autobuild/instance-3/output-1/host/bin/i686-linux-gcc  -o test/zck_cmp_uncomp test/zck_cmp_uncomp.p/zck_cmp_uncomp.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 '-Wl,-rpath,$ORIGIN/../src/lib' -Wl,-rpath-link,/home/buildroot/autobuild/instance-3/output-1/build/zchunk-1.2.2/build/src/lib -Wl,--start-group src/lib/libzck.so.1.2.2 -largp -Wl,--end-group
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-help.o): in function `arg':
/home/buildroot/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-help.c:936: undefined reference to `libintl_dgettext'

Fixes:
 - http://autobuild.buildroot.org/results/1242d0b15ceb816e946bfc1b31dd39e68227359f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zchunk/zchunk.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index 5582c21e77..fc91f90431 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -9,8 +9,11 @@ ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
 ZCHUNK_INSTALL_STAGING = YES
-ZCHUNK_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
+
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+ZCHUNK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+ZCHUNK_LDFLAGS += $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 ZCHUNK_DEPENDENCIES += libcurl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
