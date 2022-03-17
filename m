Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44680C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 18:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F24B260AAB;
	Thu, 17 Mar 2022 18:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lmechq5-qoHU; Thu, 17 Mar 2022 18:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3901A60A7E;
	Thu, 17 Mar 2022 18:59:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E033F1BF228
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 18:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFAF64182B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 18:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lZrBbLDUMM0 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 18:59:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04A42417D7
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 18:59:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r6so8662282wrr.2
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 11:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wRXVXzdivxEPjhyCj6Nwx0cakQMLhVe3zt0q7/x4Wfw=;
 b=ZYGNXQxsVLztAF9sNM1mIB6AzwhUzKszBvi1nfx8y2ftXhoTifL3tXmTVKmxbnRJa6
 DFS1AI5dTLqRid1r0GT+KnkVXz8Ml7UApatMQP6nz5toNDsYO/7xieLgpDM56WLsUAun
 JNuvwZddU1+B0n4JrrTRfkleJISNsp3fFZ3XrSPKSslEiaSctmDuj6LdpYy97jSqxElx
 ByUeKYzB6gYzf5Dj0Z4looAnLXwvemzpxA2lumjsy9VWlfySPyq+/4hrXCei+KLUmilU
 4jzic5xf8nAX1r9y2R2LhpOpCBtDNf/NB8vLGvrnVejKjuMNesgD9uhpOr+SUlygtwhO
 qLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wRXVXzdivxEPjhyCj6Nwx0cakQMLhVe3zt0q7/x4Wfw=;
 b=7SbxNoHa2XwU5Pxa9LQ1vLH/OOEZ0DozG2ebgcVU56GdUCeTCBLwhQUaWIf/QHjbo/
 4RS+Mpw2A1bP6KAF75AG7lkfWLYzeTqyDBET8e8KmFNEvXyuCnJ9RwiA3Wyx9kAu5HpZ
 TuLtYnXrSfk1otyLZAEAXJF/LnKbXfyQMhEhuXMVVnP26eeWsNxKg+iLP4aslPh2ltlJ
 KH/RKCTajC+PfpwK0DMpxuFxBWGp+bLBY4DnABz47hdqKSqTl0TMKG0FqGRzqFhTLIGx
 BnYHjd/5TDDBshjN86UAjm7CdrI3z2VSoEfdlb3bZK4K+2yxKMsy2jB8PzmTOrhTTD7n
 wMEQ==
X-Gm-Message-State: AOAM530m9V75oDRaI3Xrwj34oMtQVUj/gY6SZRSikQrQ8IQeyJgEHCTZ
 qwsOAvYYiNR+udVqQBH4+Oe7w7kRQ6s=
X-Google-Smtp-Source: ABdhPJztDnhF/Gh2EQ3tudh4LujRWHNQnIRLBBR9xj+N0KEDdFSAmZZkT+s2d1fCz3wyME73lzw5qw==
X-Received: by 2002:a05:6000:1546:b0:203:94e2:76d3 with SMTP id
 6-20020a056000154600b0020394e276d3mr5385724wry.434.1647543584743; 
 Thu, 17 Mar 2022 11:59:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm8288936wmr.8.2022.03.17.11.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 11:59:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 19:58:42 +0100
Message-Id: <20220317185842.183700-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ola: usbpro needs gcc >= 4.9
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with usbpro raised since re-introduction
of the package in commit 16ff948444c3978d63f483344a3d92d994c64312:

configure: error: compiler with C11 support is required to build libusb

Fixes:
 - http://autobuild.buildroot.org/results/e9239403bb13d3468db01a952da8c695c0e5ea30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ola/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 36b175138f..e59637b57f 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -164,8 +164,12 @@ config BR2_PACKAGE_OLA_PLUGIN_USBDMX
 
 config BR2_PACKAGE_OLA_PLUGIN_USBPRO
 	bool "usbpro"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Build UsbPro plugin for OLA.
 
+comment "usbpro needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
