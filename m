Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A862AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 01:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A7F416D9;
	Tue,  3 May 2022 01:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXqd9DzxZc2s; Tue,  3 May 2022 01:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 936D9408BA;
	Tue,  3 May 2022 01:18:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4EDA1BF297
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 01:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1CCE408C7
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 01:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0k0XDQtTMedS for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 01:17:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C2D4408BA
 for <buildroot@buildroot.org>; Tue,  3 May 2022 01:17:58 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id b5so8913220ile.0
 for <buildroot@buildroot.org>; Mon, 02 May 2022 18:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6m6sqo5+qOKFDtlJOHuCZQmmu3fH8WLV+KUoZl6aDmc=;
 b=a4a0jDfSg/2zdraVwlyp3JA4P9BsGQvbHOHdeleZB4EIssMDtgdClqcpbsdSOu4llS
 FWfm4o1lBE/VxFW5Al9wePyS8B5QJWM22733xtFxO3jA4L/uXPgyd1UAJsfTFHbxAd1T
 7Mn7OcElVymI7F/cLtMen23afNFEWRiPog+529TdI1PWL6AIGlcVDl9qdjFmZE096Ml3
 TFbQlUqHVTf4n/NWzN9WVfNVYduKxnLNtQIWEyxloj1BSjho3DrL2MPaVnMqK1VaQQz4
 n6EbZvKFb1vgEo9Rfzhcoi9E9kyAhbhx6z0RSft2xBpCikcpycfvVltxhXeyGNTwCZrF
 hD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6m6sqo5+qOKFDtlJOHuCZQmmu3fH8WLV+KUoZl6aDmc=;
 b=ccL7vsmjhIbMG9WeteNEnYD5+gqTwcOEtdI9kp7Tpz9ta6dnEgwuWTdvI6NLIZqp40
 sWzw9mUFU5VaB7l5JzZslcwTScknhCAK/1USl1ulKqi4KoWSKfVfTwQOi0oxUxSbqK6n
 TdMbgpk3++Pc4gRnQtPiS/cEdhBykZLaGymvAz95XxBKFrz63nXRBks5DeKIfvWRxf/+
 HEGLoPNtA5Db7zgCINnfbr7GoyBtQl+j+PvfgacGyh97ODX8NGL8Rn1vLhBt2rgdnc7Q
 +sdWRCnCpliiMYqnEWLVFwgfU+J/m4E/wB64swEsGCuL45AEF+Ly6Kieriu+ibypWS0P
 s7ig==
X-Gm-Message-State: AOAM530qr4sJoqRhCjb3LdLo2N1UNnKgA3BL2b9lkPXGxgRqBgc+Kydr
 V2kOozi9EywPlRBwdA/tnriyutC7Xts=
X-Google-Smtp-Source: ABdhPJygD88GiDwIT31nxUuu5SbM3NMvQmB99a1ErcwCRFLwnSLZlJsvgC+W1Cpi00mbEAYae3oDJA==
X-Received: by 2002:a92:6e0b:0:b0:2c9:a276:58cc with SMTP id
 j11-20020a926e0b000000b002c9a27658ccmr5752491ilc.199.1651540677196; 
 Mon, 02 May 2022 18:17:57 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 18-20020a056e0211b200b002cde6e352d3sm3053303ilj.29.2022.05.02.18.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 18:17:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 19:17:54 -0600
Message-Id: <20220503011754.2730166-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luajit: depend on !BR2_PACKAGE_LUA
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We can't enable lua and luajit at the same time as they both provide
the virtual luainterpreter package.

Fixes:
package/luajit/luajit.mk:80: *** Configuration error: both "luajit" and "lua" are selected as providers for virtual package "luainterpreter". Only one provider can be selected at a time. Please fix your configuration.  Stop.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/luajit/Config.in | 2 ++
 package/snort3/Config.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 3111a2548f..f27099e80c 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
 	depends on !BR2_STATIC_LIBS # dlopen
+	# Luajit conflicts with the regular lua package
+	depends on !BR2_PACKAGE_LUA
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index dcc29b820a..9b96e7cb58 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SNORT3
 	bool "snort3"
+	depends on !BR2_PACKAGE_LUA # luajit
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
 	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
 	depends on BR2_USE_MMU # fork()
@@ -34,6 +35,7 @@ config BR2_PACKAGE_SNORT3
 	  https://www.snort.org/snort3
 
 comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
+	depends on !BR2_PACKAGE_LUA
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
 	depends on BR2_USE_MMU
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
