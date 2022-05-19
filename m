Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847C3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3333B843F3;
	Thu, 19 May 2022 16:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2Mvg-Ja42Iw; Thu, 19 May 2022 16:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E6884376;
	Thu, 19 May 2022 16:44:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 242F21BF37B
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20838612FC
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mn9B7n8QQN5T for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 16:44:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6D75612F8
 for <buildroot@buildroot.org>; Thu, 19 May 2022 16:44:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id k26so3217161wms.1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v5RLr6HqRqNgWUdGsWlhQufzt6Xr9Of7HgrXVX+gltA=;
 b=XM1Wg9/xOiX8vgNkFl0fPUF72K/ajNwMPQHt4kQ1NVOcuWEXchmrEWNa9Iei9eKIl6
 Q1REexc5GNIonm1DWPKuGFHH1xzNl16AuOOPh8aTa3Pr8zsSM+EOnoju33PRz1FotWVJ
 qE+tRgrRMT5kpcNOFTygI87k3nvPszwYpFUOZUzONWadUFVHE97BgJPkKBOiD5H7Vu4w
 qYEFJT+/Yxs1a9QGE0Nszccg/Q8Ov/rpimxFmk3B35r7dcavUnWAM5GayzohTyUej+Fa
 VnNtT/j7wbv93EkSLijGWgW5qES23fTZ2pyEvUkwizvcmqp8sQ8I20IUellv/SOX7GHR
 MS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v5RLr6HqRqNgWUdGsWlhQufzt6Xr9Of7HgrXVX+gltA=;
 b=hyUccDryKcUtY/mUt/qoPkTNA37Blj1IdmXx+5rVtQMlqhinSfjC4rQglxBHhGVvTn
 D8oW7d6GmQeBSPn1D4eMWSh/AcdPV7g93GnVBNp5CDxsNCSUa7c1ZM4uiv1TlYzoig6v
 Wh09MVgF6+NdoiidpuJXcX0aLSQd6ULTVQEhPfOuMAW91Ny15KunWgpOtgrkMo3pwIWr
 suko8u2bvavOubL80m37py/zPQ04xaQ0ZNB1tJ/sAsiOoO+XBQ8YGyfeJt8Q6VoA3paa
 0j9CdXtV6PLSxO5Rgr5ZX68fpvP4gMvW6WOvLSdXLkmqzZwPSpeE9yaPmE8dIOrhQGy9
 S6Nw==
X-Gm-Message-State: AOAM531cO844/+zyz0CKj+StXZSujuAg0WYVgU+bMdS2LcYrBcAsSwQN
 dveonmeFLw8OEfX9AGX8jtdTtP8bUFs=
X-Google-Smtp-Source: ABdhPJxW6FaXDrOSsB6tw7WTK63lPF9n4RUDiGBeJChUBP4rtL3tfRRIr05gMS6GQ83Cmywcp7GqZA==
X-Received: by 2002:a05:600c:3d8c:b0:396:fad3:6c2f with SMTP id
 bi12-20020a05600c3d8c00b00396fad36c2fmr4498011wmb.45.1652978656503; 
 Thu, 19 May 2022 09:44:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a7bc146000000b003942a244ebesm85557wmi.3.2022.05.19.09.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:44:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 18:42:00 +0200
Message-Id: <20220519164200.918286-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iucode-tool: fix build with
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

configure:6091: /home/autobuild/autobuild/instance-3/output-1/host/bin/x86_64-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp   >&5
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/autobuild/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

[...]

checking for library containing argp_parse... no
configure: error: An implementation of GNU Argp was not found, please install libargp

Fixes:
 - http://autobuild.buildroot.org/results/3d2d9e27aabcd6763510238087fe25d5273d3535

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iucode-tool/iucode-tool.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 596ad268b7..b123973a90 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -7,11 +7,15 @@
 IUCODE_TOOL_VERSION = 2.3.1
 IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
 IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
-IUCODE_TOOL_DEPENDENCIES = $(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 IUCODE_TOOL_LICENSE = GPL-2.0+
 IUCODE_TOOL_LICENSE_FILES = COPYING
 IUCODE_TOOL_CPE_ID_VENDOR = iucode-tool_project
 
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+IUCODE_TOOL_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+IUCODE_TOOL_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
+endif
+
 define IUCODE_TOOL_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/iucode-tool/S00iucode-tool \
 		$(TARGET_DIR)/etc/init.d/S00iucode-tool
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
