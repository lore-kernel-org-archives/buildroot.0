Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BFDC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 07:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8282360D5B;
	Mon,  6 Jun 2022 07:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjwSbtNyILtJ; Mon,  6 Jun 2022 07:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A46A360B94;
	Mon,  6 Jun 2022 07:51:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19E851BF30C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 07:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 087864052C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 07:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZtRwAGAT-cfS for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 07:51:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14F674010C
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 07:51:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k16so18710715wrg.7
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K4+2JzrXMg438YqKeZuGGd85fvwWDrRCsYt3bSL/NAg=;
 b=pbhQEHrv6zUqqeWIvmGn06IHhuPxBUhhgbtb9g+1SpZ6zCQ9Xx6CiNBwPZOGST3o1y
 hhC53q/7+7OLM2fq6skLvYGVzCPZTMXjN5fJelP6HHXU62qjyrjuZ9XDE2JvLbZ5mAiF
 lxY6I59cCQwJIOGjfjPSWp/36JDdrt3+6FIjFPOQUQLIAsZV9DEvWBToQthAZTNL4AqP
 PnKH8GqiFVfQ1hXLuElrp0tS2GcqAHUokap5+YE2KYc32iO1W1Mk5QCWvi0Q7d6oevo/
 DY88iygRh3VSwl6fw7d3f3QLbCQuVfPfMDj4T5UarDTsMEuMjv9CJtn2AOb/oHet2Gk1
 zvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K4+2JzrXMg438YqKeZuGGd85fvwWDrRCsYt3bSL/NAg=;
 b=jt5byOVwrMHHku68DP2xz731yIbkE9f/Y3HrZUZYuMfTaiV9kSKkxWmQ/P+60iX7/h
 217OzvRuUO6G9lOzJmw6bNYlQFCXx/Ky+7/A6qHoD0QKpCAcD/gEN0+48uLDAkW+WrN6
 e+VRdro1WpdjqAvVnl6ViP+/CdYLQSbLIlCqt+OXiRH8rQa3Tc7KGhqOy6o2IcWQa/rQ
 u50yWGNGtOfvPsj842dqlGH2z9hbH8DllYQEedWU39cPXvmswLTK69zD4p2Z5iI3U3Cc
 fkMGXpqjNXj9fua872YsFtZNcMHBLEfkY63CfFw6nhKR5cErtBFvcDL6vo6RDHzmCrrL
 wlMQ==
X-Gm-Message-State: AOAM531mReqHPhIUeyzxg/HIzVG2cTf+V8YzR9IYnnHAJF94jLtRRWFD
 /FAyTl+WuHF40+Q528d1pczIpqQdudA=
X-Google-Smtp-Source: ABdhPJxMVVaaB8ET84xkR9w8M4hh7untfd7Y3eFk8kkS6cM3nBSjsnPCo2Y1+8mKM39/DH7tTaVbWA==
X-Received: by 2002:adf:d1c4:0:b0:210:1935:3dd8 with SMTP id
 b4-20020adfd1c4000000b0021019353dd8mr20583075wrd.229.1654501897012; 
 Mon, 06 Jun 2022 00:51:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 eh2-20020a05600c61c200b0039c54f34948sm562166wmb.5.2022.06.06.00.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 00:51:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 09:48:17 +0200
Message-Id: <20220606074817.69924-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lttng-modules: needs CONFIG_KPROBES
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

/nvmedata/autobuild/instance-18/output-1/build/lttng-modules-2.13.1/./src/wrapper/kallsyms.c:20:3: error: #error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
   20 | # error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a733056d59f15573698c191562afced3f7a331ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lttng-modules/lttng-modules.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 4c1c50d0a0..d527bc19ef 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -12,5 +12,9 @@ LTTNG_MODULES_LICENSE_FILES = \
 	LICENSES/LGPL-2.1 LICENSES/GPL-2.0 LICENSES/MIT LICENSE
 LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
+define LTTNG_MODULES_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KPROBES)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
