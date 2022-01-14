Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499DCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 17:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A852B60B26;
	Fri, 14 Jan 2022 17:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIHtGKLMnGuj; Fri, 14 Jan 2022 17:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0773060AC3;
	Fri, 14 Jan 2022 17:58:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9931BF28E
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 17:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC2B60AC3
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 17:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJolWECb7RCe for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 17:58:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAC5E60A8C
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 17:58:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso8707977wma.4
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktvHrIh/9GmD+2UrGAqv0Gh25Gx1LnpDPKbDBjDzwl8=;
 b=Rv74G/AqltOxFcpltAhbOAmVgkNGQ0MiPLsOmObF8xS0T8Ip7Yg7gvTuYa9RPDU1AN
 BJeF3nqn2nNOBLvjXub7vcAayPacrRPnqC3JvqdCup5zcZfxF2pFFP5Me+0QUZT9l25w
 OqQhfjsqyQoZf6gP0bn1Rw4F10dc9U5yHtQqZyM7a4UfyBbu1rScNPsHigAkZ56aqigL
 pgidcKI/2OuXjYnmgY05x0UDnplAXXNq6t01+V6nENQOrVUmZeH4HM258tY6fI3ZugZB
 MaJ/e2ENJrNV33KxVpFXNu9gsBf+PT8q/q1XrestWDshmpnYuL5vWtJkO5H7Bri+qzt8
 xMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktvHrIh/9GmD+2UrGAqv0Gh25Gx1LnpDPKbDBjDzwl8=;
 b=ZZo+ntkzIFyXOUbZMXs8GNq0P0CJtkU3BaFcOThMFk4905AAnIxsFPuAgpnScVdVpm
 gtvzPkm0gWePiXrCx1Oz33tbyboNdJs/nzq+5fkOfLmb1ejs+RQYPqmVqQcP/3HCJ5Ah
 4rePKeXLu4aqHz9Uvuls52PqLLVyx+UgZAoXngUgLEttd0sq7kb5viEivL2TqS8svb1A
 iSq1NoOeHo9aFrzmvw0ZCwlt3P3cMwMgkRiKw8ndbn1MKkBC+FFmGj7kR4xW+L/gJTWX
 hD9/JZ4mshClnkQh3bEU9eQugL+jX10wWvWdK5gG7Lu6k7LypOE1Xnrg1MovmAkOKCxB
 7bqg==
X-Gm-Message-State: AOAM531AzEUxIW8J0JOHmJ5MWI9qMPBz03Jkz7B8opZ+S19U5TDehTPd
 lAKRLK7G0ZbjE/ABXGFE8dh+GTzRorI=
X-Google-Smtp-Source: ABdhPJyuHb9+yTnOD77aGxDSiJdszeCKzsJh93AuSsg+XSfmA6kRKBFFlZdNXQj8Ri9cvEUbucz6Dg==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr8753386wrc.698.1642183114122; 
 Fri, 14 Jan 2022 09:58:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id i88sm2588906wri.1.2022.01.14.09.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 09:58:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 18:56:14 +0100
Message-Id: <20220114175614.963475-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: fix build with gcc 4.8
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
4e36e8f2081a66f477dd038793082045876d65ee:

/tmp/instance-1/output-1/build/hiawatha-11.1/mbedtls/library/ecjpake.c: In function 'self_test_rng':
/tmp/instance-1/output-1/build/hiawatha-11.1/mbedtls/library/ecjpake.c:973:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for( size_t i = 0; i < len; i++ )
     ^

Fixes:
 - http://autobuild.buildroot.org/results/1befc1552af91f34c600229138910c2078c2fdca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/hiawatha.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 14d3c9f1ee..25da98a43c 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -15,6 +15,7 @@ HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
 HIAWATHA_CONF_OPTS = \
 	-DINSTALL_MBEDTLS_HEADERS=OFF \
 	-DUSE_SYSTEM_MBEDTLS=OFF \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
 	-DENABLE_TOOLKIT=OFF \
 	-DCONFIG_DIR=/etc/hiawatha \
 	-DLOG_DIR=/var/log \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
