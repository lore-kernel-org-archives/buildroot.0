Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A79C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 16:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81E9641946;
	Sun,  5 Jun 2022 16:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2n4Unb-Our8; Sun,  5 Jun 2022 16:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E79841920;
	Sun,  5 Jun 2022 16:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1632F1BF34D
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 16:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3D5684175
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 16:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25w05Xp5nNcn for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 16:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E17A18416E
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 16:01:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k19so16662272wrd.8
 for <buildroot@buildroot.org>; Sun, 05 Jun 2022 09:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILGFBCrqK/LIRKD1mobU/25dAB5ih5yW6r8r1Xp8y5c=;
 b=AdAMge4PnDpJnLYpwlBxuoIHUc+vZr6gEvPZtEW+d8kwqO5vwlXCIAFhk+FfDuNoQm
 EiewkftDa9lhpMnNPCIbItcBbvRGrsUtWoJoo1bA3zIQnoWiPb8/3zWeSKa5Sh/k1S1s
 xY4Ht7iD92PEg8ehrRUVQDSuibR2zd1UgD+WavYsqGuc057uH6QjhLwJW7tnbolxZm9Y
 OZSNrkF+FromMmZw/xMdgBdmfF6Wdnmv7YeDHG8DOsOALjVzRql+2RPfab2KR8GVMN79
 I+PX4Pd1reVo+3a6FrRoth3ZK6fpGkUOTP3r8Nek0yvKpbIpmkas22k1Gz96oB8p2CTN
 589w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILGFBCrqK/LIRKD1mobU/25dAB5ih5yW6r8r1Xp8y5c=;
 b=5Xrqp0BXSZzB5L5BOQWXM8Ntuo5zRNra7uDzS3JSbjPUAV37ltAH/kEJplyMPKnoOW
 6ZydpR1fl2SeR51VvavtkFoNtyWdUGKN8D9f0O1LHFCZA6o84+OcgaqGWipDOoVjYMpf
 atcqlQuGR13fANUtIZ8TnvjLyvzILF+pccpY/N/fAWU33w28tuXgkHQIjSN9ypGwzgrR
 MyGFrBPPmV7lW61nRHPT0dw2IPtUaBX0z3ZNr3cNw6dn2OmplfxyUDafpqs7c12oX7db
 9KLnzUSN0QR0LXwSNBZ6cZvZKgYFNNMjLmmfpW49iLY4ApajD/ZTT+zEbQih5BweBCzU
 6UWA==
X-Gm-Message-State: AOAM530LLtFfKTwnDBY88rG0h405zONsjI2Vf30kkw0j9uNfsvJiOPg9
 P10YPh3niKnJUMzb+Fl7e2QmgM6Jv9Q=
X-Google-Smtp-Source: ABdhPJwnIZqnLX/Nda7qJ+Bin6s/bYELRRelVI36doeJobXg7/AqGOt7cLipgFZHBkpzlF0WdBs3VQ==
X-Received: by 2002:adf:f7cf:0:b0:214:dfea:13b3 with SMTP id
 a15-20020adff7cf000000b00214dfea13b3mr10905342wrq.519.1654444909583; 
 Sun, 05 Jun 2022 09:01:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h42-20020a05600c49aa00b003973d425a7fsm15729905wmp.41.2022.06.05.09.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 09:01:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Jun 2022 17:59:10 +0200
Message-Id: <20220605155910.1927906-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: perf needs dynamic
 library
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

traceevent needs dynamic library since its addition in kernel 3.14 and
https://github.com/torvalds/linux/commit/c877bbd8eceb14c5eac6779cc804fa8b34044736:

event-plugin.c:10:10: fatal error: dlfcn.h: No such file or directory
   10 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/24206071721479a6ba4d0267e7e20ef9498e1e05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 6217fcfb7a..131380cb02 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -50,6 +50,7 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_LINUX_TOOLS
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
@@ -69,6 +70,10 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
 
 	  https://perf.wiki.kernel.org/
 
+comment "perf needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS
+
 if BR2_PACKAGE_LINUX_TOOLS_PERF
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
