Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9077AC77B7A
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 09:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9C5782890;
	Fri, 26 May 2023 09:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9C5782890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRiH6YOWWVYp; Fri, 26 May 2023 09:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB2DE81362;
	Fri, 26 May 2023 09:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB2DE81362
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE6931BF859
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 09:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88485820B1
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 09:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88485820B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TCuG80PzwKH for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 09:43:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F31488134E
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F31488134E
 for <buildroot@buildroot.org>; Fri, 26 May 2023 09:43:38 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96fb1642b09so73425766b.0
 for <buildroot@buildroot.org>; Fri, 26 May 2023 02:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685094217; x=1687686217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iZCf04Wgfis5e1p3JPEaK/kfY6XJrrE/JknvgnvKeQQ=;
 b=buY9dUMLCLyEuK8O2hLLHxIhSHaSXBp+7A1T46aXulpcFiTqHcBbHaRX1j5aQjQmb5
 q4Dd0V1Jj+lZYIu1gYbIEexIhO0qvDgbunBQqKBJ5sOXiXzHQwUwzdnKEteCU2hVK1Xn
 aAFJFwvdt8OYYc09H5i6EBJpZcFSsfDhgrE4gqJpVRHJjVnPPkpa/WNeGvyHvauFqWOx
 nk46hCN+KK/SeI62QL6LVmYJlnW8S4eTh3O3ieAiSIk5MKJZl1aYMWfO4i64QnNjhiej
 YE0ogv4AF7iS1+qJvmgWnTGqd0zCD7YPu2+jpWgLMRJNsaZWMkuaustWFBtAX3igw85Q
 EK5g==
X-Gm-Message-State: AC+VfDwKKL+V2p6N+Ju5FdKlGLmC+fBfLc7a/mY1FDGpdETv1PMbNFIZ
 9jLyA7r+95bEHO3J5RRyNzIsz0CqfYscgwj/n7Q=
X-Google-Smtp-Source: ACHHUZ6D9T3t/pvxbwLRPZEXHTwmS4gwg3d0/vgtOcP2AoGXsXPQob59nN1zPChKqOU8l9VR79+OTA==
X-Received: by 2002:a17:907:d10:b0:96f:d345:d100 with SMTP id
 gn16-20020a1709070d1000b0096fd345d100mr1269885ejc.59.1685094216792; 
 Fri, 26 May 2023 02:43:36 -0700 (PDT)
Received: from localhost.localdomain ([91.90.166.178])
 by smtp.gmail.com with ESMTPSA id
 md20-20020a170906ae9400b0096599bf7029sm1942997ejb.145.2023.05.26.02.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 02:43:36 -0700 (PDT)
From: Witold Lipieta <witold.lipieta@thaumatec.com>
To: buildroot@buildroot.org
Date: Fri, 26 May 2023 11:42:19 +0200
Message-Id: <20230526094219.3374291-1-witold.lipieta@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1685094217; x=1687686217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iZCf04Wgfis5e1p3JPEaK/kfY6XJrrE/JknvgnvKeQQ=;
 b=nYuFXGKlvRdGJte4rtNe4Z6AFyL8052m5MA1L6s13+BVzB7JAa+QSJGZXFjXLvaQMe
 0klNyBBXNbGeT9GPCwwsNb94vAmQ5t4Jwo4HnmYh5lI1Dm4IwcUmCUnUiabfcPO0HtP8
 vZdcXj9YmOkb1+3vNH4eG5IVVSIVAHcqjmQbZW7g+gEnymeiLAWMowAAz7yyB6Gnf5rR
 O67Vjdva92Fv1uQgdBGEcpOf/NnOf4+pA3WgO7pdm0CQ2L3nkswSwHzp7cqnh/CtkBtr
 SdTgFdigdHHoKJ0xa3Z1Zldrdd8+BMNuPxxRdf+J8vI9RP/EpFb1GJNOCmGNciB4kdL8
 m7VA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20221208.gappssmtp.com
 header.i=@thaumatec-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=nYuFXGKl
Subject: [Buildroot] [PATCH 1/1] package/python-matplotlib: add Pillow
 dependency
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
Cc: Witold Lipieta <witold.lipieta@thaumatec.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pillow is mandatory dependency since version 3.3.0.

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
---
 package/python-matplotlib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index b936777662..8a9281b8e7 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_KIWISOLVER # runtime
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_PILLOW # runtime
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_QHULL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
