Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD15C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C2541C6C;
	Thu, 21 Apr 2022 21:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g6KWU619rlnP; Thu, 21 Apr 2022 21:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7342541C4B;
	Thu, 21 Apr 2022 21:56:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EDC81BF95C
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D6CD841F4
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RL1aaPLJDyun for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:56:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C956841C3
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:56:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id q20so4001501wmq.1
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 14:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3e7hWVKZ55wqo3O3FM6Ez0xi41QM9/kb2b8t1FdThYg=;
 b=G+GPQADa/MSAOB4sd6vFDjgSAp6tlH4x5t9W4OJ3MmXZeufX8j+u6+LEnw2stgvT8m
 MqaYAMXmZfnwsPTWp9hsmSsKrPz2+aFfbMRzDypMr9CqcYLAmnu9eG5c+zV3sP4nu7zG
 +3LDEGLtMPnbRUWi/SZHnOJ/+jmZp4eVllBB+C4y0+AaByehfz6XIPN5EIKsrXI3v9CL
 6cqOsypOULY1bpF4eIFtAsdjXMQ0EHz2aZFZMNBxH6dKw8r0tPp1jyeDWGu72Fi2eChz
 /RE7hNL/11yStF05KcM6MKnKxdBCsPVF5oDJKq4tQJdpARfkGDNE0xQbySMW8cEfgsoz
 qJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3e7hWVKZ55wqo3O3FM6Ez0xi41QM9/kb2b8t1FdThYg=;
 b=TzU/cjZqc7I6R8J3Bvse7FbsvwVILjTBjcD9UATl4mt56+LSiGgUUrZX6T4+sLPb6O
 iHQ20b8027VMPftllHIIel/rGX7nRQVHJDOHJUCg96eGkOa9zyaXBv3wCEhQxXxOZYfX
 eBJ1SG3pObIK3+ddtmUpzYMXtC0oPxWQ0wpwdh7CxH7Mf/2PkmPWCj4q5BdeNu+X+HdQ
 lnZGGoX3zXFYdwSehOwjDvdZjlRhAKZa2QImY3ZzjtlB1wsynOpDXwm0pM7jetaK1u4K
 pUUE4T149GN3c6m3ZzgTgH1HRTX4M9PgNto/LcPCcFks8oHkleBlXPxF//KSQ6bbV5A6
 m0NQ==
X-Gm-Message-State: AOAM532bMT1plhJVdc5E7j4eamat2WkzM4rSN45KAKoRrrVspDepcxJA
 v7Gxe+5x1rabRT2MRAwEhqlXcUhSSZw=
X-Google-Smtp-Source: ABdhPJzIGYfJanfw6u7k9v+/ROdNdIDMTpLq4k0L0NuI5/2n7cu5W6SCRLzikZnR+cFOhJlULHLOcA==
X-Received: by 2002:a05:600c:4ed4:b0:392:90a5:b7e6 with SMTP id
 g20-20020a05600c4ed400b0039290a5b7e6mr10679411wmq.33.1650578199392; 
 Thu, 21 Apr 2022 14:56:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b0038ed14b7ac3sm133341wmq.40.2022.04.21.14.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:56:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 23:54:43 +0200
Message-Id: <20220421215444.3798671-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/zlog: add ZLOG_CPE_ID_VENDOR
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

cpe:2.3:a:zlog_project:zlog is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azlog_project%3Azlog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlog/zlog.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index e2410d3665..c7b7035c1f 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -8,6 +8,7 @@ ZLOG_VERSION = 1.2.15
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
+ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
 define ZLOG_BUILD_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
