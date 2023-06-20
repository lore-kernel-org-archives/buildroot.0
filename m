Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E5BEB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 17:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B22F41778;
	Tue, 20 Jun 2023 17:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B22F41778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0oSsxmTYunA3; Tue, 20 Jun 2023 17:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56E914176D;
	Tue, 20 Jun 2023 17:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E914176D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2832C1BF83B
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 016BD41777
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 016BD41777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QW2NZ7JA0g0c for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 17:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C08C4176D
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C08C4176D
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 17:43:26 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6b2e1023f30so4237442a34.1
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 10:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687283005; x=1689875005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XiaAjj/MkFM0+bnpQK6ZD3+zkkCRVgY4mWIOhv+69zs=;
 b=C6zkFjS63lll/Lu6buOHr77okv6C0JJ5YSxAWAShGrfuLW/W0bOQ6dy+At2I/ES0dh
 QAw/wdCU3yS3BjeQguuSHtwOg+z1w6DdsWUyGmjf1x57HzbOOUe+gdlv37LAUVdXqOmE
 BJiIS/bH65WtnN4BruLV9Yts1CqfyLnL+ices0uMZARylSYGuCTbKxzFDTSQlbIhBdDv
 HztLeJQg0IyAkapzzCf6+xg44r5bejDI8bOZanBP0zvJ3L/9oVOV//RvdbhgDtWpjcbg
 ASNOPLf1oeXvzMFbri2JEJXP7yR9XG0Oj/+3HDErLWzppwYvTHVH61wOwruHu1gSKrFJ
 y/Gg==
X-Gm-Message-State: AC+VfDxqRI56iB4XT4VBxbOiKpfXerTwrNK12y16FkEdWASr74tAv+se
 4qVdH5Ft4JowKVBbUiU6Hz6aBwszx8yHfA==
X-Google-Smtp-Source: ACHHUZ5NfTFDOoFpIuIuLYYqBN2jXSuR68EvzGPfoCKIt/naQ6vPQl0rS201mj5i1AVQky+b/hkEJA==
X-Received: by 2002:a05:6359:2e99:b0:12b:d4a0:fab3 with SMTP id
 rp25-20020a0563592e9900b0012bd4a0fab3mr6577561rwb.3.1687283004696; 
 Tue, 20 Jun 2023 10:43:24 -0700 (PDT)
Received: from CP-WR7J591QQC.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a816cc4000000b0056d53b320dasm612789ywc.3.2023.06.20.10.43.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Jun 2023 10:43:24 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:43:21 -0700
Message-Id: <20230620174321.4774-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687283005; x=1689875005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XiaAjj/MkFM0+bnpQK6ZD3+zkkCRVgY4mWIOhv+69zs=;
 b=j894ZWWUnRC+6BdNAmvk0wifnkWAHGXTuiWR8ofHbH/LdhGBx6aemxx+kFV2zbJ+3B
 I+Le6x3GY3JrESRxUj+ZAsf8I7R9B4urEh63XSWrJqdeGkVswf8Wq8uR1cTQgCdO6L2f
 3llwnK8MdN3QjNYaKE3ReDTJ2ELpNfjA6U59rjNzVtFFIYXH+jS3Anxuz8QH6gKjitnh
 m4wyvPiJ8PNYnTWs4XMmQ5RfV+DnE8qBZjHMmMymuGp01zXe+L1SRw8dx0uhfe4fFTcX
 yPq8xQ086yJ5hm9QXD9fd5ZqKk4fRuwgRPWsMA5ADHgtuCxJQoE+1mYOa1dOBYPg4Fom
 5lHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=j894ZWWU
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: add support to build the
 host stub generator
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
Cc: Samuel Martin <s.martin49@gmail.com>, Sergey Bobrenok <bobrofon@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a host option to build the xml2cpp-codegen part of the
sdbus-cpp package for use in creating adaptor and proxy
implementations from the D-Bus IDL.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/Config.in.host           |  1 +
 package/sdbus-cpp/Config.in.host | 14 ++++++++++++++
 package/sdbus-cpp/sdbus-cpp.mk   |  9 +++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/sdbus-cpp/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..13eec7f7f5 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -94,6 +94,7 @@ menu "Host utilities"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
+	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
 	source "package/sloci-image/Config.in.host"
diff --git a/package/sdbus-cpp/Config.in.host b/package/sdbus-cpp/Config.in.host
new file mode 100644
index 0000000000..79402af441
--- /dev/null
+++ b/package/sdbus-cpp/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_SDBUS_CPP
+	bool "host-sdbus-c++-xml2cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HOST_SYSTEMD
+	select BR2_PACKAGE_HOST_PKGCONF
+	depends on BR2_HOST_GCC_AT_LEAST_7
+	help
+	  sdbus-c++ is a high-level C++ D-Bus library for Linux
+	  designed to provide expressive, easy-to-use API in modern C++.
+
+	  This will build the stub code generator for the adaptor and
+	  proxy interfaces from D-Bus IDL.
+
+	  https://github.com/Kistler-Group/sdbus-cpp
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 0e8d74cfcd..ece18126ba 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -12,4 +12,13 @@ SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
 SDBUS_CPP_LICENSE = LGPL-2.1+ with exception (headers)
 SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
 
+# Host build for sdbus-c++-xml2cpp
+HOST_SDBUS_CPP_DEPENDENCIES = host-pkgconf host-systemd
+HOST_SDBUS_CPP_CONF_OPTS += \
+	-DBUILD_CODE_GEN=ON \
+	-DBUILD_DOC=OFF \
+	-DBUILD_TESTS=OFF \
+	-DBUILD_LIBSYSTEMD=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
