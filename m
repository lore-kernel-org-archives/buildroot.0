Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983C0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 23:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 482F784CB3;
	Sat, 18 Dec 2021 23:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPRiQUL8JhR1; Sat, 18 Dec 2021 23:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36F884CAD;
	Sat, 18 Dec 2021 23:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8631BF306
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02D360B47
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yo8zTqtX6pKr for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 23:12:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 099CE60B20
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 23:12:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a9so11569442wrr.8
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 15:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmFwwOamyD22Qa/W+bRpeSVqXBzA/PH4/9ufKhvdmLk=;
 b=ilAzEl6rmkSGjZ3RQly+BtZx169VD2eWUNQ02b4UgiBWA7lCXXPoRwD25rfS5aRKdt
 FAueJMnIz/fp8lTkynhTN6Ngu1+2y8aGHtlL3IaTqx6fV4bcTbs6BdTZ2DEfL3DBOgPr
 oxQOnVt/+2g7SGW2y6QfLx7xldC6Lc7TcwVem0pmda0SVnAd7xZfl3JPiddURY5NjAml
 qZzXsOzepuEa7kr87eAnssPZwknLS7yC/PvGXgU+86GV8NomA8bd2R335yoljWEXwULQ
 DhywL8P93m0zdLs6YNxA6DGHU7ZcfwaQvRaxjwnJeTu04yWLE6RFdnHU01d3NMFi+eOn
 gf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmFwwOamyD22Qa/W+bRpeSVqXBzA/PH4/9ufKhvdmLk=;
 b=rYfWOvKQIuVsrksXUpa5KZbClrMBlCLR8w1zWo3CWs2BS8FYj+3/m8fjKE15kT4U9q
 m+iBbYRQfyDI3mBEO946GLWraBIUtSX6XsCWsO0eonrLehFnTJCB4vsCSp09EN/QXXKV
 9BsVZP96lF2nHJYIjK87ALYf1HWXkhF8sWLfWWtl6in6oBwIu5CZsMupQJDhYbAZNXyI
 x3TM3n/c51vn8z/h/uc68Y8Q5qgBVSL7Y8PwU5d/V/KUtqyetWbi5HkHNTb8fy0hR0fz
 xVcrRvaVgq9HTD2DV6407XBgza+4E149+0mKNek2bV20DfSd7fjorKSprPzj0vvbsmv7
 gQLQ==
X-Gm-Message-State: AOAM530dPaXNFxl53s8tBjnzsQGaOwMQZwNPubSU4lS7p9qkSkIAPZQU
 lKnPbeFiODlfaclfWP4UOf3QYdbcA6842w==
X-Google-Smtp-Source: ABdhPJzljXP26qjWvEtw7uYLsITZg0eiqmwLjJFQntJhosP/8Fbw9qJaerPWg3/CAwVD/7iED48lZw==
X-Received: by 2002:a5d:4686:: with SMTP id u6mr7510733wrq.673.1639869156153; 
 Sat, 18 Dec 2021 15:12:36 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id k7sm11429901wri.110.2021.12.18.15.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 15:12:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 00:11:55 +0100
Message-Id: <20211218231155.666025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/imagemagick: host SVG support needs
 host gcc >= 4.9
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

host gcc >= 4.9 is needed since bump of harfbuzz to version 3.1.2 in
commit 6861933d22006fbe8c961a41506beac826881f33 to avoid the following
build failure:

In file included from ../src/hb-serialize.hh:36:0,
                 from ../src/hb-machinery.hh:37,
                 from ../src/hb-common.cc:30:
../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
   static_assert (std::is_trivially_copyable<K>::value, "");
                  ^

Fixes:
 - http://autobuild.buildroot.org/results/89e1194c1659d7e1af9db8ffe5feee770c448f76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index 671b0995dc..fe0ad9a748 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -17,6 +17,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
 config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-pango -> host-harfbuzz
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
@@ -24,4 +25,7 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	  This is not enabled by default, as it brings quite a few
 	  extra dependencies, and thus extra build time.
 
+comment "SVG support needs a toolchain w/ host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
