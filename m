Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02234C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 20:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941104089E;
	Wed, 27 Apr 2022 20:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PUbi2QCdtzY; Wed, 27 Apr 2022 20:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6453340891;
	Wed, 27 Apr 2022 20:45:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF5D1BF869
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18E3040A19
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0q76mul8WWEQ for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 20:45:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3316640360
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 20:45:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e24so4077241wrc.9
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ku4/qJ2YQrW5SWKyxkQI8Dms88tJ9BjmuJBFk4bQjvE=;
 b=TDIdrm5/RXLcCkFJgXNZX6y0xbXDOAKIDn/rChDEV3v90czanyOUT9LzxBVLGTaS5v
 y4ol5iOzehxgGEDDXDkT32M6Ns0hMkdFXMtH9+/BpDMbIAGSdglyNf6RjwXMrsS0t6G6
 Xq6bssk+OngV3pVxc93o8Sezxsb6tFXiDBROqT8sQ2DUrywNgPUXkDzvSUOI1IWtolb8
 wAOCYAxdoiLVox5Ehk1+UrXu4sYfgOIkc4UEiFHZmynF7Asmt467eHfdKYV5XPe7OS1T
 BC/RI3iAeo59hUnQiBTthkLCQcW728cQxMo0Y9bbl/T6LAaVGrbvQeNYrPA9GLcr7jJb
 13ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ku4/qJ2YQrW5SWKyxkQI8Dms88tJ9BjmuJBFk4bQjvE=;
 b=xodv5eBFfGAq86rFkVF4ZciCJ60ztEe6II6fLBWJYOCDFqgkPoiJjbWBBWZDPGVGAx
 J9e0rf2HRk+H8NoYbNAzHUCZ/sayDLzsnH1CAqaZDff4wJ2e4+wh258DIN0RyMD8DKT3
 a9PEzogqUvPfWSaUubHkF7+y04+WRM2tXJzcXVlN3d1SwHaXzZXZC8ngb26rXep86jrz
 beKn1hLUT5F1MHMiHoFV0u+sNJe8QamaaPV8HqXWuMF6aukbUYsxYiF3muiwo8u5WL4p
 +efxi8mFz4JfAMS6SfhJSW17rp/iZzCVS87mLHhb3sd/478oWAvM+oIZhtwAT0/L8/ab
 giAA==
X-Gm-Message-State: AOAM532o0qMIfUQZTUzNTN0k5u055qiSuLi501QDfZUlMLOzdRQDpgue
 D6TFMIuvwHmBy4dAlVtEHBP/i+js9r0=
X-Google-Smtp-Source: ABdhPJw/qTqfS5sfnVNuEIVmvddTEXA+AOyzc/W3KZevLa6X6T3BGMCShCfI/uJmFGQpcdO6M3VG1A==
X-Received: by 2002:a5d:64ce:0:b0:20a:e723:da71 with SMTP id
 f14-20020a5d64ce000000b0020ae723da71mr7663357wri.350.1651092299076; 
 Wed, 27 Apr 2022 13:44:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b0039082eeff53sm2283909wms.22.2022.04.27.13.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 13:44:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 22:42:49 +0200
Message-Id: <20220427204249.3207448-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427204249.3207448-1-fontaine.fabrice@gmail.com>
References: <20220427204249.3207448-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libv4l: fix build with
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

configure:19923: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/i686-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp  -largp >&5
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

[...]

checking for library containing argp_parse... no
configure: error: unable to find the argp_parse() function

Fixes:
 - http://autobuild.buildroot.org/results/b7b2253ac902b441cc6ff12500b56bd15c413d71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libv4l/libv4l.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a781ffcd5d..fd69b7ac7a 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -27,7 +27,8 @@ LIBV4L_DEPENDENCIES += alsa-lib
 endif
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-LIBV4L_DEPENDENCIES += argp-standalone
+LIBV4L_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+LIBV4L_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
 endif
 
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
