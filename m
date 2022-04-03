Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCAFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 16:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6193A60E44;
	Sun,  3 Apr 2022 16:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjXUR8cMgzSb; Sun,  3 Apr 2022 16:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF4760E2C;
	Sun,  3 Apr 2022 16:39:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 466731BF284
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 16:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A4F60E2C
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 16:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3oD6f0s_KzZ for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 16:39:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FE6660E24
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 16:39:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d29so5016495wra.10
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsvLr+EcERMSwnnZCuuswT+KuyDS4mdjldKEw06VZrU=;
 b=l1ulzQeuQn6i96a78XXBzIdpzu7abXvp9ioDj23z8OpPBky+ya+jgSaWwl7RFHOJet
 hfZWkpoyGq2j9hLSwYxwNPdb7aKSDqH/prP7vMmfek6TZuKWKRO/a3aQpGqiVOFro1Zw
 5vZVbDBppoqWxdQsxsQ/byvfFOltFgncagGKU6ujmWXfnEF75lv0o97jIAol8hbjVxIQ
 YhbUqcWvZ1RbPYSSNd4hbl73v285HavzirW/5V9H/7IcIhitByqzHFWUQV9s8rb1gAvV
 +3iqhWDHtsVe6N5I1Q+xjvoaynkeVgAy4Yfe9vCz/+Qw3qqHPZvrKihTrAs0GlvR9HP+
 PiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsvLr+EcERMSwnnZCuuswT+KuyDS4mdjldKEw06VZrU=;
 b=4nx5hyE8nSWadUhn0r/t2qzSSGobx8EiqeQetA+CJLxFctzl6eMw+/RU6ZbZ01I3Mm
 UW5VIjoPljmsJX0DOaFMQfguxdd/4YF4pMFkv7A+lDVzirGPEzNhASsjmZ7DcrBYVN38
 eNN0OupqJWTyD1KcTLGWy3kB4OzWrMwDV+hVa5fxnN2itHYYFiSm0lujG+8Ar8z5tsVX
 OkPHmb4G/QHhcYOlaQVg+puBP0BsA1gW4jHthuddKITILEOPdshBxwOtNN7lpyU6UFdw
 6mawiO8aOhNLXLbmrlLMyk35wL6kD4681biqn76gEDuYVTUYJhwv6NhHVJE6LjZnY+uP
 Yx/w==
X-Gm-Message-State: AOAM532LRzbu6M6/JEezvZUPzFOxB/8rvHk1VuSKsPRh6jTWThgJghik
 u0Y86uDkdaRISXRDhkilGjSv5u+rFqY=
X-Google-Smtp-Source: ABdhPJzVq3hSjwgMfOY1T+jwUrLFK4NsPAFmmT+xMX8kIYxAzwFBBUNVaP9Zymr3usrnShqVM2h+hg==
X-Received: by 2002:a05:6000:1206:b0:205:c1e8:5d01 with SMTP id
 e6-20020a056000120600b00205c1e85d01mr14084232wrx.168.1649003964894; 
 Sun, 03 Apr 2022 09:39:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adffe47000000b002060d09327fsm2271307wrs.16.2022.04.03.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 09:39:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 18:37:37 +0200
Message-Id: <20220403163737.223577-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403163737.223577-1-fontaine.fabrice@gmail.com>
References: <20220403163737.223577-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libyang: disable tests
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable tests which are enabled by default in debug mode since bump to
version 2.0.0 in commit 2a3edc5e00b38f4f927894d0911990c9060e4415 and
https://github.com/CESNET/libyang/commit/e84f12fc5eccd67ed41e852fa0e23c030ae8acb0
as they will raise the following build failure if cmocka is built before
libyang:

In file included from /home/buildroot/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
                 from /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/lib/gcc/riscv64-buildroot-linux-musl/10.3.0/include/stdint.h:9,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/src/libyang.h:18,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/tests/utests/utests.h:30,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/tests/utests/extensions/test_yangdata.c:15:
/home/buildroot/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:53:24: error: conflicting types for 'uintptr_t'
   53 | typedef unsigned _Addr uintptr_t;
      |                        ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7ae21fbb28b1a69183c5d8ed87cf5f5cbf055026

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libyang/libyang.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 832adcb627..a097b3ee95 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -15,9 +15,11 @@ LIBYANG_DEPENDENCIES = pcre2
 HOST_LIBYANG_DEPENDENCIES = host-pcre2
 
 LIBYANG_CONF_OPTS = \
+	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
 HOST_LIBYANG_CONF_OPTS = \
+	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
