Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E49C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1787160B79;
	Tue, 15 Mar 2022 21:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpwqyLaqRwA5; Tue, 15 Mar 2022 21:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D8260AFB;
	Tue, 15 Mar 2022 21:18:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D02BB1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCCC9401A6
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPTGCNnuUgbV for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BBB04018A
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:18:03 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j17so410003wrc.0
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cGFfCdidYrrEasPiMjCRGXxv6OZghMwe02YSPsJOJds=;
 b=jjYK6u0fCMcNRed9ZjXni61U3QokZS54tEnCha+O4w37JpYd9yHGcLevUr3tOFv3aI
 /C5HRj2ghooWzLmZvBy0Iz5jg/yQMIo4Sewtf7Gutynj0awyVAtVj/k25BiOFwrSSrEL
 aWXgrrF1a7e6dm4kX6lZ5xJ2yJUADm97vrn/Vc28sWR1P1jV7AZWvmvCk9SQFqqB2skp
 gqtoOrV7UI0vn+SYF1r2ohX1A1vAUD768GITuQ+4GPAvoefU/EHyZ6oyWveTPKhZ3eg8
 DbLFKqWKuJV/woqrWycr9IczUcF7pdUfHt6fbq/YjyqcZYFwM/OsIngobYMwXuY0RIMW
 zsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cGFfCdidYrrEasPiMjCRGXxv6OZghMwe02YSPsJOJds=;
 b=K6d2FfRzVpk3Mq1Dsst0Uy5H6jiMQPmeM91JngFDPUSQmM0gUprAXVlpXZUdT3ekya
 exLwkg2DBcBSKjfbKgP4Z7y/4OdEsGAsEH2r/BNw06MdzxADYz+O8gaobzvXEVSMKiEt
 5I1cJBWJu8hR8zt2IpfOWK6Hfqi8LuacSPwu5EnDvX8f5Ktcv1exj7GCCD5OhrFmcI3C
 ZTt/Sbz+HD5/4vOzSpUgqvM1z7FbbaMwW3o6GSkabanZv3GScMtZoBt32sLwl+XPebiV
 GQaTxA9SQu5vv9u58sqTf9E3nBg/EY9v/ydJmbtw9QDfbCZi3neJ3pxiwq47hB9i6rNo
 zi4Q==
X-Gm-Message-State: AOAM5330FgSwWmcaSoV1WGHFbM888sMF9ZPqOvXqo+PVtHsTovXiufqz
 8TeHQb83ZbBnYOPsD04qHgWy4u0kyPA=
X-Google-Smtp-Source: ABdhPJybUgXtG15Zzb+akJaEv/4j9lvWHdapgJeCs0pyCxShMNMEFu2nls0ZZQ/kmGfpbfpaf3K9uQ==
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr21898176wrn.246.1647379081133; 
 Tue, 15 Mar 2022 14:18:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b001e6114938a8sm74393wrs.56.2022.03.15.14.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 14:18:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:16:52 +0100
Message-Id: <20220315211653.2297582-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-avro: renumber patch
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 77704462c9e2422b6f9a07d35d88918e790e6940 forgot to renumber
patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h => 0001-drop-install-time-linting-and-imports-sorting.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/python-avro/{0002-drop-install-time-linting-and-imports-sorting.patch => 0001-drop-install-time-linting-and-imports-sorting.patch} (100%)

diff --git a/package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch b/package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch
similarity index 100%
rename from package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch
rename to package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
