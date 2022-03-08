Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F60EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 22:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E6F5417C3;
	Tue,  8 Mar 2022 22:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIpaDvKzV14G; Tue,  8 Mar 2022 22:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A69417BA;
	Tue,  8 Mar 2022 22:09:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C83A31BF588
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 22:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4BB660AB7
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 22:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7QcmzgH5bv2 for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 22:09:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5300608B7
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 22:09:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so384721wmb.3
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 14:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyRgUnilOpjKSkxOkoNk9dBfhAGYBJjyFmoLlPVRrF8=;
 b=q4IAVUi5I+kIv8ywAE/+sOTMOAiI8JUDYTK8Qj73N325nBEmLsAfDngPqqq+cLRP+5
 /Yxho9ZFhe4YRyTjGbAtGiy4Z6E3ehpmLPn9zApsUwHYlrLVshdu4nIwuUd4TUkgGMEP
 2PMeNA9JrVGoMrsvb31PJx1FgCNW3ZUoFAst14VgH/colEvAjJQJs05U76uFiZ+rwYN/
 9wfFIV9tJH7/Xn/1ZjROHshtSbUBaXhfLO+MRDefMfc07PdDAScafXJrLQ07AQvuNZi2
 WYDoaNZ5xQenPoDbQIt6MUiMzGyq9MyZ9pb+DpxC0b4ynjFRPAKTWCxw9MV68tZXw4RR
 VDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyRgUnilOpjKSkxOkoNk9dBfhAGYBJjyFmoLlPVRrF8=;
 b=Sdy39crpHkqdupEUWkpKyD+qQbSvpvF+WasCEoHR2WFx+X7SYSYUZ8Y7yu8As4q/hB
 XHuAyWBvPUs81XK8eRLPofOaYNVoLyLEfxCAoclaL5VXGGazHqQPuASJYHvdU7MJIs0i
 4qYyXrjpIZY5I/M2gzgDPpD7lUs4ja5GxDWiFRoVEikQ31r4962DBors+07+m/nxnkNM
 nS0wZHHz27XiIWXDSO3sNh4fkT+bsU4OCyfMUub6O9ZimvrU95rOIr4X9hczTkKkSWW3
 t56PoqgZP1VCaUbLiMnUjpUrd//fSe3h50gdmostMlVaz1K9UJ4aanFO5f76BicY48AK
 sHrg==
X-Gm-Message-State: AOAM5311JVOzNRpyt/1E5Hn4v0Q9M9MBrJlyRc3lm3aZvBMTwinIvfQe
 UOvkPd+Nk/o5DEmURjdnDnmQamwoRAw=
X-Google-Smtp-Source: ABdhPJyFcN+Kb4JIj9gHUroWDf54ZfHt2EePj6ZhCjin5VtvNagCs4COdIqGncMnxYj2rmtVqKdt4w==
X-Received: by 2002:a05:600c:4fd6:b0:37f:2a37:87a3 with SMTP id
 o22-20020a05600c4fd600b0037f2a3787a3mr1028581wmq.152.1646777363554; 
 Tue, 08 Mar 2022 14:09:23 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a7bc948000000b003898dfd7990sm53004wml.29.2022.03.08.14.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 14:09:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 23:08:12 +0100
Message-Id: <20220308220812.35726-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/riemann-c-client: bump to
 version 1.10.5
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

Update indentation in hash file (two spaces)

https://github.com/algernon/riemann-c-client/releases/tag/riemann-c-client-1.10.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/riemann-c-client/riemann-c-client.hash | 4 ++--
 package/riemann-c-client/riemann-c-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/riemann-c-client/riemann-c-client.hash b/package/riemann-c-client/riemann-c-client.hash
index 6d4d634d75..43d4cd45c4 100644
--- a/package/riemann-c-client/riemann-c-client.hash
+++ b/package/riemann-c-client/riemann-c-client.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 334874f0b9a507a8abbc7138df719cba4f28f12c02c39d5e55090b8edb86f9d2 riemann-c-client-1.10.4.tar.gz
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE
+sha256  568416d854d1c1e5eac743c9f56db6fa0d6a8144daa74a799d0556bb6b50e679  riemann-c-client-1.10.5.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index 6fbb3caf5c..f942d560c8 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIEMANN_C_CLIENT_VERSION = 1.10.4
+RIEMANN_C_CLIENT_VERSION = 1.10.5
 RIEMANN_C_CLIENT_SITE = \
 	$(call github,algernon,riemann-c-client,riemann-c-client-$(RIEMANN_C_CLIENT_VERSION))
 RIEMANN_C_CLIENT_LICENSE = LGPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
