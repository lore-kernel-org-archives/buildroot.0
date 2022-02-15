Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D1DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 07:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 851F940249;
	Tue, 15 Feb 2022 07:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cx9YvHTx_ArU; Tue, 15 Feb 2022 07:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C778740234;
	Tue, 15 Feb 2022 07:08:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F19241BF276
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 07:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECB2C82862
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 07:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfXKzW7Msk4T for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 07:07:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5353282865
 for <buildroot@busybox.net>; Tue, 15 Feb 2022 07:07:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j26so19600414wrb.7
 for <buildroot@busybox.net>; Mon, 14 Feb 2022 23:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLdhJSxp7D7Ka+qtu2/Kc1nCxy0JGv61UqhmXZrJJ6g=;
 b=ZKMP4yfuQNapvDC49Kczho01C0Sjkh9CfmNRwSTwJ3BU44QioGos/n0ue7YoimPcdI
 g/Xd8Y4l9B53WQ8OUEmwT0gPCfOUpuqHXuUHsxbqVIPSOjD9cOCM4K4NqLEVEW0h7ymQ
 cMO3txJxmlrzPDWAmoyF6120s5/WTsUGvzyDra+q/D2i9TnBRwy801ohg3QCR05ADXLz
 5RfKjc3XB9zV2wPqlvUDcuBqC3IjLyQmtedYPRPTZlzDZlYHGWU/J2qOVm/npANpHmkx
 WVrHuZt74TnhNz49L5JbVnaNQeM17GMYXDLduL0i2r7o6Ov23F20XhZDgNelvuN0Eke8
 H9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLdhJSxp7D7Ka+qtu2/Kc1nCxy0JGv61UqhmXZrJJ6g=;
 b=jIh4o8BPBk+GT3EJHJusboojbJbc0MrS4U5NuJAK9DXL+87Cn37mialyVEV9/k+OKu
 TAZu6dki3s+ebManyFEreGTZ65a88IvVoVHp+4Hxh73nmMT4ZYBCrZlKgp+ST3veczSO
 eBRQ404bvP+EHo8u4wiVBbDQHpsMV82m6POqfWJLf7IPFJaio8xTKXArBtAi6I9J+ksr
 GayCpf9fYcazIi94HrPKnQuQ9ZERpSgTU6EEyWUElhMcp9qF7uSCaRwarXw0/dw7LdKE
 asPwz0Ssq4RAgqGUx8R+VozeqtBEzSk+Xk6xCIinBUmR0E7SH4KsghZkX326eywBeMyF
 Qh6Q==
X-Gm-Message-State: AOAM531Lo3+73MpYAkv3NXKdtKPqyH1USP0GJq2osXQYrF9wosWTILwl
 gs9Pvu8TuhXatLwiExwiI+9tNwbtNXY=
X-Google-Smtp-Source: ABdhPJx4m0VFLkTtB8VTCHmQZB0v9jXaja+kiMbnCPBusW4yqvXyMuGQQcPn/cKB19HIS5r/CiSy2w==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr2045267wru.565.1644908872619; 
 Mon, 14 Feb 2022 23:07:52 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id p8sm25458451wro.106.2022.02.14.23.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 23:07:52 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 15 Feb 2022 08:07:39 +0100
Message-Id: <20220215070739.2199760-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220215070739.2199760-1-francois.perrad@gadz.org>
References: <20220215070739.2199760-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/perl-gd: add webp support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/perl-gd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 9787cc12f..cd32c7fb8 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -40,6 +40,12 @@ PERL_GD_OPTIONS += PNG
 PERL_GD_CONF_OPTS += -lib_png_path=$(STAGING_DIR)/usr
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP),y)
+PERL_GD_DEPENDENCIES += webp
+PERL_GD_OPTIONS += WEBP
+PERL_GD_CONF_OPTS += -lib_webp_path=$(STAGING_DIR)/usr
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
 PERL_GD_DEPENDENCIES += xlib_libXpm
 PERL_GD_OPTIONS += XPM
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
