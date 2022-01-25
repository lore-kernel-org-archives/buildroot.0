Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B182C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECA9B4093D;
	Tue, 25 Jan 2022 21:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZEEf6qyTUAD; Tue, 25 Jan 2022 21:34:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 428574092D;
	Tue, 25 Jan 2022 21:34:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 007A51BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE22E4092D
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSz5npu1g0mn for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:34:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC31840875
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:34:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k18so22279988wrg.11
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 13:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laMKhyC9UkZHPJ542jYP+MEvNeRDtXVR9J7oVEKCU2E=;
 b=DquSXMKApsRSYtEyT6KpEzly8wAe2TRs81V2FzreQPE7CvQlwQ8Bz0kJC9ze/ovuuL
 REdrvjrpciKB/QcJACtyrTVUCa5ReVKXSSjCVFhCgiLShXsTTRw/BSDqV2FplU9+vnHU
 DUkJkXiLQhmhjpEAVeEyEJ7WyoI5dB9XGSLaGCHJ0unMrCwvpgvVtas1OZ9xYVi+Hner
 iB2wU+D+cVq41Px++XQEhFu5ZIfn4B3UY2mPlJe7E2AGko4y2pQKmgs+s4MRT9Wv2Lg3
 XW48mKfLfpGIZwJcBuLIQ9mEti+o+ZPZQBt1NUONE4ydowTwHO5osmf+Rn1L3L2ACHrV
 EwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laMKhyC9UkZHPJ542jYP+MEvNeRDtXVR9J7oVEKCU2E=;
 b=NT0bb4Q3gL03kZUs6j4nZDqwdr+WK6cTYuqlA/pU/A+LhKf1TPLuE3Alpg57J4kDOh
 KOqybfJ/Q4F4kxF25yEp0iZNSbLNodPEoS8mCoFmXwti4h1nhP4xbfdtQc4Ai740unMY
 koPzxtr6kcFFwcn4ww3HZxiD4NMRSGYIORQIL3gvupSs+T/Dbey5T3wFnGZHfsmnProe
 PTt8UuBdIKqTUoI+cJJiinsWKXSwlt3f+/klMtFE0W5pODvvY+yztqfalGKWfSFhqr8i
 pcPtf5TA4XqodHOin1xQJYjKgeGoe7iWldbTAXe12DPIRka4DHr3p/38MS5NlGBjJpzM
 PPzg==
X-Gm-Message-State: AOAM530wO7fZM5a5I0dCLsz659VJPaKZjbuC/fcsSsiiENAYWvKd5CPm
 0juBuyJSjSP4nOtTp9aXtyD8RVEemv8=
X-Google-Smtp-Source: ABdhPJyZit3Yhgq7JhONYoFLTHJFmLOqyIg/86thx6niFgZLJI6oqDWvED4fwLEaHKCQy/8fKdvpZQ==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr9332931wry.601.1643146464916; 
 Tue, 25 Jan 2022 13:34:24 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id k37sm4083505wms.0.2022.01.25.13.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 13:34:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 22:32:41 +0100
Message-Id: <20220125213242.301404-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-sqliteschema: drop
 python-six dependency
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-six is not a dependency since version 1.0.0 and
https://github.com/thombashi/sqliteschema/commit/3aae6a0bb6d4b11ef2c83cb23a796a320ea422da
which dropped python 2 support

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-sqliteschema/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-sqliteschema/Config.in b/package/python-sqliteschema/Config.in
index 8383647129..b8fed33c49 100644
--- a/package/python-sqliteschema/Config.in
+++ b/package/python-sqliteschema/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_SQLITESCHEMA
 	bool "python-sqliteschema"
-	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
