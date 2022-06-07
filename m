Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7CAC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F1E41779;
	Tue,  7 Jun 2022 15:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nK9A_dp4AW_H; Tue,  7 Jun 2022 15:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0414641638;
	Tue,  7 Jun 2022 15:18:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DCE81BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE41D415E5
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ly09MHWPLha7 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:17:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2070941638
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:17:29 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x62so23430807ede.10
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fS1T17cB+3MrFgNJwz54OS8y4tISBsS1wTItXFsZW+I=;
 b=FRxxQFpOsNaXERvdTZqlpGAQc/HRRzohPQNlb/XTx4FDQt03+4lXslkxBkc6ZHmTYi
 frDgT53jDDa0ks1DzuBlV23KLNKQgatoF0ZdsxsjrtbcRjKFAqjacD8ePtDKk4RC9jxS
 QFZBCllJLnkA5agCNWHfY8kikY9q3icShBYRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fS1T17cB+3MrFgNJwz54OS8y4tISBsS1wTItXFsZW+I=;
 b=Re9Rs25W2GBbvVzwhwitHH5ypLKiDUmkqIKFRH0hZOcv/zuJQcG66Ac3UGF2YePDUt
 dA992UVSZf011tJVrngzxaM3n+U1TO9zL1MKcrtjwyp1tVKXfP/bS2/GUIuQn3u/N5UC
 HrL0gQaKChoP82FKuQeJRY120mHZE+VFsnHfPMIFWkZnzO0sKTeaHeNmB/owcZPC+Rl2
 zxYBTQU7+33uCI43nhuBz4TWAsRn8BRirU5ZJglvFuD9CRBSVBagWILwEGe81bdtZM4A
 wzeZ+7nrfOD4HTN+bSMM5/Agp+oG4t0MpRjYG6TGZMK/FDZaEToc+Ikiz9l+ZYnrqjD5
 Ii2w==
X-Gm-Message-State: AOAM5333kbJyFm31xof26hQtCACG500NKxZJVz+uizjK30uhK4/x95BW
 fKch+ZX1682ghdNZDRKGnOuJxbaHssCnJQ==
X-Google-Smtp-Source: ABdhPJwq7xWJB4zZ7tiq1ACICsAuH/ooIIuIHwly5XOBZZnOZMWW4hYj9eGNoPhne0mK34rpuGZDig==
X-Received: by 2002:a05:6402:3899:b0:42d:d79e:acef with SMTP id
 fd25-20020a056402389900b0042dd79eacefmr33905905edb.12.1654615048228; 
 Tue, 07 Jun 2022 08:17:28 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 ay25-20020a056402203900b0042cf43e1937sm10588291edb.75.2022.06.07.08.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 08:17:27 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 17:17:19 +0200
Message-Id: <20220607151719.2305134-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607151719.2305134-1-angelo@amarulasolutions.com>
References: <20220607151719.2305134-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/busybox: make udhcp discover
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
Cc: jagan@amarulasolutions.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
