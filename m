Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28632C433FE
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 10:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C05E8425F8;
	Fri, 27 May 2022 10:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2Sg4L6q7dHo; Fri, 27 May 2022 10:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3806142626;
	Fri, 27 May 2022 10:34:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80E541BF841
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EA2C84AD6
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Odj03JmP8pd1 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 10:33:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84A3D8493A
 for <buildroot@buildroot.org>; Fri, 27 May 2022 10:33:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id d22so4885395edj.4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 03:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJCqRzI4rudkM23disjoJhCkLH0/+bK6VJHcWpKUGFs=;
 b=Q2wvbwB/LuXrhNwrs1J6czaGtR2d0yLxT3fYRO6lo6SiEm/tCx9JCcla0543ZPpNA5
 oYSKk0SIlocxXG/LHamfw1dEm5gyBFGKI9zJClhnQikUgL24dFT1SrZalTrCkdI9uwLD
 GJ0FaaOanhs5inblAxVgXmAvPmPqsEYfiWJio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJCqRzI4rudkM23disjoJhCkLH0/+bK6VJHcWpKUGFs=;
 b=JgSX8XCPd1othqSRgcsE794e5zueJu1sbEWeVPxxSOmChWMFciZpQxeUt4nMlydXpx
 iwp8Ov8FYnaE6W4aqYgi8OGSffUkc3zzVus+wLMyG4HAR31Nk5LML6nK1e3esSm7DhBv
 SBJVF6UJ6z6tqBlG8qmv2pXxxEVFBsYkzGMYbUa5herp3Le17WlRDXpp8/Ohr4NC3tYA
 lITaRaV5Scfai+C/Dz+F5YbIbr9tzdOF8y66xEdMMbQ2edqLoK4GdlGlj06gMK0FN3Nx
 ngEqja+AO0sSuIrFEJF3FnYzH8l07Glp9i3W7o2cDL/lMOiadNy5n+zE7uHC0slqh+W1
 zg0g==
X-Gm-Message-State: AOAM530yOs7QssnFZMVS7S+zuddJ4678ZKlV2s950NQul3g0eOp/UdUo
 Mgq0z4zRvgOxs2MHhE+aSuAbBbvG7ZJz9A==
X-Google-Smtp-Source: ABdhPJx9hYIwgoBCekjMsO4ZrvdXv8KWeudLBnJxGwEU7xZLXhDKstkabK82pv3wYd6lQrVT3dzSRA==
X-Received: by 2002:a05:6402:370c:b0:42a:adfa:9150 with SMTP id
 ek12-20020a056402370c00b0042aadfa9150mr44238937edb.57.1653647632726; 
 Fri, 27 May 2022 03:33:52 -0700 (PDT)
Received: from localhost.localdomain (host185251138155.static.fidoka.tech.
 [185.251.138.155]) by smtp.gmail.com with ESMTPSA id
 e8-20020a1709061e8800b006f3ef214e34sm1313306ejj.154.2022.05.27.03.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 03:33:52 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 12:33:34 +0200
Message-Id: <20220527103335.1968203-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527103335.1968203-1-angelo@amarulasolutions.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/busybox: make udhcp discover faster
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
Cc: jagan@amarulasolutions.com,
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
