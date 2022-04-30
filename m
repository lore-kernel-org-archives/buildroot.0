Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE26EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96818404ED;
	Sat, 30 Apr 2022 18:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vG0WYMNx1EeR; Sat, 30 Apr 2022 18:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8D44404C6;
	Sat, 30 Apr 2022 18:58:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFD851BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DED440442
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQ1kMV3--Gtd for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:57:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3724140324
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:57:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z99so12493560ede.5
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSYwHPWIfa0BIkTrxDnh7NU+UuFK4w/ol0sDP2c+qeA=;
 b=JSGPugLSWI3y7vzQy4QHhDKvlfkAP3vh/qX1GB4AK1V/NCwBb30bV3ET62JrmgpKcm
 1wHw23rCv8XQfDYRjed4XIdXQAfXy3g5BEzT6lQ6fXLxJ5c1rQBJ07+sVS2/UCCs7131
 ASSKF20imu7mC9fa1s0tn4vElCxSMKkJkCay+TGJDAWcAyMsAt+e/X9v2Z89T4JhnRDe
 alqB8e+k4A9OWmBvhvVRPumpnlHGIW4JCjl3BC7wYQ8XDn13bnPIA/jbmW5IHiPv9sDn
 NeQSS/fNxkmyEooNzZc6DDaCeHLm2XfdljULJi0oDC73Z+UnKfXHcoksVEb57ImRVWQm
 1iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSYwHPWIfa0BIkTrxDnh7NU+UuFK4w/ol0sDP2c+qeA=;
 b=fI4NG4zPJvL77KlMOn9UM38Ku1nLTqZ8s3FdGY+sqYICvG+YI+K770MFzPGhj08egw
 ttyNk/JSlw1mFt1QoKJmwRi4c+L+4D6r0RQDuHpSd0ktIHxL1vt1HQwxCK/g3JhoTf55
 gilW7U10AHMjvb9iTVjIQLb3JMr70bQE4NI3g7CV+saKrBqdTBQ5vR0CHGGVGJDkY1Gl
 6eixylMcPrGxa9hIXfCjLjeYU8P26TEpR5hNSpgMZa7LymvBFzUWxv7+47RhdpxWBeDy
 m/SVhUWr6h2evRclfrT2aMhAEuChjQSLsA1Jv4N7HYG2c599mSehx31isSeTpDsJ32yP
 JZsQ==
X-Gm-Message-State: AOAM530TGx0lrrC+vWcJnidfwIa3TI7fGetGI1NR6J8Qr4MzuKrxPTDn
 bZobGfW2qaZi8oF7D3evpayQLLcvEIRT0Q==
X-Google-Smtp-Source: ABdhPJyPO5bOlQbM3iSEmMx+bO97TQqkJ5GMzM+iGWmso4RtdJvMTSBSHCzSfy1hxcRXi5NOUACb6g==
X-Received: by 2002:a50:f69c:0:b0:425:c96a:5c09 with SMTP id
 d28-20020a50f69c000000b00425c96a5c09mr5477879edn.256.1651345030341; 
 Sat, 30 Apr 2022 11:57:10 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 zp1-20020a17090684e100b006f3ef214defsm1848084ejb.85.2022.04.30.11.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 11:57:09 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:57:01 +0200
Message-Id: <20220430185701.606071-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/tbb: always build Release
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When tbb is built in Debug mode, it installs libtbb_debug.so instead of
libtbb.so. This confuses downstream packages that want to link with it
(e.g. sysdig).

Always build in Release mode. This means that BR2_ENABLE_RUNTIME_DEBUG
has no effect for this package, but that shouldn't be a bi issue.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tbb/tbb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index afe756a85a..fc720fd2f5 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -13,6 +13,7 @@ TBB_CPE_ID_VENDOR = intel
 TBB_CPE_ID_PRODUCT = threading_building_blocks
 
 TBB_CONF_OPTS = \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DTBB_STRICT=OFF \
 	-DTBB_TEST=OFF
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
