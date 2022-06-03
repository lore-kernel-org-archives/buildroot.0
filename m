Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F4CCA473
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 13:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A59F860E24;
	Fri,  3 Jun 2022 13:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lko3jCEH1vrP; Fri,  3 Jun 2022 13:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB51760C06;
	Fri,  3 Jun 2022 13:40:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72A841BF2F6
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 13:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60F9060C06
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 13:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwQlOEv24_H7 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 13:40:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 304E460A8C
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 13:40:33 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id d3so6572111ilr.10
 for <buildroot@buildroot.org>; Fri, 03 Jun 2022 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=balena.io; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M1pdyOdCGK202puGFqkmyiZs9sJ82KuPRFduG1BMGEs=;
 b=MtR6A6U69/H+c1UltUMxasYeCqhiM6DhQQ8c06zm4fxXNQbnw4Zkk05+9qlPD7N1W2
 fLLGfuMQThm4SSwpMuF1CC+JTvlAV1CL0Gp/WwTHw5M1RYBD+Hu1B+0894rqlP5uB6AM
 UjCjXAyjEm7OguTb+9MfO80YcRK0dsH7/9AvtZUDMhTDDLyDR7b4CJIRPnndX3KXLnTP
 UsV3ZMrtJbKM+QpPl7+TqDAZEqef3G/DFbeKpeYG5WrneLw/7AZwRiVjC78vPbFYmRm2
 644tAiWznZXT5GGrkK0UHvlYPSKcE61ebatgc1qXEUqdyTkLR5ZaiDTNPbhaNChiYDj/
 xcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M1pdyOdCGK202puGFqkmyiZs9sJ82KuPRFduG1BMGEs=;
 b=Ivmq0FeZm8hnEnUNxfItx0Et4ZWvjzih1qsTe6aIyiKEE5yedezfEjsx5gCGpnts7p
 FmZKBWa8T+jeSs8Gyu8SjJvju3mXhH7+MwO7BnLgG5Wj4HybZFml35eAy8rBOFrokRdc
 PlQhCXYxLn2A2IuNUw3hzH6sfuRptxEv/afExa45Qt/er2H6yk8Nlxibx0Rr2x0Pi/Pu
 unDFODeJUpWILBztQUKDhNaQkw7BTaUYFnavD5zhOla5vbffeWm9UHlam3OxFMG1AhcB
 u9Vims54rS2Q+7/2UfugWMDzK9274OfbeDS9ASkPQMGkqBxDOSA3K7n6/WeJXHJzo6Pr
 xL3Q==
X-Gm-Message-State: AOAM533W+Km5H1KFtjc2YkJtlm/V/R6wV5nixoAw1YnfRnlinC9jTrB7
 C8MIy33GQcmMxN6r0KukZAb044wEYUdNnD2v
X-Google-Smtp-Source: ABdhPJwuVWtJuxQ2411F20lsckTHHrOAqRsf1++E37OQjiIjmChEj6q0fi3nJKrYgDlJgsBW/Nh/ow==
X-Received: by 2002:a05:6e02:1a83:b0:2d1:bb9a:bade with SMTP id
 k3-20020a056e021a8300b002d1bb9abademr5944766ilv.189.1654263632091; 
 Fri, 03 Jun 2022 06:40:32 -0700 (PDT)
Received: from system76.lan (24-212-228-80.cable.teksavvy.com. [24.212.228.80])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a921a0e000000b002d1d8de99e7sm2849997ila.40.2022.06.03.06.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 06:40:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  3 Jun 2022 09:40:03 -0400
Message-Id: <20220603134003.1419956-1-kyle@balena.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.16.0
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kyle Harding <kyle@balena.io>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 99caf7dd3d..68087cc28e 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.15.0.tar.gz.sha256
-sha256  a480dc6c8937447b98d161fe911ffc76cfaffa2da18788781314e81339f1126f  unbound-1.15.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.0.tar.gz.sha256
+sha256  6701534c938eb019626601191edc6d012fc534c09d2418d5b92827db0cbe48a5  unbound-1.16.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 782ed2b049..988508576b 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.15.0
+UNBOUND_VERSION = 1.16.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
