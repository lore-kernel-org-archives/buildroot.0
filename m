Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8DBC2BA12
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 21:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79A681EBB;
	Sat, 16 Sep 2023 21:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B79A681EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0d03A6WibYD6; Sat, 16 Sep 2023 21:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 046FE81EA5;
	Sat, 16 Sep 2023 21:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 046FE81EA5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7A51BF30D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 21:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 206E360BC8
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 21:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 206E360BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ls2-0LDrEfOm for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 21:17:25 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89D7660ACE
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 21:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D7660ACE
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401f68602a8so35944295e9.3
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694899043; x=1695503843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JpZtfRHjtvpt+mPKgttQXBP8mZXrNZIERFtI+4KhwJ8=;
 b=HS0kxf1GRZKun1DIBlt6OlQZzrnGPPQYiiQq2BqHhaXjRHsb+XtC12+nEHU2WwHGLI
 XH2aHNF6Xwk91w8AvqAUQeTkNKP10nmAi5VOIaSfxxtyiYYhCw6cDTDEMtIYckyQKhGU
 d5OrQia+iTKTmeZt0NUWAtmSY0KYH6fWTkcF4kEnk0X98CpA12G4vNfmWWcM+c0JivTO
 /oM5EQmKcKo0klPWdutUk5onAXDiZqOmoZGgbF/b2aNtSnzHlbywtTDZX+3HlgNhC1GP
 tv4RX0W1qnsr6L2RZsfoXlQ9b3FAKjKHOKvslllah7urbIoTqKKqEr7TC7ZVTLJwmrO+
 G7Rg==
X-Gm-Message-State: AOJu0Yx3rUPGaA2LNMY85+h2ADoYcDAup2sNHE8PQJobn+w/ovanXZV3
 2M/v0NXeBTYTn2rLqq0XNrRawz+wr/g=
X-Google-Smtp-Source: AGHT+IEP1QIgRg8/7lZCq5vEp4dLloUaYiuQ1k+WJoyYFb7VVR2JnEyjSEdJPxOiQjytA2xR8GgXXw==
X-Received: by 2002:a05:6000:3c4:b0:320:4cf:5b50 with SMTP id
 b4-20020a05600003c400b0032004cf5b50mr1921127wrg.5.1694899042758; 
 Sat, 16 Sep 2023 14:17:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o3-20020adfe803000000b00317f3fd21b7sm7991624wrm.80.2023.09.16.14.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 14:17:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 23:17:14 +0200
Message-Id: <20230916211714.1175631-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694899043; x=1695503843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JpZtfRHjtvpt+mPKgttQXBP8mZXrNZIERFtI+4KhwJ8=;
 b=TCLXcMRGkAT758TbsvEjhKtu8qbJadVW68aHam9QaqxF9ou3ojzkxGdO5qaF5NjsRg
 TAGMz0Btm8LBE5XToLAYCLKyb2d0risrnzHMqUHgORKtbedCeODC/C89u78TOTNu/aUQ
 sBd6VdyuHljmRpUyczAx3Wy9J+bIM8WZqRwxMD2htTH1j/xijA8BHILQVqrqhr/c7EwA
 RlI0AH0SnknFGp119mhagIDqAoQzamVebrqZIXLcwHCbBq81y7eQ8LAizVKqOWoR+v83
 OZ3++GsxJcrqtBqt22ifKOqIexWqQOSKvltXvFG9ZEgoO/E/1PzcQzKfDbQuuP+0BfKH
 v2Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TCLXcMRG
Subject: [Buildroot] [PATCH 1/1] package/fstrcmp: fix musl static build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl static build failure raised because host libtool
is not patched to manage "-static" as "-all-static".

/home/buildroot/autobuild/instance-2/output-1/host/bin/libtool --mode=link --tag=CC /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -Wextra -Wshadow -o bin/test_user \
	test_user/main.lo lib/libfstrcmp.la -static
chmod a+rx bin/test_prelude
libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/test_user test_user/main.o  lib/.libs/libfstrcmp.a
libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/fstrcmp fstrcmp/main.o  lib/.libs/libfstrcmp.a
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
/home/buildroot/autobuild/instance-2/output-1/build/host-gcc-final-10.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'

Fixes:
 - http://autobuild.buildroot.org/results/ffbee12f13e3d6c180d8891a428c6c490163083d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fstrcmp/fstrcmp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/fstrcmp/fstrcmp.mk b/package/fstrcmp/fstrcmp.mk
index 9c42159afb..cafb451833 100644
--- a/package/fstrcmp/fstrcmp.mk
+++ b/package/fstrcmp/fstrcmp.mk
@@ -15,6 +15,11 @@ FSTRCMP_CONF_ENV = LIBTOOL="$(HOST_DIR)/bin/libtool"
 
 FSTRCMP_MAKE_OPTS = all-bin libdir/pkgconfig/fstrcmp.pc
 
+# host-libtool is not patched to make -static behave like -all-static
+ifeq ($(BR2_STATIC_LIBS),y)
+FSTRCMP_MAKE_OPTS += LDFLAGS="$(TARGET_LDFLAGS) -all-static"
+endif
+
 # We need to install the package files ourselves due to upstream trying
 # to install a .lai file which is missing because of rpath removal
 define FSTRCMP_INSTALL_STAGING_CMDS
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
