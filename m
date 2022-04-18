Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E518AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 11:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B38F61229;
	Mon, 18 Apr 2022 11:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4It7JQU5C-6; Mon, 18 Apr 2022 11:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 855EE61232;
	Mon, 18 Apr 2022 11:43:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DF991BF38B
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 11:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE70A41DDF
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 11:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wmzvIVKtY5X for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 11:43:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C950D41DD3
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 11:43:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id y21so7105524wmi.2
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 04:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HxaT5XF1GzUN6BgNystkLFRoLbYP9o2lvRKGM6dLzus=;
 b=pHVxYewwHYsIl84utRWTRRpLd3E1CWauYmsrrWinvf3UnMJGnzGfvuhAAlV25DB+qI
 6yN1flfhREODjgVAabkOhd7JRBEiP8U59hF45Pbf9BlhMuIESoPeH5+0hEoac9DH+LUH
 9ix5LnmTNFQQIVX609QAOEAAAAZgSWkWCW9k0/fbvlJJVMyJ4hEdOlJGep50z9YgWo6u
 6vK1QfgnjLcIJunkOD8sG5cT+l5km3UN15uc1GxgFhpc4s/TF31r66qiHDN0Skym4fCA
 M4CQ34yZVnpA1F+vAsSx8bCx0t9Iq9Q7UuxJa4f7iIGroixbT4NJNyXRSlvX8BK6tiXQ
 CLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HxaT5XF1GzUN6BgNystkLFRoLbYP9o2lvRKGM6dLzus=;
 b=PrHckDg/Y0hW+KiOjQDP/Vuyfdn6mruRIKCwdMka2IRDmpCjLKQUSvgz0iNgo2prkU
 tqA9qkNUeUCiqDj+VZovA7d3YkiiD5NBAIlUgp4WB+AwC3nfXJI93IdWpjVoD/hVfo2V
 /h6CSLjkpNBQpFL1W5R1XzQQKwBd7cwCoNgU2fJ0nB9214R2IVuoGuDxOhrZiNEnPB0K
 PO0uDpyjP2puePTy61LawZxHBDheSed8TC2fGIYJ/+GL4OCHv7RqFABFElDH/ci+puHB
 wUnDHvpBX56t8qKYpwKIr6XuUEKKP8/wJdlYdfEPTNMwsxIfloXqfPdRsXbbjFiDx2Nu
 fw9A==
X-Gm-Message-State: AOAM530ZfTpInhgCMqTswLePBZzyvFtKmUohxVFWgvoN4748RkNMO7Ac
 1Iydb0bgr9VZmRuoUImhwhqVmRNy6GU=
X-Google-Smtp-Source: ABdhPJxN5Sq7GEl1pBf4kI2VH6ogI+czpuaNlLtqSjmQg6AW0N+ZIxoQrzLgA/FqJv9vkcvTYfKhug==
X-Received: by 2002:a05:600c:6004:b0:38e:ff13:4220 with SMTP id
 az4-20020a05600c600400b0038eff134220mr15014889wmb.141.1650282178474; 
 Mon, 18 Apr 2022 04:42:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm12171135wri.0.2022.04.18.04.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 04:42:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 13:41:03 +0200
Message-Id: <20220418114103.276282-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: doesn't build with libressl
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libkrb5 does not build with libressl since commit
b7a5b9d06d484700fc4fcbd354f2c15e0422688c and upstream is not interested
in fixing this issue as a PR is opened for more than 4 years
(https://github.com/krb5/krb5/pull/607):

pkinit_crypto_openssl.c: In function 'cms_signeddata_verify':
pkinit_crypto_openssl.c:1700:22: error: implicit declaration of function 'OBJ_get0_data'; did you mean 'BIO_get_data'? [-Werror=implicit-function-declaration]
 1700 |         print_buffer(OBJ_get0_data(etype), OBJ_length(etype));
      |                      ^~~~~~~~~~~~~
      |                      BIO_get_data

Fixes:
 - http://autobuild.buildroot.org/results/e623f4e1d6b6004e98815b8b7da3938238890bd8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index f406cd9e49..bd751d9c77 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -49,7 +49,7 @@ else
 LIBKRB5_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBKRB5_CONF_OPTS += \
 	--enable-pkinit \
 	--with-crypto-impl=openssl \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
