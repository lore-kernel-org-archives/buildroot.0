Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBB3EE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 01:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D969140B59;
	Tue, 22 Aug 2023 01:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D969140B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5t1nPQShyFh; Tue, 22 Aug 2023 01:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27C1E40B53;
	Tue, 22 Aug 2023 01:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27C1E40B53
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 742701BF30A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 01:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B7CA40425
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 01:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B7CA40425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Yt-AwkIIsCk for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 01:33:43 +0000 (UTC)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E266F40620
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 01:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E266F40620
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-58dfe2d5b9aso54370007b3.1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 18:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692668021; x=1693272821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TrEoCVByjQ7aV+7qqdEBeV2x7Z5kzFJnx1aWoXLK42Q=;
 b=FiBhy3mHQflIHZIBpvwbIKAQucJstd9AyDGg7ql0kwKWL4SYgWOw1Iykexu33vK2A4
 cYXzOKdg8TfA0d5/Waw17UhLW7ketmv1ZffgZDS4wo6guhYPwEshPAuPuG3vOkaHBAC4
 AREUDNent+uBPebHAf4mcbEKSvPhUR4MR7i/qAdCcpgpa1MGRJMKeEUCqFk4dRtTCM6x
 etygYouEjn0/Tf5Nbb1du4OcFj9PiOKJA4AAQssznA5J2M7lX4eOa53lPChVQJNcAhqQ
 BGpBiGSDsZYiOQxenNVlzWPN2y/55eEIjvD3p0Matq7rKsgJ7Ww0NA1iGdEmR4k8imBA
 Un+A==
X-Gm-Message-State: AOJu0YxTPk2nFGSTV0sJZxcNKq1zGJIqnYtQrDeE3NFl5pCm72oJbq2C
 bmmEWq5eCrjrZImDSES8RKw8aEYKsJcljA==
X-Google-Smtp-Source: AGHT+IHifxz8vpU/LGw1V5VAhFiW4m+8/Mh7b3ZXqcMsAt7tGljSqKQCyQT5NnX0q30zGeKef04TNA==
X-Received: by 2002:a0d:d644:0:b0:58c:ba72:37c2 with SMTP id
 y65-20020a0dd644000000b0058cba7237c2mr6530647ywd.12.1692668021387; 
 Mon, 21 Aug 2023 18:33:41 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:55db:9e25:2c0a:ecb3])
 by smtp.gmail.com with ESMTPSA id
 n127-20020a0de485000000b0058451c12076sm2550229ywe.14.2023.08.21.18.33.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 21 Aug 2023 18:33:41 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 18:33:32 -0700
Message-Id: <20230822013333.47036-3-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230822013333.47036-1-ckhardin@gmail.com>
References: <20230821175828.42827-1-ckhardin@gmail.com>
 <20230822013333.47036-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692668021; x=1693272821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TrEoCVByjQ7aV+7qqdEBeV2x7Z5kzFJnx1aWoXLK42Q=;
 b=lxq/REo8q+PGjJjB33bp4usO/UQPBE6I3dzfOaBcxUEj1X0s1gVsbZPl9tuZW5Bn86
 IQu/yD1I8loKHsFaLCWSIerlmzVfMSqO05LxgRscjL4guaFYccNLw8Fq6fdFQ4+p/Xiz
 2k7tHMgmYExNWrtry9DEMxZN5iud0Q9YqvxhSwhvFvocY0plmLPvnsJdeCSPuuPq6/Rh
 3aNz1IddcNitaanD+shxOSXsnDVVVE1WtQIZduIJ8TIVJgupkNZS+/tBAZUcJNTmcITs
 7NmYOASgJ2g+/o9s0hctitnTX9PL1MiF+9OSjM6zZowp829bkDQmMiTF81rzs+PE1OyT
 tjLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lxq/REo8
Subject: [Buildroot] [PATCH v2 3/4] package/python-ruamel-yaml: add host
 python package for dependencies
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A host package like pykwalify needs to the ruamel module for build
support and so enable the dependency.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index a6fed3bc2c..4f5691c981 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -14,3 +14,4 @@ PYTHON_RUAMEL_YAML_CPE_ID_VENDOR = ruamel.yaml_project
 PYTHON_RUAMEL_YAML_CPE_ID_PRODUCT = ruamel.yaml
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
