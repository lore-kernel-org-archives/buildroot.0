Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B422BC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 04:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE0C81819;
	Tue,  8 Aug 2023 04:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE0C81819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLlEOfE_MUfD; Tue,  8 Aug 2023 04:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4717817D3;
	Tue,  8 Aug 2023 04:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4717817D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 860301BF3AA
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 04:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FBAA402D7
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 04:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FBAA402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgzV0R_V3nKA for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 04:40:55 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A3C840102
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 04:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A3C840102
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5896bdb0b18so12942567b3.1
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 21:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691469654; x=1692074454;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FmLTN9ZltvxhcNomuvCrr96r1TdaOsWvl43ua5x5Q+w=;
 b=gq4egQNere8CQwNOnRdL6ZeDKgjkoiK2k/dIm86ZXs0V8jqULTJRV2OKzZFbXSfxtA
 Sfrt1JEfmETL5eDwpflYHopshfk6OaReZMPjexLSgpnqpxIypk55vMDRIEXpuAvoin6z
 Q6Vx26IQi0Xzmo13sHXJNQjymk3p9Xr6WN2frMc9vjasDmmOhM3npTFYDoJtGu59TwIk
 GsvXey1re0M5gHAilFB3HPp/S5prgluaxRQsjVutqhZ2rcMpeuvzv5CgcaMHvE33Vm8L
 z7newobtgmlgqICOBtM/lVMaYOelfCjRVBJ0BbOYH2C6GllcFo8NsbuNwcdClMS0ghuy
 T5/w==
X-Gm-Message-State: AOJu0YwdktrsZLn5e91Xzc/XaeTe7W1t1OjUgK+vntycSMyOMl2UYdP7
 905ZQ20dj3YVNE/BmqivbBJe8wHQSUTLmDgH7WPTErpuWPJn8C4B/zIZqve15w4SXm4TKK2TYms
 jpJ8l56c+X67DczYM8rHudEbcZ4OPvuBcjit1ODOCWtQTiul1/YI46PsiXEsPYfdZiHV9
X-Google-Smtp-Source: AGHT+IGKVy3ww+J6G1iZI9AdG66YPQzDoXSIW7Q3rMONFFevm5e0L4csQAe6TDazy9zBqEQRUVpygFXOoxJ0RA==
X-Received: from drinkcat.c.googlers.com
 ([fda3:e722:ac3:cc00:3:22c1:c0a8:1b08])
 (user=drinkcat job=sendgmr) by 2002:a05:690c:3512:b0:57a:6019:62aa with SMTP
 id fq18-20020a05690c351200b0057a601962aamr134501ywb.5.1691469653981; Mon, 07
 Aug 2023 21:40:53 -0700 (PDT)
Date: Tue,  8 Aug 2023 04:40:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808044047.4065708-1-drinkcat@google.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691469654; x=1692074454;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FmLTN9ZltvxhcNomuvCrr96r1TdaOsWvl43ua5x5Q+w=;
 b=Pogqyi7vCwR/hWhVk5oc5u+XZYakJDRgSpcnar8PNtp38NCqDzf7ORT7IHWBOjn9I+
 c+saw471J3koLR2Ojbfs9ZxwWZMkfCWoxMUIleZ5nUMfUlSysWQeIGmNCuVv+PrOMGhY
 5dnCkuxD6RNyWQZZ+zZ8pNsQmMXZrJP40gSiqGIdQrV+obuhUhOkr30C6N9zyTz+8EaQ
 qz7T0Kq7UTiYZ00lyuPIUY3SHsdNw+UeroetD98sYhKhaSUPDvJ+MmtbXtRuI1ibk8+s
 Ox9GANUZGXyjCsp4beJRPq/sD2NXj8vWI/st76dnerik7ZpQxVtOjSAUCHcoF82kmcC1
 r4GQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=Pogqyi7v
Subject: [Buildroot] [PATCH 1/1] utils/docker-run: Bind mount .git/objects
 if needed
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
From: Nicolas Boichat via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Boichat <drinkcat@google.com>
Cc: Nicolas Boichat <drinkcat@google.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If buildroot is checked out as part of a 'repo' manifest,
docker-run doesn't fully bind mount the .git directory, leading to
commands such as `utils/docker-run make check-package` to fail.

Signed-off-by: Nicolas Boichat <drinkcat@google.com>
---
 utils/docker-run | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index ab95e61e84..6a58db6d9f 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -32,6 +32,12 @@ if [ "${GIT_DIR}" ]; then
     # path already (in a wordir), then that's a noop.
     GIT_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}")"
     docker_opts+=( --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}" )
+
+    # 'repo' stores .git/objects separately.
+    if [ -L "${GIT_DIR}/objects" ]; then
+        OBJECTS_DIR="$(readlink -e "${GIT_DIR}/objects")"
+        docker_opts+=( --mount "type=bind,src=${OBJECTS_DIR},dst=${OBJECTS_DIR}" )
+    fi
 fi
 
 if tty -s; then
-- 
2.41.0.640.ga95def55d0-goog

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
