Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB24AC30653
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 13:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3333B81F2B;
	Wed, 26 Jun 2024 13:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoU6RV9llg24; Wed, 26 Jun 2024 13:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30B6481F31
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B6481F31;
	Wed, 26 Jun 2024 13:28:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9FD61BF3F6
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 13:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3E0081F31
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 13:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oY1yp3l51fDS for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 13:28:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8390D81F2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8390D81F2B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8390D81F2B
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 13:28:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1s2BUh31ME-00J7fH; Wed, 26
 Jun 2024 15:28:37 +0200
To: buildroot@busybox.net
Date: Wed, 26 Jun 2024 15:28:36 +0200
Message-ID: <20240626132836.1532-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:FAgjjR1BDfcXm0GK/83o3jYjoEPe+7/AZinqsI/HZeuTLHQ6J0p
 4x0OgfP741gn6jqQSLRzYhMFMLqOYvQdxJLn68w1dkq00WcSMImzSRZQhHGd/G9KhGAnnfF
 9K1L/kajOVBmQmfJFlYsoOQyLMAnid/fY6Kmw76qxR17yM0O/HHuAw10EZobEgBACnOvY+B
 VQXQmKIB+wG/4aNWgqxFw==
UI-OutboundReport: notjunk:1;M01:P0:TbeGOkjTc2Q=;gDsY7BkqUieeCC5xRRDt/S3z1hn
 k1ciQ76ZVUbg7YjvoYaJLNOsblsc9cXbiChk5wpOPr72a0AtnriMs2xFSh4UIxPg3xjACsdR4
 UJH0fNShKi0TIzvniH7FEZBSf201WaqlO6EJVoKyGZ8LCZf7zHT6N7cXFipmyXGBpDYWdDipi
 A6kyhT1xHJAopoIM81wA9XlkoqVftZKM01bGPwJYeAhsOnCtEL/aenmHoWiVQYZnPeLP628C4
 FYrugFyWg8J5g/DZQ9gW9EFAx1WcSSeBeT6bmjYe98F0wJWf02ypGO/ThfhkWU1PZESQw5y/2
 NVmPcD4cCKBMtjx5a19pny1VuX+kHdIxkA6u01ql+zDIsygXWBXVNGmmka0/igKllqZ2k8/Jn
 2cWRXSAtYcdB3sYtnKqDnz8Ry3ZFqmbF/44W4SphLRL5XFdoh1LrItP1muumSxUsxzoVfVNBv
 BWqOsEC6sSZn6BUGMjJt+elRQNpXu0NlMmTGC/tD1vNu0CnbZR9Dz7QYfFbo+CpcDzEbefX/T
 Eni5bcUowVOjvJCbP4ap98lv540/KMAkRtJomHMagRUBKy4uCoeMyRqxute3jJ1KgeVGO3a6D
 n3JrSeKHDTZT8NU9MhkLbtHOhoKBSu9WOLHlpyoSTSu/KC+fDrEOuMklJoeYDilgIvnHpBu0s
 TmpQzMs73cokFLlwgoYlYTKoZEK6xOd9JtAez7vv5k9V49JkrRN6/Q6jG6scuoeElky9xhCF3
 XRLqXcopyKYtzMcRvVLANOtTJYONrlb3hIKLtM4lCU4YL1lQW6PhgKQiNH5cFyAoBYNsWmIKO
 vyJSAVsWdjrLfOGPjGB3EdZwjCfigqZnkvJayPJynCxjc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719408517; x=1720013317; i=ps.report@gmx.net;
 bh=gGZwVKGJ8WcEEp6CTjV2DlQqVfKEVOpZPwtxwLfa484=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ltNSNQfe3RcfWlp6ERpuP3lKlmrIBXGCoCaQt0Y+aEZVQzXQmXTjDnxfDAsXuYZN
 Qzp0I0ptuYQ5yp09rMJl56M3iyeNj8CvIwX0bKARlzVZitTXHCeB60LpMqyBHPncF
 BdR9VBGSbKcaZJDljok+yxy9Ur1gtKkGB9f8+lw/NIsdQDoUrCzxY5KgHxhQmrFLD
 IWlgztokX1/eKhNr8uVqrKbDMEZCr8PwcsfOH7f3/HRZ91laU4NT2H+t6n4zeP8UA
 uicVz0q2+OE36LVx82cu0V+bDUW1k3dATWe7uofEajy+iNJIhl6ci2PSAzApAtCVw
 SGs35gTh92uAQj5ylA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ltNSNQfe
Subject: [Buildroot] [PATCH v1] package/zstd: fix compile after latest
 version bump (needs LIBSRC_DIR)
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix compile after latest version bump, set LIBSRC_DIR for progams compile (the
library path in programs/Makefile changed from '-L$(LIBZSTD)' to
'-L$(LIB_BINDIR)' with LIB_BINDIR defined as 'LIB_BINDIR ?= $(LIBSRC_DIR)'
in ib/libzstd.mk).

Fixes:
  - http://autobuild.buildroot.net/results/928936875e85b58b4c1d82fd55b4584bbed8c629

  LINK obj/conf_21004782925a08c8a5ee607f4870e098/zstd
  .../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lzstd: No such file or directory

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/zstd/zstd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a2da0dd479..499f85923d 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -79,6 +79,7 @@ define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		LIBSRC_DIR=$(@D)/lib \
 		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
 endef
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
