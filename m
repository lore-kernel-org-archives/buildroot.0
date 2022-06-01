Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A87C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 20:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EFAA41865;
	Wed,  1 Jun 2022 20:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bf4fi9NYdbBs; Wed,  1 Jun 2022 20:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E96734184E;
	Wed,  1 Jun 2022 20:33:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C78051BF2C7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5C084184E
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9MM-BcXnCr5 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 20:33:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ED3841842
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 20:33:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s24so3841988wrb.10
 for <buildroot@buildroot.org>; Wed, 01 Jun 2022 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yhsCwpRqzOzp61YHY6qu5Xui3zC7iREAXthp8yp1p6c=;
 b=AeSYnLAFWI+M+jiUb+w15JUoCWLtldIsIA9bDFnx6iS50J9QHOtMXO+ZfGfu0hyLZk
 pcJm2pgncyi1jg/095KjA0Y4WMt3GB2/uJsIiJSxlExF4ISU6TAlUImZiuN8tYtBrL9o
 vbKtDA3xQzYgN2tdEscO2hyNTs9Dw+OKl2HI8OeFqkxeaXPES7ZfdL1wWuT4zWj+6M5C
 ozwbrH+tzjQiTd1z1Kn/6JIvRNBDXtdeMHZl/LslK8J3VoAWMWfJCZ98h9ELGuYBW8dd
 szZEbJCoYw8YmcGoXtLPcs5kzIxJCrePGhMuC9blLn9EEtWE6DQV6ubrXnCUDcjScOlr
 1BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yhsCwpRqzOzp61YHY6qu5Xui3zC7iREAXthp8yp1p6c=;
 b=NTQEAMV4EWXVHZX/0Rja4WC038ele/QrxR+J662UuRKUMgF+CpVx1XBpsigW2ApURS
 lQiFmk+3P6khfo2CmL/5ijEzKCbR7Y0d5F+gaAN3jaU95HCI/LQHml0YoSgXSFFYmkFs
 KJZqLPTWI+W1HgfOXvGB0fGu6IrYXrgBk3IZCAt+WS3e7V+56u2MhmicrPOfGVp7D8Wp
 IZx/4j6rTFC5YqS20/zduqHn7pviRKYxZbKabg9lqi5qAF1NSc5tfa9dFWGetcmUjo5f
 qogz0ZSodsHgwX3XGvgl1/4zdRVMYemyltt/Qxj+6nq3sL6RH+W7/XI9MHlv3fqM+Dii
 m3Iw==
X-Gm-Message-State: AOAM532HecxAhYlnAFrpVkGRl8x9nvAuRXjkaKrtW2sIvNWO8nlU6QKH
 xOkPz9Phq5R4WIkGTddmVhaRVEBACT0=
X-Google-Smtp-Source: ABdhPJyHVikL+gxUSDJPuZdQUQbAUzb7pajLlAacAKArB/bqnm6H9Z+anwLWrszRHl4RNSoNFHOtjw==
X-Received: by 2002:adf:f3ce:0:b0:211:55a:a604 with SMTP id
 g14-20020adff3ce000000b00211055aa604mr934531wrp.213.1654115619394; 
 Wed, 01 Jun 2022 13:33:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a5d4704000000b0020c5253d907sm2347275wrq.83.2022.06.01.13.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 13:33:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Jun 2022 22:31:06 +0200
Message-Id: <20220601203106.3436511-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netdata: disable cloud
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

Disable cloud to avoid the following build failures raised since bump to
version 1.33.1 in commit 73dc2eef2dc40b78e732872b26eee0bcea1087d1 and
https://github.com/netdata/netdata/commit/e7e5d0c37242d8457e4b2610a95effe0db5ca1b1:

In file included from aclk/aclk.c:7:
aclk/aclk_otp.h:11:23: error: unknown type name 'RSA'
   11 | int aclk_get_mqtt_otp(RSA *p_key, char **mqtt_id, char **mqtt_usr, char **mqtt_pass, url_t *target);
      |                       ^~~
aclk/aclk.c:48:8: error: unknown type name 'RSA'
   48 | static RSA *aclk_private_key = NULL;
      |        ^~~
aclk/aclk.c: In function 'load_private_key':
aclk/aclk.c:52:9: warning: implicit declaration of function 'RSA_free' [-Wimplicit-function-declaration]
   52 |         RSA_free(aclk_private_key);
      |         ^~~~~~~~
aclk/aclk.c:65:5: error: unknown type name 'BIO'; did you mean 'EIO'?
   65 |     BIO *key_bio = BIO_new_mem_buf(private_key, -1);
      |     ^~~
      |     EIO

[...]

In file included from database/sqlite/../../aclk/aclk.h:6:0,
                 from database/sqlite/sqlite_aclk.c:10:
database/sqlite/../../aclk/aclk_util.h:6:29: fatal error: mqtt_wss_client.h: No such file or directory
compilation terminated.

Fixes:
 - http://autobuild.buildroot.org/results/6c87c0d1699fd518a989cb81a191419f427accc5
 - http://autobuild.buildroot.org/results/aa77c027316b45e812eaf9ced61fb8e967bb987f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netdata/netdata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index dade6c625b..c0ce74d18b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -12,6 +12,7 @@ NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
 NETDATA_CPE_ID_VENDOR = netdata
 NETDATA_CONF_OPTS = \
+	--disable-cloud \
 	--disable-dbengine \
 	--disable-ebpf \
 	--disable-ml \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
