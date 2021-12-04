Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D96C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 09:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEF7241BE5;
	Sat,  4 Dec 2021 09:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_7H2b65rMDU; Sat,  4 Dec 2021 09:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1973241BE1;
	Sat,  4 Dec 2021 09:32:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 380DA1BF5DC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F62C41BE1
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gD5i-U5fROlz for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 09:32:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 253AB41BE0
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 09:32:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d24so11162953wra.0
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyCM+QIu5CppWsJ1ujYPXwxSGGXlBCwvKq7cDoH+1go=;
 b=mx2lFY7xOJQDb5MnvUxx759A/ZmXnkOhDd/6ubD+CltArmiSj48NcDr14fwmuXJVDn
 kaG/j0GPU44BkehRh/L34pPgYHkpmH/EVUA3JyIDd6vQS7vyOuxwoZAqB3Ykzn42Vw2E
 MgKd5IpskpECIK4gfMxC37RFSIoUKEMesgZ9s/MF57DudNGMTS/lWKEH/xgQCFEraT8B
 meB8+jHiaFyb6sAl9641t6UoCfycnSY24KzK4bkCRG8dK9dgnBLgx3XSiFC/wIiFiF7v
 i4YUyndDGsdO3X+G0RpyLmOFS/q8AiKgazMGthY1bq1i7k6idKaxp49dSgtLXANp6v4u
 pjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyCM+QIu5CppWsJ1ujYPXwxSGGXlBCwvKq7cDoH+1go=;
 b=AkTdQU+I85WXbeS5DDd1rbKMXAUGML/11zdsNrLzdFzQjBPC18HCEGmGbROfxOtE6W
 uetvcKpR3VZBldD01d8D23EOAnhoOyD4sKuDyIkox7+EK96QoiMOOkX+m5zG4046Tz1w
 IdMbH4LkVTcE0mLBeGC5QDEgjIzkasR06dczxgYvzquhOmz9n48oD9JwwogMH0oNPa0o
 PwtQ03NtD3L+jaBlXzCRy0LkFabzIKBy62jmGvdrMWM1VQ3eSuleZKz5IcnNZ0EIRUDO
 +lPpblhoBObDXs235VpkMV+z63uBpSY0SB2GnQPXwGxqDz9LtT2YLyPO+Y4wec9vsGSm
 /73g==
X-Gm-Message-State: AOAM530AGrx59VDCmSIv+d8FEPqPfloLEETuXbxFnxkWbYriy5ooX12C
 DY6upbnHfxbK2g2LIhRn6XFGTXiz2PVVXQ==
X-Google-Smtp-Source: ABdhPJzGd27Tsz+quXgnbfUivYU2iv3lnPKzcSyvaarXbLlwbK9BYHDzwxJMNC00hLhUEleMXilnMw==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr28062292wrq.626.1638610347224; 
 Sat, 04 Dec 2021 01:32:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id e3sm5141174wrp.8.2021.12.04.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 01:32:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 10:32:35 +0100
Message-Id: <20211204093235.2017296-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netdata: add NETDATA_CPE_ID_VENDOR
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:netdata:netdata is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetdata%3Anetdata

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netdata/netdata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 34365cbf56..b20d5ea37b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -8,6 +8,7 @@ NETDATA_VERSION = 1.21.1
 NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
 NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
+NETDATA_CPE_ID_VENDOR = netdata
 # netdata's source code is released without a generated configure script
 NETDATA_AUTORECONF = YES
 NETDATA_CONF_OPTS = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
