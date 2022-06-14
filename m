Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE03C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 21:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03E2B40B83;
	Tue, 14 Jun 2022 21:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6A5Tb4fIbWHE; Tue, 14 Jun 2022 21:28:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F6F540B27;
	Tue, 14 Jun 2022 21:28:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7A001BF2C4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5A3860FAF
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 21:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUwsSs6kF0Qp for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 21:27:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3733F60F86
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 21:27:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c21so12909985wrb.1
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 14:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asXWAqLgQh8s+3xsYeRk/Ugva04OhPHXs0YtW93L/bE=;
 b=hlDyzmyVZm8JhvDyLzyMN2vpepfryLI7Ybxv4rkaHSNQ3U6HalTdoQU6RIJbJSfFfH
 wfIgmPwQd7bFAQ5jySSRRwJYbH35+6kUbWpbQ3piMwN+ZNSei+C9KyQhFe8is3ej67Et
 C9o3NEXCYPRest+PFcIdhsQ80LDALf/FI2GtBD9UklucXbK1P0dWpEkPL58JJkC3cG9h
 qBYJIaGoGD0BkBPurR/DH6xcxFw3DiviiW7n63GTgwNM4x50gHvscwmODXiEIXv6Fq9V
 l6EMrkI33CPGXvRUp2U+9ZJLAEWt+GoVS69+iHuBI5IQ9KELFDCFwMyaPk9BU7K52NSN
 f9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asXWAqLgQh8s+3xsYeRk/Ugva04OhPHXs0YtW93L/bE=;
 b=5rARNSm3nsF5yTrxPYKSE6mT5we1HZ+tZcyaVcMvIyKLU57PF0GxVlyot6AxZS65xH
 +PyxVLpgO+sIP8u/Gu9WWW6bKbW4dWavvlLTMWr5AcVldB02XyMUN6BjvSC2ECidHPdC
 bYZwYv/0PlGKumQy1OjYsrVk66iV+gfVh5pfhzSbUESkeox765VLtr3A/ef6hA7e7qbP
 Hn21Ttib+sVuCO9vVLZWQzH34pb3rr553SAU1HCx7MFZ0J7ju5Ie1KavIF61ULXvWYFK
 hr0JtXKRl/mB9Q8+uNTvuBiBcIASQO+chtvnWdU7+CHwHHckiPObmlg/wrXPH04FAf09
 rDYQ==
X-Gm-Message-State: AJIora9Q3bNMB3sJNHwt53C8NPiGLKBijVYX+0utMNn35P2bOuoJKp8u
 OZ2qbWQJj2LiYRj7gMa2BiJdG7Kcg/4=
X-Google-Smtp-Source: AGRyM1siQBtxKgyX1qbvjfrMGVBoiSQJ6wWijutMflZX3SLEoxtmAIAmmPlZuGPFqXFM1HTyovCUCA==
X-Received: by 2002:a5d:490b:0:b0:219:ea1e:1cc6 with SMTP id
 x11-20020a5d490b000000b00219ea1e1cc6mr6498330wrq.410.1655242057170; 
 Tue, 14 Jun 2022 14:27:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b0020c5253d8f7sm12956033wrw.67.2022.06.14.14.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 14:27:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 23:24:46 +0200
Message-Id: <20220614212446.3491084-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614212446.3491084-1-fontaine.fabrice@gmail.com>
References: <20220614212446.3491084-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/netsniff-ng: fix spurious space and
 tab
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix spurious space and tab added by commit
b0f98d5800b288500752ef51b969d9a3cb92e897

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsniff-ng/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 6b043362ba..bbb4172cd3 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -30,5 +30,5 @@ endif
 
 comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS  || \
-			!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
