Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECADC43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 07:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F58740A93;
	Wed, 15 Jun 2022 07:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NdhOa8BQxCD; Wed, 15 Jun 2022 07:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25FDD40347;
	Wed, 15 Jun 2022 07:37:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 299981BF5A9
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17D9E418EE
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPxKAEjrcamH for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 07:36:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26C7C418F7
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 07:36:58 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se28.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o1Na6-000IAD-KK; Wed, 15 Jun 2022 02:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZYxZrF+n9Cc54WiopF+4zpKAJWKJl53/g5V9pXlpFL8=; b=f5sTkwF+Z1JjmovM/muzv4QTyB
 08SJTAjRhC4rnVAKtYt3V6/Frlxa2rU8oruOG5Pt1hxJPklXf4Ggi2os1y9d6ROJ2tPsd6KH35QHd
 k1SZiNKQ7YCSrcYV4kIt2Xp2iW/AIE4mtcuY9CE8o5p8xE4iEC6V/M5i6qjc7YH2rbH3gUkyN6NLk
 GGkT7oNKrw/fuXMd9rvLlsrkWj3brWqRkfJ9QcuxeMiPPWkJs7EKv2MA/Q25DBA2kU854k8U5+/PW
 aroqiUwBjeoJ9w/TI2CJILBWEHsqgVeADJu6FWHBv0eaEJ88gdr+kBqN03KsMPvx3g7N/3v75Rdo8
 hayQQ7Qw==;
Received: from [95.111.54.43] (port=41464 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o1Na3-000HAf-SB; Wed, 15 Jun 2022 07:36:47 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 10:36:43 +0300
Message-Id: <20220615073643.41013-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220615073053.40347-1-dimi@tpm.dev>
References: <20220615073053.40347-1-dimi@tpm.dev>
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/ERJOL3d4pEo/BZcy+9mDKPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAd3PpjrfnLvLyzzwNFf10/KjAYDVlct9sYLZH
 EViT9syrox0Z6tYUrMo6+3sjbLOJWmuNA8WTybi1JN85FSnfKeArhF8DDAnLuef2eQjE15wBe/9T
 PWtESFxgCC6xwnwZq1NxFr5xr62BOHHDiiwozOZnKAyX/dmWSKKAkZMD69QuVF7xNnooC0I9FREg
 ONlGYx3aPgw+VqqMKwjqRu7K//WEQZ1uDRaTscddvLdr0QzPDWNoiICP4PAhem3nWa0O5HHYEJjr
 oOvfkvm+jbvsKm0ZrDIs0EW+Xpt9Af1LEBDhCcHQv+Vda3nPaVK0EfymGFvlHOQsi9fJrQH2HB7K
 cikRseCyBjclZpv6D8yHWO2ec6cBx3r3HXymDSnwWpGuuZvJzloHvXAavZZu2bOHz0lNEHF1LSWF
 /K4qKVXG9aOiuE2WsMQKCIxVc/Bl0gEhwVT9QLcFEqMOHs14qjRwSf50uDIqf2FGuXt/l8wgSCTl
 gTl6fJxyntEfhZCKje4ZxFsEtcI97jKG1Za36v45kS7/+fOTvqVqTiiM4NskccTteUmL4DvFRPqm
 f+YW413FfGpYrEmIO9Je9m9d+jZQRhH0bwch8ObQw9ZPNCJxML0amUdylUIKhf3z2GAHxH7IBbK/
 eM19BnY8mlAFVuN6syPO+vLG0PND6LlvhWPPIrQbcRh1LurAiHez9GwxUFZRWg6oRp35gg3qDJwP
 8wHKkjLBoFfyud/FVRu0TQWChfHkO4nQueuBz0AYsNXQnmLXHd+BAOzpe0YNJX8u15qwPYMB2RLO
 KZul3x62AerXkYXf+uxvy1lCBH8fC2Ac8ytg6S5fRubGYS0excxZoCNdfeIqegK2OkF/wA753L5v
 yVBWA1x2Xzfp8DgZuSYXuo1DhtJKxcjZcXlumi9j4Q83tX9YK233ILvfWCCyoRJ2OsZ+pvlHhV6a
 5QjptwQBGybQs/UIhpzDzPyd6gBEWyWvSiug7dgyzdfCR6mf5/MQtWtnQ/KlZv3ZxKWOL6n+dyEJ
 Z66lhh3M+bth9ENpQs5TaWOv9Ee7NkW4waBhhZVuD2IUhUJeLVVmBuwbgu+woevdQiTPXbfr/wQl
 6qdG9GOfMQ==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] [PATCH v2 1/1] package/wolftpm: Add TPM 2.0 extra
 options and fix one bad typo
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dimitar Tomov <dimi@tpm.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/wolftpm/Config.in  | 12 ++++++++++++
 package/wolftpm/wolftpm.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0b964c3d7e..3027b7e33d 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -23,6 +23,18 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
 	  encryption. Disabling this option is not recommended as it
 	  could create a security breach in most environments.
 
+config BR2_PACKAGE_WOLFTPM_ST33
+	bool "st33"
+	default n
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the STMicroelectronics ST33 chip.
+
+config BR2_PACKAGE_WOLFTPM_NUVOTON
+	bool "npct750"
+	default n
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the Nuvoton NPCT750 chip.
+
 comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index a4a9edce85..d0423cd06b 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -35,4 +35,16 @@ else
 WOLFTPM_CONF_OPTS += --disable-wolfcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_ST33),y)
+WOLFTPM_CONF_OPTS += --enable-st33
+else
+WOLFTPM_CONF_OPTS += --disable-st33
+endif
+
+ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
+WOLFTPM_CONF_OPTS += --enable-nuvoton
+else
+WOLFTPM_CONF_OPTS += --disable-nuvoton
+endif
+
 $(eval $(autotools-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
