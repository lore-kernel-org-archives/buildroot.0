Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45CFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 21:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 913C040AED;
	Tue, 19 Apr 2022 21:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRUSnB_XqmKi; Tue, 19 Apr 2022 21:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D8C40A65;
	Tue, 19 Apr 2022 21:25:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9D061BF3F0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6846605A1
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=threespeedlogic-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkUseKmIxFP2 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 21:25:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8B796058D
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 21:25:10 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso3126781pjv.0
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DWF5o8Lp4ZbayAM4RO3V0QOzHdNVJ+BAxxgASZccUBo=;
 b=PZYm9SYkmcZkONMV1aJwzkWu5+Yx/ferww57FQSqlHFxb+IxwvyCUBNTqs1gZZzwES
 Sjpy7uCu/VQTnE+o+uOIHBZjYoRO/wAnnhRs8kl5AVFP5EmNjdEJq7xuzeAmfhmMqnSw
 BMQIiivi5RGttJXXDZ7NC0a89zPFdUCQpBwEBFavFjN7iMALTWvbW9ERlJP/SB1VxsOn
 aqFf8Rr9eEXcLksJguUlaxYuoyNds/RZXg1SPnAFlDBlquocQTygKV3A9qsdOpuZyk4U
 N433GW/8McMd6dk1N5/m8HDnyOZ3FSRqcog9mXX5FQNmscFkt45TpyiNkd2r2/YnO8eb
 kQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DWF5o8Lp4ZbayAM4RO3V0QOzHdNVJ+BAxxgASZccUBo=;
 b=ZiHWD4MqLnAJXhvTJ5mjFU1a41VuRYSm1P+Mp4DUeCM+wWz7W1G9BuVqAfzIhp14rD
 jm2Y9u8EOtDFbOKrAG4ZYIRAN4RMNGwCE1K9BRBQBzA2WxRlElQKiSrSzE8oUOcl90qB
 PI7tcytEfVIYLtC4fvMt9UrG4qdFmJQ9+biRBNShZxJk7OMCheTZbG5JCVLhAOzohuwB
 W101EDd54M0qvna0PLKLOMGS5nqp6SR0ZDR7/qmerx2scJuyEw/IlKjrl9Y/ondKGgrh
 tCJeOKEjinQ9aMaWEsCq8ltz3M5ccmw/Bw40+FfytIuqvMmX1L6uLU7tiOA4+7kQylZ6
 +aWw==
X-Gm-Message-State: AOAM5328SWGvIkIUPy0T4a0FjX/2YFibmnJVlcFYNR19q2Eqh8m7CU9q
 ct9PR15nzWURrkrBtFjzJIWmwmY3fn3cpSx+
X-Google-Smtp-Source: ABdhPJzwCF9q1b1u0K+e2oHj+gjmuUs+RnZtYZkRyN7LaVzt+UcWqr+dKx5VasvbtDAWpFYQzuyESA==
X-Received: by 2002:a17:903:41c5:b0:158:dcf6:7f9f with SMTP id
 u5-20020a17090341c500b00158dcf67f9fmr17458209ple.34.1650403510096; 
 Tue, 19 Apr 2022 14:25:10 -0700 (PDT)
Received: from localhost.localdomain ([104.246.196.44])
 by smtp.gmail.com with ESMTPSA id
 132-20020a62158a000000b0050a6a93b3edsm9978506pfv.73.2022.04.19.14.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 14:25:09 -0700 (PDT)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 14:24:46 -0700
Message-Id: <20220419212447.2441888-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] package/python-orjson: new package
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


The python-orjson package is: [1]

	"[...] a fast, correct JSON library for Python. It benchmarks as
	the fastest Python library for JSON and is more correct than the
	standard json library or other third-party libraries. It
	serializes dataclass, datetime, numpy, and UUID instances
	natively."

For buildroot (at least for my purposes), the ability to efficiently
serialize numpy arrays is the distinguishing feature from other Python
JSON libraries (of which, simplejson, json, and ujson are already
packaged here.)

1: https://pypi.org/project/orjson/

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
