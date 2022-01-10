Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FE7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 17:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ACA3408C9;
	Mon, 10 Jan 2022 17:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaWlBm8zOgMK; Mon, 10 Jan 2022 17:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B98E8408BB;
	Mon, 10 Jan 2022 17:45:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E49F1BF355
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A2A38269C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 17:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUw4hjh3obgW for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 17:45:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45CA982640
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 17:45:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k30so10662347wrd.9
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nGUzC421Z7a3AL+Snxt18lkBsUMZSNoyx8Bpaepzgm4=;
 b=e2i27aknlwUmMq/8ClAKSwGC425CHC6IWCFPPGA82pD67HPIlkRz+43Bc52CTBzZ05
 jB6qlKjkrFlOgmQ/H9ooB11ummOUiCbutFU4ZA8xKZo0xw0bhGnLgL/canbXZY3ZYCnG
 vLk/PM9se/Br+T5QGINlRQ6czSTbDEG5idLD8G9xvImAIGeRhWHfQugv6mL2D3RVQ3Xd
 rWAxGWNZdiQTbEXO9pRLE4YX8OPb7e1UeSdLkDcRU/k116P7cNyRGRl3WkjPa0EWFe6k
 uDrTFQARZ/sdlU9swJbmIvFcBbYwiaQMDyMDrt+Wk46Af0E7WX3iYzYprYSw85nEdOzM
 wBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nGUzC421Z7a3AL+Snxt18lkBsUMZSNoyx8Bpaepzgm4=;
 b=qoU2ndk0J2uCLAn7I5jScWWJj4nxnfLqhzItJUKh3EPnM3Nk9Gp0EZsAhgnBejSGLm
 PdbiPLaryf96fZ1aFkO0PsVtpu0ujQPPNgNqSm+xFQ5Sw/CRbDdk2+LrDIKKVTfHHFY6
 qFjeAuu3XrMZc82HsHb3Xyz0Ehb+EtNeU2gpBnY09lpE+dXhojnZurE+oGIc+j184Pym
 S3+I17nLOnF1dO3bXdRBccukW40olkOWzQ6w8U071gfrwwcqM6LdJeX20dNGAO2u8Vtz
 xouJ+BIAsbvj6jErDxP9m2DJIePnciTqoywFYYemMZwnalqNSjdPv3VjTOIDPIp1AmC0
 LGrQ==
X-Gm-Message-State: AOAM532ffVW3pTcZyHTK9ifTyRuPH5gG3KFTGhPKXVuCWljhKvp7bY/L
 QJ/AJ8V7yoaFj347L1MGWgZWrzjPJy4=
X-Google-Smtp-Source: ABdhPJyescvxgvKbvPCCZvaXX8dT/mVuqI+pJl20yE4BBZYATM2mToRq0IYjeGJ5rwWrmlrbvyvg8w==
X-Received: by 2002:a5d:6d50:: with SMTP id k16mr548006wri.693.1641836722427; 
 Mon, 10 Jan 2022 09:45:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z7sm4570684wrm.117.2022.01.10.09.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:45:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 18:44:11 +0100
Message-Id: <20220110174411.1761440-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: fix build with gcc 4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 2.28.0 in commit 0f8aab08e762742d753d5920718f31c629d0f8d7:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c: In function 'mpi_select':
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c:1994:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for( size_t i = 0; i < T_size; i++ )
     ^
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c:1994:5: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes:
 - http://autobuild.buildroot.org/results/56ac0a8726d09eed8f45f865934fa7781a0e667a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 5facb99b2a..8745ff33f4 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -7,6 +7,7 @@
 MBEDTLS_VERSION = 2.28.0
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
 	-DENABLE_TESTING=OFF \
 	-DMBEDTLS_FATAL_WARNINGS=OFF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
