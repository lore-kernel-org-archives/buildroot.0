Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88EA606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B8y3/+eu;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=DSPHgZb0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C57E080FFF;
	Tue, 27 Oct 2026 16:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fia2kKaCeVOI; Tue, 27 Oct 2026 16:40:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D7C9981011
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119236;
	b=oafVECJ0GBT5dMuCc02+KZYMnv4yf9WguIrQXgeo0KNeEwdPvM5US600U2baEK75C1e6
	 /XAxtuXgz/o/z8sq4COfVDt5xLjuAPPSaUCgZHriJ4WjhCevxny90gS4osA8sqq2orRtR
	 7tJ26ysJa7qTUr5J6WIFlsSWfzVxwmqyDTIZ9NOVj1S8UCSpCzCXmGZf5jp3TjlJ7exbG
	 EkKKtGMDQm9ITLXGHVyexVLPrO0uiu2gSOOJ8mVZXoUXqM3IbrFF2H7pGYVjq48ZaVpNg
	 rO3mh9hT6ynmLSCipUKVMmFVTThf5B/zdL1yrezneuv4Dz7/RYBTrR4FedZuSbPCTHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=3QrRG3TXvjTdQ9hLZAzQvUS9XbkhMx2C7Rjq0/XPWV4=;
	b=XlFezOfe4PoV3B5q5YVg5h9KCJCrRugSGd56ARR5NYb0hbZrzIYmNBiXXEw99+XF+xgV
	 ypd56T5XoSgcwzlYgtyHb8uXMR/gD3YTfGwta2FyceimxZsHwInjsMJ1EAJDHW1WkGwLN
	 SXQm1wEfF7ogh3U/I1uowa91/ItcSBNlQudtNWtw8yPD0kjp6YeQSen834hIRgmE6dQJZ
	 uEqHv04LmIIx3bE89Co+gb9NhU/D7jeYdyT4n2fLVgblxLQ9WrCY4Ol66zYtKRYooUyUV
	 8/NN6z3B6LCBpRTJ4h9vcAmucbrLbPkqEij5OIwuRCmU6N1PNICukIm2R52zXzf6O9g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119235;
	bh=3QrRG3TXvjTdQ9hLZAzQvUS9XbkhMx2C7Rjq0/XPWV4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B8y3/+euyIbCeQBogwe0dnE2fVQS3uUlRti7bxo6NHIHhzOHh5CzBkOlUQSnbTPt8
	 HJFpPV6z39EPZZGyuDTjG0bO/VOYv+X/QB/UUelMpXJjmCQMAwZaZDBrWX88Jq+WmU
	 reKbf2T6yj+KKcoaQtc2i+/GWdwzE0UOmqcVOvhnbWM/B0Z8cCPVlD7CeDsGA3eOj3
	 tnrzeKyTXoghwBKLN3KyM039AZVgjjENlAO8jhCEgjAV/nX5DB7ktm9DtTaVrJRMd+
	 1eLvdrAsrSxqkN1O4uq88QW6toxQsRwssDtDR/1nFz2hGWFapfKEvqP+x/Nhk3Qxzy
	 N7rY7l3tAROCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C9981011;
	Tue, 27 Oct 2026 16:40:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A38F44BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 894A9606CB
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lcd2auZgZzFz for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5CBAF6068F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119223;
 b=Z0E3b0o7DVWsqkv7gKnQNW66RaJKj2k7eBGwUa5HUtFFOZjS2njqttvljvcwt4+3BtKA
 WyScrxdB//EnIOahnEBzpti4WgF0NYgWnHWl85WLEN3ucNfbB+TbJkRiGfh4hr7NyOOfC
 ijEl0XeTczRbRpZ7u3MRV8aOTDANIVPtU7/CEhNUtW2gOPwa30hgvjtDvwBbjNrYSfSsF
 hvXvjz85JDDO+CPK5XxCvu9TaX/nzEo679WHUrF/Yf90shkHiLTCHAD+ZHlwuoMctYP2L
 4w7FfR7so4CpTpQkem6prk2HZSoh90izmPEVf+kWZJtHIZlnUqgklEN+irqlzaJiKjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119223;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pkgpS/6AGOafpRF0vRJAGYJ1fqlAjvtUsE8TUWM5K10=;
 b=K+y8Q4KO7NgzPXa27g2tg4h071/u/eK0l20SBnI31kwOw6UHr1//S3JM1bc5yE7o01L6
 J+JWG53pNqZqWDKEEP3PM5oLJr4fjgRlLzHTgEXoOp/kfryEYDHs8WSc3GWMXYx08ohP8
 VL/YwUFh7QlNQGNi+UdSCdhJAcawbi6UkVDrchtPJoa/r5Ij1uJAMn0JHkSLPw3QIgSiP
 4EWpQtXSjem1nBzHxP16wpRGvEWKPExrX9bS6khZOnYF6PLYntwu0XyGqIzFHjYBx/zeU
 8EwD7xd7q3xseK3cQX8hytnwSDPfwdNsigUybqQCxJ8rIQMywr1b5l0GCqE38MNmxxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DSPHgZb0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DSPHgZb0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CBAF6068F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6ae15688f36so16123a12.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119221; x=1793724021;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pkgpS/6AGOafpRF0vRJAGYJ1fqlAjvtUsE8TUWM5K10=;
 b=DSPHgZb0Ea/56HIGlZBSItYn1FjNR9NgPyKXKXx8sGsrAKTJ5sjtTeR5/pYXsPMu2M
 y5ZMApwA9ge8h1PokJKPJAQ4tJQagKpOIQa81T1I1lXnF65vUlrrWpTZC+ZVvhPUmAoB
 7mfCoyBVFUSa+zPSVjJq01v1yVWwBFa+Y7P0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119221; x=1793724021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pkgpS/6AGOafpRF0vRJAGYJ1fqlAjvtUsE8TUWM5K10=;
 b=FsP8z14e4lHxMUPoin9XEhuSKGCTi0d7JauLVdWK+qWA/2rfM0dsuPd6ZJB7gyC+US
 JUXo5FtV7chsxM2VuKdXGRkHpd0XbWjcpHuCAFCGDG0myNJ0e/GgaWlZPG6LA9eucXBD
 I5/Mm6UJT77uuur7EqhdwBnhGIXHNVccyEYH+LsTiETNgrjk/95REexiotvrK/1tvuNJ
 /6sV0t8dLRxU6b4R9p/G6M2krN3Sth2jAuRxtlGLlnH1Z9ky9JKn8mM5KosBYZq6df6G
 xhxpYkI7k8qjUhKSrAdvJaLwR/NpVoe3Vti85AHDKbUbYVUO2uwEm5h9aIf8y2qbtoAm
 p4+A==
