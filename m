Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2155EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 20:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EFDF818C9;
	Tue, 23 Nov 2021 20:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9CGseaD07aO; Tue, 23 Nov 2021 20:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8918195C;
	Tue, 23 Nov 2021 20:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0C21BF3A8
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 258E6400BF
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IWD2KPzh1eV for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 20:57:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 624A5400F2
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 20:57:11 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id p18so189902wmq.5
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 12:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8WnVE3dfGleA6YIUIsESWUwPPp/myQETZ8HqSSCDnHI=;
 b=nWZ2onaZ84VwPY/EaXXh/5RchdDPxGd/SIjozJPI/yuWmA5QhUmBD9xdPe0E0TXQTV
 hC4drRt+mSaWeVR3cQFFDfP100JuLB+VJBORPYq/2iOn0djq6lZi0ANy+FuNmdn1shvR
 wZO81Ki+HEcNX4WF4QSDa123wqbDXsy+bqJq/Tjs4tNQCiAQSDGkfMIhjk5TRUVneZCK
 pJ6E/HybKIAxhiuO7zCj4vE2usyKtr9tQW5Ujyo2pP2xOI1uBPzAsJFds/jJWdad8JnL
 QlC6rHj6EI2zkZFaMf1R1qylV3QASmdB3unE0Cf0ZKTJvaAldiS+Hhb9J3ZYnSpREb3P
 WUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8WnVE3dfGleA6YIUIsESWUwPPp/myQETZ8HqSSCDnHI=;
 b=cQOF7ysU5HNFNY8hQfA7ZMn3YE8bl/Q2aCZQZMASwUmCSackfkY0walsbyfWbNBGJt
 fwcEazXPQzkZ8lCRcRFg5TxuHQUWGFK/cLAhdDcIWp/NGWog6owSlJ1m5y0QkTB2vvk9
 Hcs1ZRuNSbrr5BMbJvijqTy5NRXPUVKYRi1ddtrkwTtMMy8yu6vmk1XTSGK5ePzJHIBU
 SRa8xgvIti5EKY61MZCknA2Mje/f3rV9l17IVVD5P/5atYr+9H78scEEu2k0AmWTEspk
 ezUvhe8GGcMMdUk5NFdoTDZPlEs0UwAJdFfE/EiKA+J86z9mTgP1/DD2iOoIhSbw/l/6
 lKVA==
X-Gm-Message-State: AOAM530WOLq+tgYM5Lxd6J8p0hCwPS9k3JM5IkjRzzB5q863N6SlnJI6
 qHcXcwehZDkMIvrsykd/8pqdvp59QholeA==
X-Google-Smtp-Source: ABdhPJxsF4TbdO0USmwALNzoyy0mE+FjdLTweeRTP1EiABTbDAbkX9RY8szyvS60jzEbHZQZbt9ftw==
X-Received: by 2002:a7b:c1d5:: with SMTP id a21mr7032599wmj.14.1637701029493; 
 Tue, 23 Nov 2021 12:57:09 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b92e:f94:7d9a:74f6])
 by smtp.gmail.com with ESMTPSA id t8sm13273197wrv.30.2021.11.23.12.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:09 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 21:56:54 +0100
Message-Id: <5c509bf436607ed0fad88c8588973edbee3d0713.1637700992.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637700992.git.yann.morin.1998@free.fr>
References: <cover.1637700992.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/docker: don't use sudo to build
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On a properly setup machine, it is totally useless to use sudo to run
docker; it is very bad practice. Instead, users really should add
themselves to the docker group.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 2aee129668..57445d5cd1 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -1,7 +1,7 @@
 # This Dockerfile generates the docker image that gets used by Gitlab CI
 # To build it (YYYYMMDD.HHMM is the current date and time in UTC):
-#   sudo docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
-#   sudo docker push buildroot/base:YYYYMMDD.HHMM
+#   docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
+#   docker push buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
