Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAD1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4932E41B96;
	Mon, 30 May 2022 20:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZ2yQafEhHdh; Mon, 30 May 2022 20:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3763A41B8B;
	Mon, 30 May 2022 20:31:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 534281BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F16741B87
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwYR9Ic4H14l for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:30:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.8])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1838E41B81
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:30:45 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se18.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nvm2B-000DYT-4E; Mon, 30 May 2022 15:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nr8NkhMnmayT7AR4wE87kT5N15ZoM8s2jIRyPVLubNo=; b=OERWcvLQfVLHW8e0Z24Wbmipuc
 PFtEiyAOSJ92lJeV5C4IoqgqVD0QKmefrlUlz/PuJ+V3N3B5IvUfPJaChXQwlhPrrAIt6jS3jFTUA
 BD3z/c9M+wNMzt3jFwaOiuA9SPvI2BstbbocHRuwwcLNUGyDATGU8W4LJ+xkpVwfkYU5Nwm+me3Ql
 kvLhEMCGIUUv57tI1pQiwITRqI8MTyYugZVKIIYSWiRG28XEqhcrasE2osPfQToRQ8NZmu5GdCjEZ
 Wcxn8r27wHOkqEavhSw/ZxPujAuE3f5E7AaLGwT57hS3AfkQtmNCq1tPDLfrQC7WFnGrOt9g+BqyS
 4FeS6ZaQ==;
Received: from [95.111.54.43] (port=56038 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nvm29-0003PW-9X; Mon, 30 May 2022 20:30:37 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:30:01 +0300
Message-Id: <20220530203001.574908-2-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220530203001.574908-1-dimi@tpm.dev>
References: <20220508212014.629607-1-dimi@tpm.dev>
 <20220530203001.574908-1-dimi@tpm.dev>
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/t3aufDKeoWo8yyW/xEUzkPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRZBxIMNp8QeVgSgF
 ojR0NqtTtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgHlsrgHdRWEueoBSMqiQzPh1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 Cmsi1aGGPfH65H6AVD6gAKRZUoPAgTtUp75uqlx0KezvZHXNck283Ma4f9Sv82S3dBYCh4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzuzIh1wkn5B+muMTuS2LDwzt8Ds8HhMu8AsuC+XP0IWdUIAUNuMtkDDGcfMcpylyxhs
 01KruaxB6s0aI7mWLxFqewZEt7CZOQ7IU15wrAsvU4/yXIk618YVJp5jM2kZcUgHPUbw7CVpNolc
 zSoTuJsRnENsSECCOsy4kitQ2EVON3ZmAvzhACRw3PmZbvOIthGJLZYBOnJkMewq8SVvi7vzaT02
 fm+lDqTOe615Hn/HezYfTH509XQw8Xdr+MnJzzZn/WnTKonJfGSB+FJgE/zw4HUoD+cIWUzsqPTs
 oNyo6vdjzQ6YC7Heg3Xf7O1TOd6RJQvT/U9rVpsp+2+YWHqMJlXoybOvrfLlgErbJFPCX7X6uLCQ
 WGN9pNli3DC1GSHOZUA/IbBXn3lSnHVoWCKrig+kUy0/V50A1sgx9X6XUyG7X+t1TW39Ja77LGPp
 OwBdIsa6pXKCXxjFsbUwgHS0eo7ybJmmaWykWTbAAZ1XGFTzcEStuOgM8+WgcxlSOIcPxmo87wug
 keVczgPJFLMsHgC00qgRk2z6CMYeLQ7wp2F7GO6T6bnYu21C1+IFqWMHzhJIya1bhC8OG6CHeS+X
 Mj9B6P5z9jr1E+YC0mZnY7DiOrvyPQGBoymZzgLPbwz2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] [PATCH 2/2] v2: Fix typo in the hash file and create
 path before using touch
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
Cc: Dimitar Tomov <dimi@tpm.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/wolftpm/wolftpm.hash | 2 +-
 package/wolftpm/wolftpm.mk   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index 871e3e2d1d..6dbf143ffe 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,2 +1,2 @@
 # Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
-sha256  f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567  wolfTPM-2.3.1.tar.gz
+sha256  f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567  wolftpm-2.3.1.tar.gz
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index 33cfdef6af..8d11fd1299 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -21,6 +21,7 @@ WOLFTPM_AUTORECONF = YES
 WOLFTPM_CONF_OPTS = --disable-examples --enable-devtpm --with-wolfcrypt=$(TARGET_DIR)/usr/
 
 define WOLFTPM_CONFIG_RPATH
+    mkdir $(@D)/build-aux
     touch $(@D)/build-aux/config.rpath
 endef
 # Fix for autoconf bug with config.rconf
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
