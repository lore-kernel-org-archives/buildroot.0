Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64293C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7654097E;
	Tue,  4 Jan 2022 18:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hag319dpx3q; Tue,  4 Jan 2022 18:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC404151E;
	Tue,  4 Jan 2022 18:12:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3A71BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C42840937
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeHhIsY93eUw for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90ED64063E
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso1888055wmf.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uWVc05hwYJtjqcG6fO1hlmlX5RKQ2DdDj8wmrdghR+U=;
 b=bUtg4MYQplomlAC/9khMr5ImvROHRjdMquZii/BHf7GXd2BB8+bhJPgx6LsZsdwdBP
 ZvzCqwk6cLKvocrwqJdiSr5EvNsugq56KSgZYCRELJxXwrycJLUM8e4FRVRrW9bxFRDV
 JBOuvGKfV0AmTU7PlJomVPn0aZRJsQAEzv6I/OGzr/0eU/PO0jp/35fB1O9fWyUpzaPq
 3eQgb7szQSQRrwjOZ4DSkpDIgk52k/zovMLDe9UVGCzrV0qIuHxiJtjzw7aC8wfbHsq8
 SRvjw+KhsAwzAgopY/6b8lFpbDZwlxvHZ5bq62NulafLGP+3ecIXlVAhouUhooV9Sa2s
 wDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uWVc05hwYJtjqcG6fO1hlmlX5RKQ2DdDj8wmrdghR+U=;
 b=QKAO5JLGi3ZzJ/yJBYTNaZPffcHZ1Wv53RjLU+yO2hPy3sPeJbpDY5iymMXiFHEMXK
 g2mytf5+6psnXUoZI01ERmpm62a5qeSkBUK3D8P0b8ZztOCXRZpAqFD9IkPhd10DvKf/
 L6M5okEsWiOCp8zi8aadQXdggbXD4MRBwf2VLQa0mD5mtl0lbbvZlENByqkbwXJV/TsH
 XBGl1KRGIfbyg5tYSEcE1Bw7wp/2lpbis6xG9WlFfPWvYo8AHZjyGVbl7J78c1I4HyjP
 HXMmHmp6S8/trKeqfdJ17UvW1uYzEQw6vIaYlc6iFbSo3+Bg8MqAcjqcfXrl1gJY4ue7
 tYag==
X-Gm-Message-State: AOAM532BHrNW4ajeAsfRXDaLMMsM9n7iqVYVA7nPi9Uv9MmHdAkPGJ3o
 v5GjMi83MYLTRiCINhYcbmXUt/7qz3A=
X-Google-Smtp-Source: ABdhPJwl0hPtWzPF3aW+7AIlCtQpXYNAhHjrCsQG6txPMT1/d/W8f42QIe6wCZJCYJaWigiWjXcmmQ==
X-Received: by 2002:a1c:20c2:: with SMTP id
 g185mr42981144wmg.115.1641319763535; 
 Tue, 04 Jan 2022 10:09:23 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id n17sm108576wmc.32.2022.01.04.10.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:09:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 19:08:26 +0100
Message-Id: <20220104180826.3171770-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcm-tools: fix static build
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

Don't build c_example which needs a dynamic library and so will raise
the following static build failure since bump to version 2021.10 in
commit d1d93d488c76d4bc2551270007096693d8194435 and
https://github.com/opcm/pcm/commit/12647a6ee579c29bd306fd034470eb62dcb3156e:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: cannot find -lpcm

Fixes:
 - http://autobuild.buildroot.org/results/1276a3d49c8848039f034e7f03632df365097e94

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcm-tools/pcm-tools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index 8a58034232..d676df57f9 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -17,7 +17,8 @@ define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC" \
-		UNAME=Linux HOST=_LINUX
+		UNAME=Linux HOST=_LINUX \
+		$(foreach f,$(PCM_TOOLS_EXE_FILES),$(f).x)
 endef
 
 ifeq ($(BR2_PACKAGE_PCM_TOOLS_PMU_QUERY),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
