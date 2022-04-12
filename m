Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23B6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 16:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 539F040B1A;
	Tue, 12 Apr 2022 16:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJOYwfNEXmgy; Tue, 12 Apr 2022 16:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 793BD40B15;
	Tue, 12 Apr 2022 16:38:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C48AC1BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 16:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B140440B15
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 16:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYDyJXK0qxsy for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 16:38:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8A2440B0F
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 16:38:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1970738wml.5
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 09:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/XmKAatc7lM1GnsG7658Z3aNjyNRm1F1oqyOHy9yR8=;
 b=DXgPUPbGPXRYGmRUZbxhrEsLDvTDeoLEONvycLp30cR2Zre7UZ3U5wOwLM71MdEe8d
 iYq5hjaBOP75iZfgKeJ0TXtxPmFLORZ4xntQthR2xHGE/cruGt061vyJvZQeaM9PLTKv
 C+iCOVXv66UIUjkAExmYAE3f9utbNFxREUThGZee0DNOJHYSZcQt+qee5Sk70OrUqTlS
 p3KdLIClJZyw9o6rELI8h/j3y7zqJaDbOakL6iXh7YY4X1HbcTjhvgY06XkWPvParhME
 ir/wpSpMmdu+t2FRwhEmKtyhNtfQVArFvbZFJOl/ysAFYZ2p9jkURusS22b1BruXCZGs
 zcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/XmKAatc7lM1GnsG7658Z3aNjyNRm1F1oqyOHy9yR8=;
 b=AUA4qP7N4W73zeOPzLemzL9R6RWXsEFsOE9vYmv8yRlk0Mrlrzn+mQW88k6XtNC9fp
 nU6abyVOITQBWD098QnOBZpnhImXB16pDdT2y2/FFzuhl0P//vKH9x4I0D9qdAQaRpPP
 2yckteq4OOKjYJozQUh0E1nPVXcblYx1dNEqYVvbPaAGdAjHc4jM1GdgwaR8jZyJUWcQ
 41+oWOYuU3x2oRoYPIFAyOjdarzDjC6kaVT7xi456yoCcHZmYUs0pJKBA/UYEp55PN9u
 xR6g0QvhHSTtHJgZVfY1X5MyASFJNACC4CNwqe/zaWNiAw3ZnGy1DBy1REYnqlqVYrsu
 UZCg==
X-Gm-Message-State: AOAM5322EUuf1KslufnViwnxzhgjGHJOmcU94ozSu/f9ASz8wWYDGpa/
 /QVQbJbEsAOPyEzNNCu4PX6lTl5ZuNI=
X-Google-Smtp-Source: ABdhPJx35E3LzqskGxo6pysWk4yIi+RqzGQtdmCRzy5Y3hPAxmTdYjnB7WJDOZOCbgfkSNoxEV/EQQ==
X-Received: by 2002:a05:600c:4f96:b0:38e:7dbf:f80b with SMTP id
 n22-20020a05600c4f9600b0038e7dbff80bmr4948085wmq.2.1649781511712; 
 Tue, 12 Apr 2022 09:38:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056000188100b002041a652dfdsm30039798wri.25.2022.04.12.09.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 09:38:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 18:36:24 +0200
Message-Id: <20220412163624.1143941-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netdata: fix uclibc build without
 wchar
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure without wchar raised since bump
to version 1.33.1 in commit 73dc2eef2dc40b78e732872b26eee0bcea1087d1:

configure: error: Netdata requires a compiler that supports C99 to build

Fixes:
 - http://autobuild.buildroot.org/results/bca4d370ed0553d5f99f1277d0a1e3b49f62b95f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netdata/netdata.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index d29733d8f6..dade6c625b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -18,6 +18,10 @@ NETDATA_CONF_OPTS = \
 	--disable-unit-tests
 NETDATA_DEPENDENCIES = libuv util-linux zlib
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+NETDATA_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
 NETDATA_CONF_OPTS += --enable-lto
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
