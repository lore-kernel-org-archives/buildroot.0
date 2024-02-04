Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054DFC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 15:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35CA827D9;
	Sun,  4 Feb 2024 15:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B35CA827D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ys-JXGd7u8-I; Sun,  4 Feb 2024 15:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A6DB80DC8;
	Sun,  4 Feb 2024 15:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A6DB80DC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B23301BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C41B827BB
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C41B827BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9p-rMSiXQ10 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 15:22:55 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40499827AF
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 15:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40499827AF
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d07ffa0a9cso27098441fa.2
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 07:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707060173; x=1707664973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TPb0/95PTTiPJERmUqUbRTj4MHzCPq3h941ntRqyDfI=;
 b=QQzUQmk617hw9SMIcrf+HGt2Hy+00SPJoha+pzCniJUMqMptSs21R9O3LL7ddmlx0N
 bJNJPoJsg75paRYa5fh6GTnFwrhcjU1YMgOqhObcdSNFC88nS/uTZ6zevoLlsJnAOxWA
 hzolIP3YMghrs6kA/O8vA0CLc16zOaMTKX9V1hMJT1f2iTF42l3l8fnREYmdfDxbaJyG
 JuT1J6yOTkuSR7xna266FOUImVQ77HORyvhUWIiAJRWHq3BYMvO3SMkYv8VR9Y4C6bn8
 Ks6wujW6JtZSn1cIS37f7GV43uEFSPwH2F5PdLqIjdNA3/jiS9EJ8foPixG77fgKmOaj
 aMpA==
X-Gm-Message-State: AOJu0Yy+lZwMb+6s4VzgEOdWfO9XqZdhSE8W2ECjkiAiRCCJYL6fV8uK
 AGhn5FlyRYhPT2Gotvn0dNHauoqT69eQgUfd50zAIbC2FunPwRl6xo9inJ9EImw=
X-Google-Smtp-Source: AGHT+IENLfrupyuYlrxcjjhGkzjYkuGG0vtiG92h/bIvrCet7i0fATmrZt3vzn0QYfZ/jum45AedPQ==
X-Received: by 2002:a05:651c:2116:b0:2d0:ac10:d7ff with SMTP id
 a22-20020a05651c211600b002d0ac10d7ffmr190795ljq.48.1707060172817; 
 Sun, 04 Feb 2024 07:22:52 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUkTokz4HfSCXGc8M0hpV4qqWH/ewvEaFHVcVQxfKF+c6jaLbjBHp2sptOlb3qwM+tyWBOE9Ocum5MZEdPqdMe9VxuhF/BBmw==
Received: from landeda.fosdem.net ([2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 by smtp.gmail.com with ESMTPSA id
 v23-20020aa7d657000000b0056020849adfsm1557363edr.26.2024.02.04.07.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 07:22:52 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 16:22:48 +0100
Message-ID: <d49b322f135647c46b0a6ba3d077e11269dae161.1707060159.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707060159.git.yann.morin.1998@free.fr>
References: <cover.1707060159.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707060173; x=1707664973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPb0/95PTTiPJERmUqUbRTj4MHzCPq3h941ntRqyDfI=;
 b=E2pTkmDsLyPuRRnVoqcjO1ua6gYycN/V3K0073ibtodz5Yx/cPOMus8iHUejBbNY4/
 /aqXPuah5MRoGWSQ2h3qHoU0K3DPxbhK8ouuLfqBpKY+rqvpS6YrZHBmH8LPNcM8C8Um
 Jkftnslql29bnHP4kcxK9lqFaUgnMt+qe2wGX8vR/U9jrxnUOcqJ8Slb9hTytO6TnQ1C
 ferpAc2zZaso1TzBia/XJfeh8rJlNfRTOH077Vw4f9C18tVzx8Opean0tb5CSmtB6OOb
 11Kn6T7Dw3LaQEWuveFa6Wr1CXOYUW6839hVot65IG7eIFl83a32jfjodtZnpPsLZ9C8
 VHVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E2pTkmDs
Subject: [Buildroot] [PATCH 1/4] package/containerd: drop
 CONTAINERD_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Commit 35af2bb8011ea57642777acf5613afa244d325d7 set
CONTAINERD_CPE_ID_PRODUCT to containerd but this is not needed as
CONTAINERD_CPE_ID_PRODUCT will be set to the package name
(i.e. containerd) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/containerd/containerd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 61a8472ddd..d3ca102797 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -9,7 +9,6 @@ CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
 CONTAINERD_CPE_ID_VENDOR = linuxfoundation
-CONTAINERD_CPE_ID_PRODUCT = containerd
 
 CONTAINERD_GOMOD = github.com/containerd/containerd
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
