Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB33C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8C58151E;
	Tue,  5 Apr 2022 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuxYOIozWEvy; Tue,  5 Apr 2022 20:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43684812D6;
	Tue,  5 Apr 2022 20:08:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0146C1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1E06812CC
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFqqQPzoliVG for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:08:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07365812B2
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:08:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id n35so142045wms.5
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uoA0MG8ze34TzaokfBAC45B0j+L8T3dxNI1+TwPCc34=;
 b=KStyj8qHtFtGjTXFCmCq1LRJYYX9q5uRnGkDW4oOJoZwjT3xJINF1H0HcFU8OheDOO
 zDT2TPdYjw0GYbVKCiw4ykk/2AtLvrYJgcFUti7kp0YsFonpPTycJZYV4SGcVQaxNXws
 eQokJ/q2MdvIsgONgJKEwLisOkIyRQKpWtsoc09Nq6A2yyqDL3uc0UmvLgpV+2QVf5kG
 ku48YY1Gn/Quts9fT5mxDy7OIFhrRYa+k4cHaov7agMxrgM1JeXKOCX29hqtwInjadWF
 dKrREC//qs4XBosovQORobtndUTfyTmGvTY+b5mj5ReOHHH7LxSmlipqFM6E7vk11NCR
 LlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uoA0MG8ze34TzaokfBAC45B0j+L8T3dxNI1+TwPCc34=;
 b=AWGE+hMoFknMtWK+L/ykWaSCmPlJlrYmT3aj/K2HZkg0nkyDnICWo5Sn6k8f3xEuWs
 cyJyFQtpS1Bx0VYpMS6J9Fu7JAjl1TSp0+EITHCs6hEHdk1IplMyHvnXkUZKbmZ5qg9t
 BfX4eMpye+lV9Zz3oc/dVvZU4qDfkwprgGcRLsvVAroiDTG/zskWd2qCPndJaRWlNqs+
 fWteQbi0SWqwJPYOZsl1xIfxM5fZ7a/eJVHoeifPKEvjI+p4d2oCcbgeM+F2ZPtvpBrI
 1dNGXGFG9H0v52PekI2bFJhMrJHVFobl0VTtITcbqzw6e26f5eOnfvQYcLTlVuhuZN8X
 YGHg==
X-Gm-Message-State: AOAM531nH+o3KSfCNzqRPvFooK6cSeHm0HFvRd8RjVRuErVmzDsEse0f
 i1g5jbWAWHbwrBqu0hRkrsmEs6PUDoQ=
X-Google-Smtp-Source: ABdhPJz6lxiv1I+s0kpEaTiHTK3ViJZiz/Wpk7kRag2Xg18MIfoTCcsV4vzqF/es8Rm7yFJUA26QnA==
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr4428678wmc.29.1649189291021; 
 Tue, 05 Apr 2022 13:08:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adfc5d2000000b0020589b76704sm13390466wrg.70.2022.04.05.13.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 13:08:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 22:06:15 +0200
Message-Id: <20220405200615.1755287-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/igh-ethercat: needs kernel < 3.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

igh-ethercat needs kernel < 3.5 since bump to version 1.5.2 in commit
88cd215169d6875a5ed0543b15254b98f9f83104:

checking for kernel for 8139too driver... configure: error: kernel 5.15 not available for 8139too driver!

Fixes:
 - http://autobuild.buildroot.org/results/e8122e9d7c13d07a6ddc7d9a2d3a078c21521ecd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/igh-ethercat/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
index e600ef5fcd..51b8584f78 100644
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -1,9 +1,14 @@
 comment "igh-ethercat needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
+comment "igh-ethercat needs a toolchain w/ headers < 3.5"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+
 config BR2_PACKAGE_IGH_ETHERCAT
 	bool "igh-ethercat"
 	depends on BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
 	help
 	  IgH EtherCAT Master for Linux.
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
