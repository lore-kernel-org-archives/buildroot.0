Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7730DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 01:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C2C82779;
	Thu,  2 Dec 2021 01:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThVNRWtriO7C; Thu,  2 Dec 2021 01:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEA881A50;
	Thu,  2 Dec 2021 01:19:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C53A81BF5DB
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B581D80F40
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NqiGMg35Ivt for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 01:19:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E8D080FF2
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 01:19:27 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so37822121otg.4
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 17:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAKF2so9544cVKz1SFLJIZks8tbhS2ZC7ddG1/d3sD0=;
 b=HDI1Hp8Yid8aLS8I/YpM6um6MCLAUinGMFLVVsCD5+0WJdxgKHIuSPftqcy7w6ddjE
 xaSRbTbuZBgJ3TdJdlOcwRr/jjHmIrIhr2Et56+zOPcBUkH5oDhpt98nYIiXsOi0Dzb+
 sn76iSPZ06eHdcF5cr12vQlxepbisxhDk//qLMf4TsVizvw5ma9aTJ8TIC5ztSGaLImr
 x/WMb2gE1AiTYxfuMb48VDPwQCFe3CeU9Hpo6YTCI5OKXzJMxjaQ9P5YmYcsSuyrBLpc
 voFQltga5SKOi618SphLSvILr6EdXK1QsTgfTdL4J0OTpCf36DYshuLhofknVGBQsf2Y
 TZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAKF2so9544cVKz1SFLJIZks8tbhS2ZC7ddG1/d3sD0=;
 b=xnKH8LLPVKYaAMXwuY0onMN36vRe8/4uf7ls/wMF64rQQL8nQr2V87ew8Ey3/brdGI
 Ffl+I3lUS+pGp6ORzpRli9nIHbTAowrWvcC+XaXhO06UvOBc+k+7+Oai7u/xQnoyLDef
 T89V2rTRt/qA113yL0VSUWPNTdzuq7PMTvhu/OjXat1kcamtbcchX2leCAKXSR+BDEjc
 9tNOvW26omOOBQfA3xK0Xgw8SbZpFAx6/slyY634urd7bSaxb9IAnlmkYeOkVV2RO5U0
 QreG6WEjgKRA5GUi0ABhWViXztIrljBpiciduXbYwwYZq8Gj8zVXb9RSe+929L+jgTS+
 F8mg==
X-Gm-Message-State: AOAM5305ktHegd/aBwNv9zWM1cWlZHrodw878neJZRS3wVasrmdCJjIz
 eo+jrZ6+8I4DderfmX5ZZjLp65lEI+I=
X-Google-Smtp-Source: ABdhPJzs6/iK0zaQ2yvDa6tr+DxflYnx8Jgxjphg/LzvQtQ85KdzPNZ3zKQlWoKdaVb+cSGTFfofCg==
X-Received: by 2002:a05:6830:1be9:: with SMTP id
 k9mr8927665otb.123.1638407964909; 
 Wed, 01 Dec 2021 17:19:24 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id o2sm824253oik.11.2021.12.01.17.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 17:19:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 18:19:19 -0700
Message-Id: <20211202011919.2331133-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202011919.2331133-1-james.hilliard1@gmail.com>
References: <20211202011919.2331133-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next v2 2/2] package/iwd: bump to version 1.20
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Changelog (since 1.19, from [1]):

  ver 1.20:
    Fix issue with handling Hotspot 2.0 requirements.
    Add support for evict_nocarrier setting during roaming.
    Add support for experimental NetworkConfigurationAgent API.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 008a2db011..58224170e6 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  dd65a8795f6127fb1b9e29f2092686b0590a0d3738c2b90c792ccd320deaf966  iwd-1.19.tar.xz
+sha256  7d51e2ccabe7c500e44061ac725dbd4f6b0fb518b5e3de1681063d0f15d3050f  iwd-1.20.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index afa6e3bdeb..7b122811c5 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.19
+IWD_VERSION = 1.20
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
