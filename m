Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AC7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 07:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E95E2830E6;
	Mon, 29 Nov 2021 07:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHQ8jg2wUh7F; Mon, 29 Nov 2021 07:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A6781092;
	Mon, 29 Nov 2021 07:26:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A087C1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90068409FE
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z70BBS1G8FxA for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 07:26:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B1F4409FD
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 07:26:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v11so34539718wrw.10
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 23:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5o3ZfzIiUbu4wNlAgmazKdZ18neyQM4e5u19PnuxczY=;
 b=qWe7l9uPdYPOB9EHuFSDZUtyFDvyYxa03XQz4/PPVTXSE0RlgR3k8R0/EbTJAGKFZ/
 6VBhQyykrKIRnJ7qI9NRYofW6jSTfRXtilTgahQkpm+v8OiqaFYYshNGCibTfKOmPu1r
 25Qb2+DP9HhUmLEB7jSZT55fl9kHYB7DpNceupBQiopJ/ehV/ZjQ920qbO9rC298h9EX
 NIrGeBb/RN968xRFxxFDomi89VNHuGYYvjNQMpjV/isPAPkAbGbRVn610QVIIzFYk/yB
 eBZq8bwptDoTXGEiGrx/ujK7hKBIGSNkgANYnFmW5QHJnoROH22zoZnt8wEbk9ZLmVY4
 QFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5o3ZfzIiUbu4wNlAgmazKdZ18neyQM4e5u19PnuxczY=;
 b=HKRdOg619JSMYNyayoxOdH7PfMa/ORFCgKu6phxhINE27uuZTP0lRarRDlUO/Xaeq3
 Ajsk54dAedyhdd2KhyhAgWoXwZbODfYC3UvHDh2Iph7p7R21MOcOj9ypQVqBD6wiu1g2
 zHth/G72Jj6zj0cZe7LDxPWrfrhGF+nnLzyvymsKd/o4jBS7HZqcW6dKnEq6WjU9gMc2
 zT8iES0TUIS6YnpMayBXcdSihWeaWnyma96c7MiEJiWzk6bjGPdawYvi4i4UfMhixISN
 vmOnG8fv75NDH/ZwP6KgfpT7QPFqg5r+aJPpGDoWvHGQuVqgRyDvGczXm3WsEwX5/NUV
 fXJA==
X-Gm-Message-State: AOAM531NDFk06I/lbC2Tsl1AUxYLHhBxc9y2d2U8k9UwXRd4akh/h0Xo
 14D9tQTJp3z6sb3OvqEKyFQnTCoLYPI=
X-Google-Smtp-Source: ABdhPJwLxQvxY0FmJV2BQX9EGIE4Lugl9tzrQ/3hOu38QL46aVM5F+UhddqEcW+vw/MjnEiVw+PoKQ==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr31376954wrw.151.1638170770157; 
 Sun, 28 Nov 2021 23:26:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o12sm14237200wmq.12.2021.11.28.23.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:26:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 08:23:38 +0100
Message-Id: <20211129072338.2177322-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mender: drop spurious spaces
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious spaces added by commits
948e2c3467da778b7bf9b002f98fe2309a88d65a and
349f5bcfb0ce6cb28f5c678db8a99fee0da5dd63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mender/mender.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index f1366a9deb..ddf3e43be2 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -91,10 +91,10 @@ ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)
 MENDER_DEPENDENCIES += libglib2
 define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
-		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
+		$(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
 
 	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.UpdateManager.conf \
-		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
+		$(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
 endef
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
