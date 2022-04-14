Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15255C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB58260FCF;
	Thu, 14 Apr 2022 20:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iajzfwvYSFkn; Thu, 14 Apr 2022 20:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB6260FBB;
	Thu, 14 Apr 2022 20:39:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFE8C1BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC10841930
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxwVqu729iPr for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:39:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C663D41920
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:39:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id p18so7624747wru.5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pa7ErzfOhNzAOczKb1+vFLghv1FVfD0mrJ1+mRY+Fts=;
 b=MRqWVtdwFwzmVPK/KJr03OabGuL7p46gd2YlXzzFHLDiVUkwIKnM6tRXPBVrNN4tNN
 NQF+jbneGP/jq2RVGaInugxqzyVzAaBT3n/Ro6XULo6CFfKD4iuN7Heblev1bt7/QUUM
 s2Ygd25ofCSQ+70+MkLUyQgSlfy0s5BLdVwBhSHQLvqUpL+wzatIMJMnRDXRcVeFFIwD
 lfR3rqMtYNF95FUtr38Azu5L4mcdbfR0jHwrL+LtQ2cuV2r45/Jd+XH/0aiwNbPUx6OW
 vbGPUG2SpB/NGK13FzcSaaM3pYPG+jPHl4RdQAhgPpBm0TrXwk2A5MYWRBnYRxWfsfty
 fPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pa7ErzfOhNzAOczKb1+vFLghv1FVfD0mrJ1+mRY+Fts=;
 b=xszAzkwrXtAeYW+dWI0REkH3uCTuEmOPQtbnLLIzpJRwx4wFfnA94xjqXqY/P4cQ87
 8PTuyMQkdZMT7uQLO3wISOZMGndH29hoTXiLwvfC6VY3AYXQVVuWyBgCLdlAOvRB+aBL
 p2xAiBnDyDUePorFGyXSrbYYRdHRN0dQUtlozCRDCy20pHUKIKUx3dWqKgF6SaylYEAy
 EQGpRFUEVm6SHgiKU2dvBGHyNoasXpYy6OTd5UoCdNvI+vpuWBYctrTSDg4SN6N0y0SQ
 ZU5QsfPy/QLLx5VmdM9evvuu5/GHjJ5VCqqP31IWzc7Qcs1TkjQJrpjyu+j9PtXJlD0h
 pNlQ==
X-Gm-Message-State: AOAM532lWrbussGYXlheolY4MK0XP/FS2Bg7zDIEC7m5r/1yips9Bwxm
 1JSCWcCAY2wpsoIRNLhy8bov0/nifqY=
X-Google-Smtp-Source: ABdhPJxTQSm8lIRiujV4hgE5PesYeZar7Pa+YZBbfVeWK6Y0SRiAm6n9srUte0xGJ/FXg7zmF7OrQQ==
X-Received: by 2002:a5d:4d82:0:b0:207:a0da:8f06 with SMTP id
 b2-20020a5d4d82000000b00207a0da8f06mr3302830wru.680.1649968775687; 
 Thu, 14 Apr 2022 13:39:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm3233410wmq.9.2022.04.14.13.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 13:39:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:37:44 +0200
Message-Id: <20220414203744.1819362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: doesn't build with
 libressl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pure-ftpd doesn't build with libressl 3.4.3 which doesn't include
https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8eb2ee2ba8
resulting in the following build failure:

tls.c: In function 'tls_init_options':
tls.c:329:5: warning: implicit declaration of function 'SSL_CTX_set_num_tickets'; did you mean 'SSL_CTX_set_options'? [-Wimplicit-function-declaration]
     SSL_CTX_set_num_tickets(tls_ctx, 0);
     ^~~~~~~~~~~~~~~~~~~~~~~
     SSL_CTX_set_options

Fixes:
 - http://autobuild.buildroot.org/results/f5d36180949278510199aa499e253780558c6ffe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pure-ftpd/pure-ftpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index f3cbef84b9..0354949e28 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -45,7 +45,7 @@ else
 PURE_FTPD_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
 PURE_FTPD_DEPENDENCIES += host-pkgconf openssl
 PURE_FTPD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
