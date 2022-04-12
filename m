Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A9EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 20:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3627460E9B;
	Tue, 12 Apr 2022 20:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxcJCRwjMfO5; Tue, 12 Apr 2022 20:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B61060EAF;
	Tue, 12 Apr 2022 20:33:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254101BF346
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13DDC400FE
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7rQZM4WU8w1 for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 20:33:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF1C740B4D
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 20:33:18 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id p189so12654862wmp.3
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M+9ZfejlB8bH/njGDqacvyQqzZfrthGFTMSYqsgxzOo=;
 b=NThY1/ALLF0Srat0tQ8fojpCI4bKaKRojElqABcs0iUrz/LOsbY4Z6QyPGyqteWUjR
 vPro+zo+eHuvcQ2Rqe1+dmxiZNDB4biancUfwwHve1AwkCEWDfWY+td5D4zRSy00KCSu
 XFVMNBvxUHXoWFqdG8oDQfHbUojMk7xfWvfDXKjWe/CxkUIyMRK3X6/PbF6FxL/CmGKI
 MEST4HG4FsQ0km9x20w+BMq/vF48X91VVEVpCPDFKTkL8Hm1qCdSku13RaxLqL3BFpmx
 kv5F0d5h8cSQkTVzwWEY+PdljX60Tm+kJowBXKscYAnZlTrOfLH0UPYI1ztPIIYRwBSh
 h70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M+9ZfejlB8bH/njGDqacvyQqzZfrthGFTMSYqsgxzOo=;
 b=HyTAX6qYhEghSPN2bEvovP3F43GNamoR4HUAF/iJWYkyVhkxfhmyWLLeozex1yTkry
 btj3f6CrzYe3O+Y+SiMMORSsyZ+musokbDZ9O9gq2sqQQaHHMPt6G2QrTBdv7tauv+gC
 isl17uJcmxJ7QcQn9nPjpQMYiW2UWlCVpaFVqv8FoK+imtaNegoN6MRZvGDQqboPPXsD
 Wr478iTXZJxEBDa+MBrrIECIHmfhU4vj62LbQCsgPWFaCYcH/LSfxwjpwLHeyD6KuQDE
 O7sQPBtCU6Ikk0Bl1R7pMRATVVRHA4EOT0rW2xzwXUPWlCDEQrTZ3fjokzegG8Ke+DEQ
 q9CA==
X-Gm-Message-State: AOAM532FNEIYjSd+k7t5R4ZoR5jY8aGE3j0A04ZPTz+Rni+ZZii/nVQL
 r76sOvV90TE+Y18jyLcR+zsby0YVCCo=
X-Google-Smtp-Source: ABdhPJww2Mjfbv1W6p8a3xBuRJihHM/zp+at2lNCp+PhWEne60RmjR8OA31VkmIpArCHuDv9Z8DrBw==
X-Received: by 2002:a05:600c:240a:b0:38e:af6f:510f with SMTP id
 10-20020a05600c240a00b0038eaf6f510fmr5609996wmp.46.1649795596838; 
 Tue, 12 Apr 2022 13:33:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d5987000000b00207891050d4sm14122410wri.46.2022.04.12.13.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 13:33:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 22:30:48 +0200
Message-Id: <20220412203048.23203-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libudfread: needs __sync_*_4 or
 threads
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libudfread needs __sync_*_4 or threads since its addition in commit
c477885e3f3c31d3922af1fc0e47e6f5f35b1645 and
https://code.videolan.org/videolan/libudfread/-/commit/06c3cb9223a3cb5ab048e42ab353958f422a8f57
to avoid the following build failure:

src/udfread.c:108:3: error: #error no atomic operation support
  108 | # error no atomic operation support
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f76d475f49d525095ac0054224b50b9e612691d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libudfread/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libudfread/Config.in b/package/libudfread/Config.in
index 8d42570500..c1f3f23af9 100644
--- a/package/libudfread/Config.in
+++ b/package/libudfread/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBUDFREAD
 	bool "libudfread"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  UDF reader
 
 	  https://code.videolan.org/videolan/libudfread
+
+comment "libudfread needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
