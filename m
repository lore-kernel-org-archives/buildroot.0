Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29109C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 12:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FCE341632;
	Thu, 16 Dec 2021 12:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bxx1wMY4fUaB; Thu, 16 Dec 2021 12:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D856041700;
	Thu, 16 Dec 2021 12:41:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00C561BF2B8
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 12:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E23EE40198
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 12:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00HMyeACEbsz for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 12:41:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F2724012F
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:41:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a18so43995392wrn.6
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvpwurQ/Fb5ow9NnRiACVEkq/lj/bzROWIlc3iwEwZ0=;
 b=j9cVcRHy/QvmbaqbKcDoj72h3A1uXP213LHs7Ehyw00Pu4Ysc4JQMhcMVBZkTBAIBK
 FTZE1To3NzzCS8UrQgruahSfRha0Rh+d53t2LBw4vBNpnAp87TD2HKFPw5co5S8O8p6x
 H9jscefYggcRL6+ResGlOh4m3gM+Fn80u0ja+zxfohCvpq1WictOieyNCJyEv/TZbo+q
 b6gRspRDisPJnlXFG4qEyuus6PQWHzq9Vk11tHEL/Fr4NY14Wom/mjw10YI55d/0zyWD
 U6fQ1kAher4PJ9Crz8LHQZUwsd1sjpPSR07XUXHAoNWADXDHQhXApi95ETmmoMo+tlcg
 oPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvpwurQ/Fb5ow9NnRiACVEkq/lj/bzROWIlc3iwEwZ0=;
 b=6j/04ha6HTWmFgI/iQHBxTBMTbRM5nDN3xmc436VjSqs7tT9pG8za5d1kauryJtwat
 iQp+uQYQQY2DtLZ/Mjyqvq25TdpCZ09Szd7q+grzS4LamaqsQuuGsTWlhiGaaY6vSDIZ
 Nvp0qgCeoYCvd6+5jD6i3nz9AmExhrOZyzx9q2XefDjR4pAD3rggihd9loIvI3OsL1BL
 cRvZydvSBS5+WXejUZ7dFLwQDZAbdCWrbMmPhxCHRc0L3qy3jdLkgUXGJ8oQFw+FyRaB
 J6CBJTKL0aMQwXdzRuu/fKuhqcUvS3ZsSpUSs1xDjdGoqAP2hrupQyLvdET+Nstr+1+I
 nzmA==
X-Gm-Message-State: AOAM531zpXkhdy4rpKQVWRoKVys+7ZhF+CjhQqLwTq+gBId5kJMH2N2k
 Brdjxy+p2UPZS/70YEnxqj24299n1IvlAg==
X-Google-Smtp-Source: ABdhPJyy4+XbCK5IJV+/VjuS4UBjuXI9RnIOlxYPuwgmuv6FYcVUAYWgY0K0Wcfag5VaUsOFnriN8A==
X-Received: by 2002:a05:6000:1048:: with SMTP id
 c8mr1475686wrx.508.1639658474223; 
 Thu, 16 Dec 2021 04:41:14 -0800 (PST)
Received: from aura15.fritz.box
 (2001-4dd4-12a9-0-ed46-10e1-7482-d305.ipv6dyn.netcologne.de.
 [2001:4dd4:12a9:0:ed46:10e1:7482:d305])
 by smtp.gmail.com with ESMTPSA id o5sm4497787wrx.83.2021.12.16.04.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:41:04 -0800 (PST)
From: Lothar Felten <lothar.felten@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 13:40:48 +0100
Message-Id: <20211216124048.5968-1-lothar.felten@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] busybox: background udhcpc by default if no
 lease is obtained
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current behavior for busybox' udhcpc is to terminate if no lease is
obtained at start up. Therefore no address is acquired if the link is
established afterwards.

By setting the -b flag udhcpc will background allowing the link to be
established at any time.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 1ea810e5be..a854747286 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -970,7 +970,7 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n -O search"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -n -O search"
 
 #
 # Print Utilities
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
