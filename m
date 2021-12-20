Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279C2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 15:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90DBD8176A;
	Mon, 20 Dec 2021 15:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ogsO-kVeDwW; Mon, 20 Dec 2021 15:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E4F81497;
	Mon, 20 Dec 2021 15:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43E1A1BF97F
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 15:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32DCD813D7
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 15:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbgH8a8fdpLh for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 15:56:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AE1D813B3
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 15:56:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so194172wmc.2
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 07:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fCHrTcuHHViStMjauVRRGKnVrvi/XVvQM9gvQA4Wqko=;
 b=an7BUv16wx/IwFTOKEKbc/1/fFFVcaAtxprn7E3+bRTyAzFtveZLmxRNVIpWWy36xS
 0S9gJV9ggjc2EQXRRFNcE5skOmeiKxK335Dykx14q+gdclrC9QjIhMBp8fz0i07Zitja
 TZLyw3qS0i9H99sk9VDOrfgp/qI5OFDUkqTY05zgBdWa5qfq6u8kFF4IhweIHXqEksYg
 Xyv3aHUIAm+HXTvAbpi9f1UZbgP3KKHnIFxUIMcqjsJHU6fHSRijPZ9dH46jyfjXYw0m
 SNZRsRLMqsCR6gfEhoxJZRK0ZvlQG61fi/urzzrgGENuxgrofJGkRiLukDJ4LmoIJwEH
 /6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fCHrTcuHHViStMjauVRRGKnVrvi/XVvQM9gvQA4Wqko=;
 b=5441kGbpzmBQLKxkWniFm10Z5C28lInnOx0vCzmHwbesJ9JvhalWxwGIvcWlimFC4H
 hk+NtFU1Y+W6MedMbt0ee29wNg2NuLiKTI787eoNmm9fyBD+7NR3Lvm3IYkHtQKfAAlA
 9Rq2nhmNgvKu0/duVMTW/8hsNaeJil+xbecgxNQ4juW5JdGP2uLKWZpISE8NkbePQ/Zn
 YLCz1/20sHyAhDmrH2AqFdUETfUZHAfe9QuQCRa5YEDvdPKUqFVR/gxxbUDEPBt8hFRj
 I9GTxoqI0MWLAr43pBdVMKl+NS8/XFCrZUic029wt3K+L2VKA/3hPm4q/vRhpOGklZPg
 jt3w==
X-Gm-Message-State: AOAM533nk8s+99OIsmmBPho+uvVCf1nbJ3QUIhyiCIUNoNKXTrJWJf9V
 2r1/y9ricgvtY6prz58MBms9KCPs1WaOXg==
X-Google-Smtp-Source: ABdhPJy1nYc2yP+ml4MZ5NbCsAtALR3VGrQOU1u5p5ytFOccFCs1SmKIUA6okgFbushK7ALtKgUhJA==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr3784462wmj.110.1640015786395; 
 Mon, 20 Dec 2021 07:56:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id 1sm5504472wry.33.2021.12.20.07.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 07:56:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 16:55:46 +0100
Message-Id: <20211220155546.2566020-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: disable tests
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tests are not disabled since bump to version 2.0.24 in commit
721f05420cb5908aa19eef47f96418aa6cd04398 and
https://github.com/CESNET/libnetconf2/commit/2cd716353d0922ff57c34ead58fbcd14b7fb92af
resulting in the following build failure if cmocka is found:

In file included from /home/buildroot/autobuild/instance-2/output-1/build/libnetconf2-2.0.24/tests/client/test_client_ssh.c:8:
/home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/cmocka.h:2334:47: error: unknown type name 'va_list'
 2334 | void vprint_message(const char* const format, va_list args) CMOCKA_PRINTF_ATTRIBUTE(1, 0);
      |                                               ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/fe793ae69d952a7a07d6d07e179925b67469dff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnetconf2/libnetconf2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 33e1fadf76..ddbb99b7ed 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -13,7 +13,7 @@ LIBNETCONF2_DEPENDENCIES = libyang
 HOST_LIBNETCONF2_DEPENDENCIES = host-libyang
 
 LIBNETCONF2_CONF_OPTS = \
-	-DENABLE_BUILD_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
 ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
@@ -31,7 +31,7 @@ LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
 endif
 
 HOST_LIBNETCONF2_CONF_OPTS = \
-	-DENABLE_BUILD_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
 	-DENABLE_SSH=OFF \
 	-DENABLE_TLS=OFF
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
