Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EF0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 22:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6364860B26;
	Tue, 22 Mar 2022 22:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6WUDNc-OyoUk; Tue, 22 Mar 2022 22:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F3F260AF2;
	Tue, 22 Mar 2022 22:21:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B09E81BF5B3
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 22:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A95DF40B6F
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 22:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TtymRXK0RQO for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 22:21:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 913CF4048E
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 22:21:15 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id b8so16800065pjb.4
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 15:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iBn7k58gCgZxZygH1aVWqlLksXIfZfn8+2vFb2GY1Fs=;
 b=B5oKOqZN7uliDreaf7FZRLGFQe498C/ZdAh9VOyPEeHOkSgdPjOG+hK8s/5mQfDcvm
 PeLRXVmx1zObTQ78OpcxktHpLOHCrLpKqrlJ41BqmafPiJFIq8mJddrfJmE1TMyCBa87
 U7/UdSAaBJpb64KdKb+Lgyud7SrE5AltHyjEWCJDvR9LjuLI+ZBGkAnh+ZmYLIUx0IGp
 imly+ccKNsV74FBaGtWlrJa6MgX6RKADhU2JRNXC7UNWysOeXJYYYVQYZwd/627ehRsX
 FyZTcVoqBuiAw8NcRU8blDcvwTd4Yakfo2hWrgGoXE2E6ISWuaV+tZzU7wP/EXi+MOhd
 l4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iBn7k58gCgZxZygH1aVWqlLksXIfZfn8+2vFb2GY1Fs=;
 b=rWev5+Z3A0wIZL8WTriLslDYKDMxgJG2wxq56yppOQiNQaMGgV8M4GoMZKujaQbm+F
 a5PC+f9VBn+lpUQw/K3DZ/UJiLLEnGVT5NS7qtGUJvTwD+aKnkAx6//i+hoepyaQtuXQ
 J8GgrlhkLC0KxHajRqWc1/kJyEUIpMKg/GNL9jdokBPPhkTtBXsdbpQMhSuQbADi+2gu
 XgDRJ2SnMg0cc7a7GRQ7UOA23eL8IHQTTX6He8q9+faibJkcTZp8zWkCAINQ3n9kEdXB
 jEbx6u3zmmm+5bvkmyrIYC/iCwLEu3tp7o/y1ZdUqyr2wjHzanq8/f3MYuzFHP0P/+Ej
 mjyQ==
X-Gm-Message-State: AOAM533qxOg2vxpmLJtu7oWEzNkrd/jBZ6iBLbEYYmR8us6jP9ijhYxE
 6hiVVhESCJwDnH2twJ2ycEYUVpivG9g=
X-Google-Smtp-Source: ABdhPJxy+pJ3VAlosSbwQIWsFfn5e1EejAlURAoaxyYpFVWe25AoMHmwvQE0gRA3OGrOhH0D8sGp1w==
X-Received: by 2002:a17:90b:4c8f:b0:1c7:7bc0:954a with SMTP id
 my15-20020a17090b4c8f00b001c77bc0954amr2273524pjb.214.1647987674547; 
 Tue, 22 Mar 2022 15:21:14 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 h14-20020a63384e000000b00366ba5335e7sm18415313pgn.72.2022.03.22.15.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 15:21:14 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 15:21:06 -0700
Message-Id: <20220322222106.42347-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322222106.42347-1-f.fainelli@gmail.com>
References: <20220322222106.42347-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 12 version
 selection
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
Cc: opendmb@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
 mmayer@broadcom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch allows to use an external toolchain based on gcc 12.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9346fa3feb75..683204e56ebd 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_12
+	bool "12.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_11
 	bool "11.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
