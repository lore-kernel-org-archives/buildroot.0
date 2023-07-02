Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C70EEB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 20:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C482F408EC;
	Sun,  2 Jul 2023 20:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C482F408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tA_NV-NBoNvK; Sun,  2 Jul 2023 20:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28EC640B16;
	Sun,  2 Jul 2023 20:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28EC640B16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C89C1BF263
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5577A81EB1
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 20:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5577A81EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CM13dZY6oYBj for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 20:17:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A88681EA3
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A88681EA3
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 20:17:52 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-579d5d89b41so20208677b3.2
 for <buildroot@buildroot.org>; Sun, 02 Jul 2023 13:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688329071; x=1690921071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JoZFZh/Bc4U3Qiv7dtP841yLSG2AGa/vMVEBBjG19b8=;
 b=O2YgNW+ExyNglxEYabYXAjgtJTxotSHBdo7OPpJVeIrJmXqdetjdMSq/Mn1OmrphC/
 vxZ+raSwQpV3RFi+I0fAJOVRAANAiHs10NRLn4d6B2NUOgtFZ8abzBGL+cU6XBDAtXLM
 Yb1UjGFavfxEjyK2nVHmYfbLxjph88UzA1xxfR+YEM5ImzU7YmletjKiWN6ye2nYZGbK
 qrTz+/GmmnjuEjQM1bhZB0wcfFyH477GaI3U9tzpj7qovPwc4TRoiVLwV49Dx8HqvIS9
 Yn/Q4Vu6+og7FRnOegmrdLH/zFXJd98Y7/HnI3BdrLXzZm40KUdNY8M0/8KgcJLqbhDI
 XYQQ==
X-Gm-Message-State: ABy/qLb5Ov+qif9aOUSM5hNoCMob5rUJJec7ksxbQkSebl2OgQxHlMQO
 b5mJfF65eAQdo+znpCgA+w8zoP5lZ/k=
X-Google-Smtp-Source: APBJJlFjwR7Bn3wHsQiWaAHOdH4RdGynEGEthpXpQB9meOBseWzddxsPhT9TKQeqaMvI8UbOVZSbYQ==
X-Received: by 2002:a0d:cb86:0:b0:562:1060:f2c9 with SMTP id
 n128-20020a0dcb86000000b005621060f2c9mr7899295ywd.13.1688329070948; 
 Sun, 02 Jul 2023 13:17:50 -0700 (PDT)
Received: from purgatory.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 a124-20020a0df182000000b0057069c60799sm4706158ywf.53.2023.07.02.13.17.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 02 Jul 2023 13:17:50 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 13:17:36 -0700
Message-Id: <20230702201736.72396-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230620173813.4590-2-ckhardin@gmail.com>
References: <20230620173813.4590-2-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688329071; x=1690921071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoZFZh/Bc4U3Qiv7dtP841yLSG2AGa/vMVEBBjG19b8=;
 b=cyt0eNeyRu0ZSh0G7ljO1qfCLSiUW4jR3Fej/NFYAqn89gNq0OfK/K8pCuHFKAkEUj
 inRjvgRj3e2ZS37eHicurxOcQRjmaoHpHuuNDU1Eu7P9eRQWEDExG7cvgNYVSqDYaumr
 qR9FhtiLVmu38Lv81qm6gqQkdVbRJrjkjvp049y6AeVQkl1Q7vbUonAjMHu5C5Bk2YYP
 2kaUgXKhlIATrBLUnEXstayK4wqPVk07seQevPzBn0Epw9T8Aw8jSUetHQnNIqPgS6EN
 fZ4oumBzDCnAiSSykC0uXrNIkRbfmHZKYdELhcR8irAnIF8Vcg3DJ6PIV6/njasCv7M1
 VFsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cyt0eNey
Subject: [Buildroot] [PATCH v2 1/1] package/bluez-alsa: allow a samplerate
 conversion for audio playback
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the case of the bluetooth audio then incoming stream will be coming
from bluetooth devices at varying sample rates like (44.1, 48, 96, 192 kHz)
and the odds of a sound device matching that samplerate exactly
is a bit slim. So in the case of a bluez audio playback the system will
need to do a samplerate conversion.

Thus when enabling bluez-alsa and the alsa plugins select libsamplerate
to support the shift from the incoming samplerates to an often fix-rated
audio device.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
Changes v1 -> v2:
  - moved the samplerate selection to bluez-alsa

 package/bluez-alsa/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index 73ae3d5333..748c4b8820 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_BLUEZ_ALSA
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_SBC
+	select BR2_PACKAGE_LIBSAMPLERATE if BR2_PACKAGE_ALSA_PLUGINS
 	help
 	  Bluetooth Audio ALSA Backend.
 
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
