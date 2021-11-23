Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A22C433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 20:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40EE960A81;
	Tue, 23 Nov 2021 20:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZoAFobnBI3od; Tue, 23 Nov 2021 20:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF9A60A7C;
	Tue, 23 Nov 2021 20:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 014951BF3A8
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E578460A7C
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Okdc_f70pCXt for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 20:57:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DE1760A79
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 20:57:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso3447638wmr.4
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 12:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QiQeZvkwwEhmuv1uSINdE6i/PzBuoVP3qN1V4UcftV0=;
 b=DJ7zOKEMBDax8d0WZfQa3UkkyMslJhaDQTOuUZA7IrSTzbx8WuIRGrl9n69+0RAcTQ
 kW4pQqw9t4xydcLQ4kW0oe2JUg63zjcHYr2gbrHzc+/9FgDMEBZB0v7ZO37RH5BhFh5D
 fCjGydwyqvG7iHvxtVS/IScRXYLjzv99vZkdZAyT1Yxu6ktqFVi0zcdAqfPX7za2UI+f
 LsqG3eBLmsE1iSqB+KCPF6QpevF/aThwhq62I8DjnFyzA5XC+sOuEyzFq2yr9s9eSFM+
 UfzPd5/1AQzh1VoJckYgOyCpPKNSv2uYja49Mca2/GqEMRBOozLK0Qcy4P8jtHPNafyP
 5LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QiQeZvkwwEhmuv1uSINdE6i/PzBuoVP3qN1V4UcftV0=;
 b=bQ0fAdc2Ht9IjjtbVyre2Ex0k3K1uNgNEaJ50kTZZ3PUKIlI54IznJz4S1nmEcDBgv
 d82PSa8SAjBE32C/9jc+1cMvCYeUZE+E0Twj2q9gkqS58InM1VERMGYESgOd7t26aoLj
 0le20Eedu7kUdAOwHIBA0VV2+3JWr0jDFSHK3j9Z2KJPQWazWd7/Ma358BicxU5z0VpG
 gPktRqAbY7Wvgfif3V2ZD4DI/MNC3H3zK1D12b0jWWIw2EuJY+vQfH0q/5HmMQwvRLzy
 rP15frWN61lWUY7aSE4lv3E0c7F+pjX4Zg1IVulNGPHRm22bY9jMKSxINMW5Mm2xqG30
 qzQg==
X-Gm-Message-State: AOAM533q72GIlSohOxFV7paPtiMAM2Og6Ww4U3bu3MnJ+hevQC4fWvEx
 1eH99q+vvujsx4n8Hs10HaiGvtNUWYzr9A==
X-Google-Smtp-Source: ABdhPJy5GbE8CySrpYzXcpetuVgHQREWc8L7jkmq6152zOvAFiQwimO1Triwapx0XsTz7PdP4InV2g==
X-Received: by 2002:a05:600c:1e8c:: with SMTP id
 be12mr7539448wmb.4.1637701035373; 
 Tue, 23 Nov 2021 12:57:15 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b92e:f94:7d9a:74f6])
 by smtp.gmail.com with ESMTPSA id t8sm13273197wrv.30.2021.11.23.12.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 21:56:55 +0100
Message-Id: <ca903288a1b6f678294d96d3e7024433156866f7.1637700992.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637700992.git.yann.morin.1998@free.fr>
References: <cover.1637700992.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/docker: drop use of Docker hub,
 use Gitlab registry
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

Now that our pipelines are using the Docker image from the Gitlab
registry, there is no longer any reason to push the image to the
Docker hub.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 57445d5cd1..ad8704873c 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -1,7 +1,7 @@
 # This Dockerfile generates the docker image that gets used by Gitlab CI
 # To build it (YYYYMMDD.HHMM is the current date and time in UTC):
-#   docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
-#   docker push buildroot/base:YYYYMMDD.HHMM
+#   docker build -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM support/docker
+#   docker push registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