X-Gm-Message-State: AFq9FYJ3nllsn3Q+v3/Hb3NZIOwNBi4WyY1Anzt8wcSw0Gk99gqvihZL
 5A6kTQtcTSVw5uWiuATwCI0kryv1yx4hsVaoW76BhFOvI7xZWLOfok+hQvSDkRi4EVaa/xPco81
 1jt3gp2U=
X-Gm-Gg: AYBFou0iKrzmirt1RHUHIrUBlYuXQ2SOeXGATQpMtJFaBcFtCTa0HTeSk2gOQP/LzQ9
 /F8D31qFChONg6GLuwukRnco8QX8KcIGLb8PhAZ4tNtCXRMCWzRf0nBjF2sE1VPc+Va6PIbAp6d
 gqLajk3WDtuib2urpNJM004w/WB61qjMXDOMagllyPUkqnwYMPob3ghVloj3WhfpAvkFIZKzIMz
 DpeDt/xLSXVtbQ5lXB4N37yvGg/OQSGxd+H46b+3IxTKLU/oM35y8RDqZeJkob9UZ4a0ohzbDG1
 XLa9J8OsSGTQP96l5gm7D9/qJqsL6GWhPn3sClFLo7JXhw40QCnfS40SYmIgMmrQ4r4TtU9/aMd
 20jK9n7iq2tX4DlsALCQBcP5ct5keycCkeSm5TzYG3Tq9mzXCJzlBWN9xyNittD7st5NnS5URH3
 aXi38jU8ul6Noqriw1vMCSSlXNYs4pAucSwwUV46677gxTHfyu0inWq+K/7RAISHe7+ttGNLaCV
 ZYEUeRCKyT0iDrbtYsIzGTX5L5j21groNFhw+5W6wBxwePmq0Of8m3O/Ofx84MoYibwd2vyIAyC
 IVtfeUP/wwX5Wvgw10eokEDB6XvKvNcnJghDSW/5TIVHmwmBLPrFwfT4aKR9VIIyQ/qNCv0IahU
 KkRUiS26Zo0BRhGJQVPg99D95LviqoBM5P54E5VFKI7B3NwxeX3Y6Jbh5RQgPxA==
X-Received: by 2002:a17:906:f1d1:b0:c2e:3698:dbba with SMTP id
 a640c23a62f3a-c46bdc195fbmr1226283766b.4.1793119220994; 
 Tue, 27 Oct 2026 09:40:20 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:04 +0100
Message-ID: <20261027164013.1602502-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 07/14] package/mender-update-modules: add
 persistent-app module
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-update-modules/Config.in        | 18 ++++++++++++++++++
 .../mender-update-modules.mk                   |  9 +++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 97f583e0e2..da0b385457 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -137,6 +137,24 @@ comment "ipk support needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_PERSISTENT_APP
+	bool "persistent-app"
+	help
+	  The Persistent App Update Module installs files to a
+	  user-defined directory on the persistent data partition,
+	  ensuring deployments survive rootfs A/B updates.
+
+	  This module uses the data-partition software filesystem
+	  namespace, which means version tracking in mender
+	  show-provides persists across system updates. When a
+	  rootfs update clears rootfs-image.* provides, the
+	  data-partition.* provides remain intact.
+
+	  The module supports rollback by maintaining backups on
+	  the same persistent partition.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/persistent-app
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # podman
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index 1db47cbd15..f3ea0e15cd 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -36,6 +36,15 @@ ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
 MENDER_UPDATE_MODULES_MODULES += ipk
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PERSISTENT_APP),y)
+MENDER_UPDATE_MODULES_MODULES += persistent-app
+define MENDER_UPDATE_MODULES_INSTALL_MENDER_PERSISTENT_APP_GEN
+	$(INSTALL) -D -m 0755 $(@D)/persistent-app/module-artifact-gen/persistent-app-artifact-gen \
+		$(HOST_DIR)/bin/persistent-app-artifact-gen
+endef
+MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_PERSISTENT_APP_GEN
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN),y)
 MENDER_UPDATE_MODULES_MODULES += podman
 endif
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
