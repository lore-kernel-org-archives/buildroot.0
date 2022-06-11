Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBD9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 15:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD271843D1;
	Sat, 11 Jun 2022 15:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnYl2AkyM5xz; Sat, 11 Jun 2022 15:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A9F84391;
	Sat, 11 Jun 2022 15:00:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A2001BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 15:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36F0A60B1E
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 15:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhZcQH694rHq for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 15:00:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4335460AB0
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 15:00:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so2430467wms.5
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUJLsioBM9FsrSW9G7Du8VKpUzB1CkG1XOPQ0oUoUcY=;
 b=qDo2ZQFHNoO/7ImWwiUgEOet+gy3GpD+kFT6HuOMdIvVp5i6hSSrKjyK2KN8Vdz/I+
 oKskBab1uRh1z7xn2UPtnH9k2AiViAMlSRLDtyYrzqKYsvriz40aTrDxHUYNciFqIIPo
 FmOZmXdErZoB0EY4j2/yIB64AOeZtqL0vWYtp/GC2CwXyTFvAV0npO90e/l/sUewsbEz
 SE9rAIw9NglTnDzUe1EQqcCQjxsmOTDkk2YvprOX+6RuSkY7mnWV2vuswu7WzZlfP3y+
 x0EeRqwIOFqfRZ73ghGX+rFXp5W9VoNuek5BhWDbSUzcLDTTLHVu4hWjxmzh1UALRrTV
 ahmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUJLsioBM9FsrSW9G7Du8VKpUzB1CkG1XOPQ0oUoUcY=;
 b=5y+bMJWlruP1K83innZzCD0t8U+CxIXpihaiiUp6wNfHDc0c9FNBPzQZ9MseT0hcgd
 4hPk8HvqelcQbPFj2isvzqPe9kV17ByHwet9mwgjuy35XqE5mxI+fymyD688wUZTVPW9
 HOlTqLgbrXF9Fm3PeY+1uWsW7lFI042XehzuiQt6fHOORSg3kdbD3XxbkJjIaz30E6xz
 j7aHWHJSKHZONW1VgZHW0QBTlaWwleLDGIkuRffpjgaeSFtEFZBhjH60Xq39nVO3QRPc
 S2Jr30uVZuQsuDpcLIYemxlqufYzmMHF3PiDRByDOZ8KWRySmkTKosRGexXPZI4QRlqH
 DyFQ==
X-Gm-Message-State: AOAM532E/WKWXLwdwT2bdB7XkJkiODD303PtZkXfRqxQhMm3KvxwegCS
 b9EXHqlwiY8IztM4tAeEAVgHlOoxLLo=
X-Google-Smtp-Source: ABdhPJyPR0HlD81n6j6bxNv27hqhv3aeOOczL9k8S47CDFgWB5MF26+PYRadsF4/eNv95hvr8mR6Pg==
X-Received: by 2002:a7b:c3cd:0:b0:39c:474b:2056 with SMTP id
 t13-20020a7bc3cd000000b0039c474b2056mr5143174wmj.30.1654959598917; 
 Sat, 11 Jun 2022 07:59:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6503000000b002103136623esm2762442wru.85.2022.06.11.07.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 07:59:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 16:57:15 +0200
Message-Id: <20220611145715.879538-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: doesn't build with
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libnetconf2 doesn't build with libressl which doesn't provide
X509_STORE_CTX_get1_certs resulting in the following build failure with
netopeer2:

[100%] Linking C executable netopeer2-server
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-gnu/11.2.0/../../../../microblaze-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/lib/libnetconf2.so: undefined reference to `X509_STORE_CTX_get1_certs'

Fixes:
 - http://autobuild.buildroot.org/results/7f9a114a477e859dfbc62a53ab66c58eddb2318b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnetconf2/libnetconf2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 11a1995ea1..00d2c08f63 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -23,7 +23,7 @@ else
 LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL), y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
 LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
 LIBNETCONF2_DEPENDENCIES += openssl
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
