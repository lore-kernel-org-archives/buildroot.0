Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910BAC7EE21
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 02:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE3AD8225A;
	Wed,  3 May 2023 02:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE3AD8225A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXuHqBgvgXQ0; Wed,  3 May 2023 02:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E61AE83AF2;
	Wed,  3 May 2023 02:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E61AE83AF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE0751BF861
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B526B4028D
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B526B4028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6idkzjRCMeAJ for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 02:23:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D45BB40120
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D45BB40120
 for <buildroot@buildroot.org>; Wed,  3 May 2023 02:23:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-63b70ca0a84so5205024b3a.2
 for <buildroot@buildroot.org>; Tue, 02 May 2023 19:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683080590; x=1685672590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+XLers9sqpDL3sUn+HkJuhnaHEvJ0nJLANl+xGCJGE=;
 b=ee9NhcxkxJDSz43TSvYUT+wGDPAxwqsWpaR/A3IaLBRaxVibb6arGdlZt/OhpgmGyV
 Zn9vMZG1wk3ZGNA7xUZNMDgnRg6zGsmydFtZTH9GXxCT3ZmkRXPSw4VTL/U/CuAtb1Wy
 ojjkW+qIntPS+Gf1wGwvR28RMjty1qGp+IVLV0jYRiq4XjJRxqM9g3DM6/go5VAEFDHT
 YKF027oXRL6y+zI/2xI7ynC2CN0yOTuyvleZj5YEcN6aMGndUdqIorHLEIOPy5tvjreq
 7VLpYmBBHUHACdZ5waRpienSPLMXw1Df+6uWMV3kRC5WwJf2oNtPc2ePfjjP90cCP4uB
 ZXyA==
X-Gm-Message-State: AC+VfDyEOhmIyqP+sxKJhQzzLp3pCTDVa/Ww6d5dVgIarjgpypw1zXpi
 ZUd0eqR+/4vu8kiF7kmARCI2+ynVaTxmSA==
X-Google-Smtp-Source: ACHHUZ5GuxXFsg1YXSVlEHGUuWBPXlGjw1o0eDp0N2Z64A2Z0UsFLSPA0+aaXzJMNneJcWn9KXviiQ==
X-Received: by 2002:a05:6a00:10c2:b0:634:970e:ca09 with SMTP id
 d2-20020a056a0010c200b00634970eca09mr22933972pfu.30.1683080589902; 
 Tue, 02 May 2023 19:23:09 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n41-20020a056a000d6900b00637b0c719c5sm22349859pfv.201.2023.05.02.19.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 19:23:09 -0700 (PDT)
From: Christian Stewart <christian@aperture.us>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 19:23:01 -0700
Message-Id: <20230503022302.3188863-2-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503022302.3188863-1-christian@aperture.us>
References: <20230503022302.3188863-1-christian@aperture.us>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/4] package/go: adjust comments
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adjust comments in the Go package to improve clarity:

Config.in.host:

 - Add comment mentioning list of supported architectures.

go.mk:

 - Improve formatting of comment about NOCCACHE
 - Reword comment re: copying src/ to host/
   - the previously linked issue is not relevant.
   - instead: mention that src/ is needed for stdlib.
 - Adjust comment re: adjusting file timestamps.
   - mention this is needed to avoid rebuilding stdlib

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v3 -> v4:

 - move these comments to a separate patch
 - Thanks Thomas for the review.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/Config.in.host |  2 ++
 package/go/go.mk          | 11 +++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 90a54f0da6..b87b862cec 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	# See https://go.dev/doc/install/source#environment
+	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
diff --git a/package/go/go.mk b/package/go/go.mk
index bcf9677133..c8ad1a8dc6 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -121,8 +121,8 @@ HOST_GO_HOST_ENV = \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
 
-# The go build system is not compatible with ccache, so use
-# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+# The go build system is not compatible with ccache, so use HOSTCC_NOCCACHE.
+# See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
@@ -154,12 +154,11 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
-	# There is a known issue which requires the go sources to be installed
-	# https://golang.org/issue/2775
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
 	cp -a $(@D)/src $(HOST_GO_ROOT)/
 
-	# Set all file timestamps to prevent the go compiler from rebuilding any
-	# built in packages when programs are built.
+	# Set file timestamps to prevent the Go compiler from rebuilding the stdlib
+	# when compiling other programs.
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
