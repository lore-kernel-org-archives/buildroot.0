Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3079C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 21:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CDD342A90;
	Fri, 26 May 2023 21:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CDD342A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUz7KWwe9_QN; Fri, 26 May 2023 21:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1587C42A8C;
	Fri, 26 May 2023 21:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1587C42A8C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90FA91BF25B
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 21:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75F6C42A85
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 21:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F6C42A85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmqxzP9qb76x for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 21:49:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460BF42A80
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 460BF42A80
 for <buildroot@buildroot.org>; Fri, 26 May 2023 21:49:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6077660c6so8569105e9.0
 for <buildroot@buildroot.org>; Fri, 26 May 2023 14:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685137779; x=1687729779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1LA1o0EWqW5lKxfsp/7/0XCYEGgpDNF1DMAx8F0CMg=;
 b=EgY5Rl6OUoQDBdE1He69MUam79JfMZPnb4CYt1TO5KDLPwoOYVljAl8LlB7yg852Bs
 JLkRdrgB3rsPEQ0kWjqi2Qs4T8gGc2kkajP4jsfZynGgeKw0mHjZFwOs5dpCtsc5u2AK
 IzT9z6txt7j95PDysblNihlEtYT7tb0IW/wAWiYgrl8EZAuLjDfspn1g2gCCETYNtTXj
 fPROl8QnDg+g3jx9kGd/7ozDUafrLFeNd2toadaqiC3dUtsXn5xGRKF3juhcdft7ms/U
 9rq66Nsoz9Dox4JbcnAPl6j/to5xHlID+uUDa0nnRxXw4QfdF7pPsfz5/LS8EyUVrr5u
 D+hw==
X-Gm-Message-State: AC+VfDz2XrzH3DQ4bY43JwsQC1ys6idRx0QwOge/QesW+6bbm2f6pMtX
 Y1ysh3dvlMcpe/vqhANad0VeSfncRkE=
X-Google-Smtp-Source: ACHHUZ5ofGjTVy967j2s+UQ++7WG94QZ/MPSojYuZQvbDtc9hoRR+XMRHDsm13cZo/556eloLfB9qw==
X-Received: by 2002:a5d:54c4:0:b0:30a:8c0b:320e with SMTP id
 x4-20020a5d54c4000000b0030a8c0b320emr2257370wrv.10.1685137779023; 
 Fri, 26 May 2023 14:49:39 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4082000000b002feea065cc9sm6209960wrp.111.2023.05.26.14.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 14:49:38 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 May 2023 23:49:35 +0200
Message-Id: <20230526214935.1671829-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685137779; x=1687729779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i1LA1o0EWqW5lKxfsp/7/0XCYEGgpDNF1DMAx8F0CMg=;
 b=ksxXWWpRvk8UJiPZvntYPwBTYae8axhS+/yY+TkQlTph7qVRhvoeLQPt9hXGa5y9wz
 PHGhhxYOWCvBQVizlgQI5VnqO0gKrQ8gYzXSX/YwsviL0f1BseQp/U2sF4dcH3+7hq5n
 zW2WhhUFv7+ho8J9Fcpltd1qjbpStwVEbWt+KuP3mFYTjQ7KKRIDwvtw1AnCYzPWJMuY
 AMvgZowmWxM/Zc8St/kSDw4vWXg+EvrNaTNduqAYE8CRAkaTeWtXwOnhJq3hajjT72js
 b3tQZzzhaE95Va1777w9OKNArMIg3dBPRWunMMBGZ9mQNbLN0XrALQkFQFFcp1Gbww8N
 eRtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ksxXWWpR
Subject: [Buildroot] [PATCH] package/python-django: add missing python-zlib
 runtime dependency
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tree django core files are using "import zlib" and requires
BR2_PACKAGE_PYTHON3_ZLIB to be enabled.

django/core/cache/backends/filebased.py:import zlib
django/core/files/images.py:import zlib
django/core/signing.py:import zlib

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819300

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/python-django/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-django/Config.in b/package/python-django/Config.in
index 5830cadc93..c236a6dc0b 100644
--- a/package/python-django/Config.in
+++ b/package/python-django/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_DJANGO
 	bool "python-django"
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_SQLPARSE # runtime
 	help
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
