Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC46C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 12:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9985424FB;
	Wed,  8 Jun 2022 12:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEOeYz352bkj; Wed,  8 Jun 2022 12:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C426E416C3;
	Wed,  8 Jun 2022 12:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2681BF574
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 12:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B82D417A7
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 12:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxAO8KGku2sj for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 12:00:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28946424FF
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 12:00:44 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id o10so26731202edi.1
 for <buildroot@buildroot.org>; Wed, 08 Jun 2022 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fS1T17cB+3MrFgNJwz54OS8y4tISBsS1wTItXFsZW+I=;
 b=AgSJqqUUo+Esc6zOItyGgw7/JIl+PQhM6MAkZml1oDiMCb6aJ0NvokRyqSR/ZUPx2s
 391fiSNTciJ+2KQDRHVbMJtVgLTJQ2WM+AGs/d8lH18m5qpzCD5KjpyN0lf9Rv17UIpP
 WFm1Z5hQXtBCN+uwukVFUq8xp005Kbb+dB93k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fS1T17cB+3MrFgNJwz54OS8y4tISBsS1wTItXFsZW+I=;
 b=ykRrmmhYoWEgbK6uMu9EGeIdvp+34q2gvkfqEyX4KPjaqzy1Ezt76eXjrI7HQdLUU5
 dMGM+ZK0hnqu/uUYrEOFQERSgIVVg79dFis5YOlvWfNjU8IXFnAooTzHSUnIX7P3fh6C
 swz6K6X9hdrBFh+ALKppSG8N4iLS3z4JLfbuIEciZAtUcrCpmHKv76+0X5GVWwREkq6P
 93m8smDvy9MXgsGRtGUYrDRuKjm0gcIJVbdAeZmHGluTpZnZ2195twk3s/1SiuDZfrLe
 2dM2VYJyk9B7Jnb63rmkDO9xbMSuHNnQN+LCgNcn3xKJFxn46d30+QyOdbpgp/xT2znF
 el6g==
X-Gm-Message-State: AOAM531lBX00NbHuE2kPAR/2NOpwbc+OAePVL43xhBzoJgKhnU/zRW/G
 ti7HtciDRBC9FUVCntrUGbHAL6SbC6X0iQ==
X-Google-Smtp-Source: ABdhPJynBYHdXVAshd32HY6dotcmlAaCerbeIU5ikhLeCc1B/QVEbeHhqt6IcjwVtMg/e+ahSlNvFA==
X-Received: by 2002:a05:6402:26c3:b0:430:efd4:4edb with SMTP id
 x3-20020a05640226c300b00430efd44edbmr25575735edd.53.1654689642373; 
 Wed, 08 Jun 2022 05:00:42 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 my16-20020a1709065a5000b006fecf74395bsm9068289ejc.8.2022.06.08.05.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:00:42 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  8 Jun 2022 14:00:28 +0200
Message-Id: <20220608120028.2768210-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608120028.2768210-1-angelo@amarulasolutions.com>
References: <20220608120028.2768210-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/3] package/busybox: make udhcp discover
 faster
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jagan@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of waiting almost 10 seconds foreground (3 discovery packets for
3 seconds retry delay) at each boot, make only one request then fork to
background. This way, the behavior is the same for working interfaces,
but it's way faster for interfaces where the address cannot be obtained
straight away.

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 52cb8ffcd8..2409cbcce1 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -b -R -O search"
 
 #
 # Print Utilities
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
