Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F0BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A05060AFD;
	Mon, 24 Jan 2022 07:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80_zrU5hEmir; Mon, 24 Jan 2022 07:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66DC860AE2;
	Mon, 24 Jan 2022 07:17:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23EB71BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BEEA82778
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urVE8-Aukybv for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 879E28151E
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:17:44 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id w190so8878744pfw.7
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6F2RqKY14bkl8n5imB1Mi3TnY32+erE6MoJ3LMLHjo=;
 b=MPbkZdNmbeD0iQew6rjtUIO7stJiL3Fo8PrXoAO79OJ+JJt3cELzSQGQex3NYPhcMI
 in+qB2VhTlw//w7WPhA0ZATEH7i1PfAz8e1X1r7MoIq9xd252kt/Rry+LvT6mK6RTGaG
 nJrHjIoTwa88XUZKxZAq5/RZbghxX+/j8OTmFLh/AzT67rUQW/CI3ZF3TxyRo0R1h83p
 WeFnNmMZwS5ClYuyB+Nwee2ryVG6GWnNP0WpsUCPbA79vodgukMR2SuwCJS2X4NdWUoI
 aaMFOgxNDzvi8C7bKAJzg2WostjgStyQ6ZF2GGaQdQLhtAcThlCeyaBR+yychR4yixBD
 GRpA==
X-Gm-Message-State: AOAM530peQXeujdK9RT7mbobSNxi+pUDRBWshhNyctJSfl+vcBtkmiWK
 f884K7ukoyKECecSUDfUf3WaCfppdO6tZA==
X-Google-Smtp-Source: ABdhPJwkBz8UOo/ndr24D+wa1VR03xwEuDCgahfEXT6hsWBnVzjB1G6bYT8ABfnmj00rXPpAngW/Rw==
X-Received: by 2002:a63:8c06:: with SMTP id m6mr10859396pgd.498.1643008663583; 
 Sun, 23 Jan 2022 23:17:43 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 y13sm889636pfi.185.2022.01.23.23.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:17:43 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:17:41 -0800
Message-Id: <20220124071741.22618-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/delve: bump to version 1.8.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/delve/delve.hash | 2 +-
 package/delve/delve.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index 3d117813c6..04ea4954cc 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e73f7fc063632268d3bdf53486aeafd98cceb8f86f4af56903dedfebaefe690d  delve-1.6.1.tar.gz
+sha256  086106a4776fa155bf20c37d27b9caed55255be6359c7f0bda1893d3adbb614e  delve-1.8.0.tar.gz
 sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index 6c346552a4..984d90a03c 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DELVE_VERSION = 1.6.1
+DELVE_VERSION = 1.8.0
 DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
 DELVE_LICENSE = MIT
 DELVE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
