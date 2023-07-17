Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C950BEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 09:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F2F94054E;
	Mon, 17 Jul 2023 09:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F2F94054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnXhmKvtyAs0; Mon, 17 Jul 2023 09:18:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 888EF409F8;
	Mon, 17 Jul 2023 09:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888EF409F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5BFE1BF363
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 09:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C81260EC6
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 09:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C81260EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lqKXU00_afqF for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 09:18:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B6660687
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17B6660687
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 09:18:11 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51e56749750so5672976a12.0
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 02:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689585490; x=1690190290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iiOUk34FBWZZUD+SPYtjv3uT4wq8zgdThCnYe5f/fBY=;
 b=RGV+qMA0HGVV48ZKIrSSN3Xex1b0YLH+OHdY5WKCOmuXKHKmzlNnmU7bZPTzZNxtgy
 4z5Op/3HmpE3o6qkoHUu4r+aY8X5eLW8DhmQvq73qX9VReNGswjuU79fi44Yx+FQaArP
 KNJXa1UxOx7mE2Kz9hvtCw+wjtZ2p2yWcxthrfQFZVhiKpJR1EyYageTBk+N65tKyV8m
 VY3iKjQo1lQHYiekAbtpI9+DxaH9x2Vut3LNZBjglZtGSPQ4LnzCN2PBfqngQIJott0H
 xbWefsKa2Vmjl3SJPmSjdoD6WZwK0jOHFfa3E+Z5buc3BG3hTMuEa5LSVET9aYMv/u8b
 loZw==
X-Gm-Message-State: ABy/qLa0v1JFn9jh9f7LRn6IiEUE6U2gFpUhdn0cIMWou/pVaU5ftJaX
 KMFj2KZah9/J5VBYsCrr7gc57PtEmoY=
X-Google-Smtp-Source: APBJJlF8/UF+1MqyTzrHj9qcZouOSJWAja/BnDo1f6JPoJYVNp5td3MKYJYeuZcUrk+So6VUUQ0gBw==
X-Received: by 2002:a05:6402:12d9:b0:51d:94d2:ffd2 with SMTP id
 k25-20020a05640212d900b0051d94d2ffd2mr12663358edx.2.1689585489439; 
 Mon, 17 Jul 2023 02:18:09 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 b22-20020aa7dc16000000b0051bed21a635sm9638745edu.74.2023.07.17.02.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 02:18:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 11:17:27 +0200
Message-Id: <20230717091727.2658078-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1689585490; x=1690190290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iiOUk34FBWZZUD+SPYtjv3uT4wq8zgdThCnYe5f/fBY=;
 b=MuBwfmUdYqo6HhpYEM+WeFdHcwVgB6FMAFJVulL7tlYiJa33kEBzCOf6FjFZDbsXlE
 8sfcJxxit/imep/zpLZW7UrR/BoWEyECuLCefcsS1pXpc7nt1106ZvXrrdW2Tl3JSXpu
 E7ZxJxWUuRHfn5nX8KFxM2+ZdTDYUQxZhVHfgIRxnWyKzFC9ZxH6t4YVcOEJmCWIByZX
 oRDf44B8cPabPzZjbLuuyylQ0K3fWfONlzvsWC40cXjWyv3gXGYyi9a51KQZBuefvdXs
 aHplycCMnPy6tmv7gRAg7xz4tuFHKAVgVMHiYEr45YMs74gw9tUwuDCN58PSEkHbLOIo
 QCEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MuBwfmUd
Subject: [Buildroot] [PATCH] package/python-pysmb: add the missing runtime
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

python-tqdm dependency was introduced in 1.2.9.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pysmb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pysmb/Config.in b/package/python-pysmb/Config.in
index 61d7c2a03e..bb935dddf1 100644
--- a/package/python-pysmb/Config.in
+++ b/package/python-pysmb/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_PYSMB
 	bool "python-pysmb"
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PYTHON_PYASN1
+	select BR2_PACKAGE_PYTHON_TQDM
 	help
 	  pysmb is an experimental SMB/CIFS library written in Python.
 	  It implements the client-side SMB/CIFS protocol (SMB1 and
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
