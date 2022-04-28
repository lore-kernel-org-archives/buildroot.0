Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 16:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A6B66101C;
	Thu, 28 Apr 2022 16:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vz7Q5KlzjoFB; Thu, 28 Apr 2022 16:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 681BE610B8;
	Thu, 28 Apr 2022 16:27:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 895991BF424
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 16:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8626960B04
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 16:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ANJeyp_ar68 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 16:27:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B887960ACD
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 16:27:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w4so7448866wrg.12
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K3GV2Z0alQqcWeoEIFlk9mQeUZ/3YLaiUFndoAfsM0w=;
 b=W66JD5eXXfpBPYg8k5BTSZmAWkzkyvCBkvQTFqGmhp1PZDMeWBv9S551OE69QKQi6S
 /G1mklnFpHzxBtBmXC3d24u3Kd2chP+qdlNADxQIN2TCUJcr4pqzv5Ln6Je31f0Iu+hA
 P6Td81KxNkSljvdQ33p4a+aBaXTTMAmqfPpys3+yciClHen4daWw6tttPhx4kDf9488o
 +25s3hPWR1HhyFYhDB/45jp/5O4e+o2c9z5LvKTLDAARot7HdkVyNREa7dY27gOcm9g4
 iGbix93zCh+kd8jahhI3HPvV2OGlh7jJUgQP5y3SaEXQX33fNTN2E2liwKCOCknkbXh7
 pkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=K3GV2Z0alQqcWeoEIFlk9mQeUZ/3YLaiUFndoAfsM0w=;
 b=ssJfNBvrDyXzKoPCJgAIRZmw1IgfiZEJL9ImRv9L6FYjUAQOqQIdFud+om3uTjc4qZ
 kvNxaoV6Ady4yGwAPErRa1F2EmVfjC4VqVXGVjrH92XiY9Xm2gCavCrJHdptM3/fXPRd
 RQp1M1c/QyYtqqeHdlYZdzXrDdEPFybKvPyYf3cj91BPSdwmRMZ4IJrLnjz1zz/VpFmO
 wbBPlntBev5an2vWajzuaDM77GPLp1sIoIiuY7Cx8p+0FTBFJXdHtOm+Sy65mPRXfEXQ
 G9Dihv6lXsQFUYqo9/efUwJ3eX4V93NEpr/cjKhRIvBGQzN+SsTF6ejoBANIWByG18pI
 mpBA==
X-Gm-Message-State: AOAM533G+dusMiRSHFVBL5jjgSn0ThupcJeUZ1CEFMWXmwnwOTWWkL4f
 BOKiYXOu2MX2fXLU2sG1Up6qz0F1jlU=
X-Google-Smtp-Source: ABdhPJwtoKAgdDc00+yZ35AddeLuoGaB5PgCn+0Z/siCikuX5TAiwhwMER8dz5BxrgE5aWFm6Qxejw==
X-Received: by 2002:a05:6000:1786:b0:20c:4447:3462 with SMTP id
 e6-20020a056000178600b0020c44473462mr656575wrg.601.1651163262897; 
 Thu, 28 Apr 2022 09:27:42 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:8d9a:c8d:7cf:ba48])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1c2506000000b0038e6fe8e8d8sm422402wml.5.2022.04.28.09.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 09:27:42 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 18:27:38 +0200
Message-Id: <20220428162738.1243794-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dhcp: add explicit option disabling
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
Cc: Andreas Ehmanns <universeiii@gmx.de>, Jan Havran <havran.jan@email.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commits 4db37c663cc0 (dhcp: add config option for delayed-ack feature
of dhcp server) and 40f7adae3c03 (package/dhcp: add security options to
DHCP server) forgot to explicit disable the option when not requested.

Fix that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Andreas Ehmanns <universeiii@gmx.de>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Cc: Jan Havran <havran.jan@email.cz>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
---
 package/dhcp/dhcp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index b73137506d..cbc95cb152 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -76,10 +76,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
+else
+DHCP_CONF_OPTS += --disable-delayed-ack
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA),y)
 DHCP_CONF_OPTS += --enable-paranoia
+else
+DHCP_CONF_OPTS += --disable-paranoia
 endif
 
 define DHCP_INSTALL_LIBS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
