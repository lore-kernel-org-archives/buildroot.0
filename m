Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA400C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CC4181842;
	Sat,  4 Dec 2021 22:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXmjkde2kA_w; Sat,  4 Dec 2021 22:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E115A81771;
	Sat,  4 Dec 2021 22:49:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7B771BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6257401AF
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gh7vROoz02fx for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:49:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4374400E9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:49:44 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a9so13785179wrr.8
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 14:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdgdJxWdUaJTMAyDGCjluWy7FtllWQLN8UgacSdJUL4=;
 b=nPZXIr5bSq8nIliDzdb/bjiovkABq0/dqSbVrqnly24KTW7YAqW7vZjflGGFNw7Do+
 EDblfxpW+RqeKiO/9RbUlSksuH2ChklG0Nu+SkxyOtrCJg54tmSlhbd7Z7ArBgzbilM2
 4Y/zxWn0Bh58optYHjIS6+PDwKJusF+Ar5BpzRR54e+2dD4LYY9v1Jricon3VXuweOJ8
 4OWw8q1s9qtWmzQ3i3IB52LxidFQWN9xTkqrQUvbhb03td+Yy+3/v0qYPVR+cLye+n98
 2kDGJArpRAwPeHXdu++GI8GBeX30UbGZEU5cGyAYQdV6iBL3RZiQzoPXx+ZGSbLToiDk
 zh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdgdJxWdUaJTMAyDGCjluWy7FtllWQLN8UgacSdJUL4=;
 b=yK9X4cSbtjI45BndH+1m8wPhpua2ihsg/IryNz5aDTjAxnSh3cWnOu3fHb2SDuLrRT
 zTLWfhk69gOCO2Kgv4GJ5bkW3fUSPZErv8aIgradF580nFIiS699Rjvzp3eiyrPxQ6Nh
 ecnLESBVYKVOcBcN3D7Kbvq78pzoIcY8h7VOgG0ss3OgVgIjWjSWeJLwTwzyjzAoF4Ga
 99sso3JfHY1Nzrk8wKfSq78mQVuqwmPHCM8f8jl2spHnodwKcIFiHhQsgCHFCi0YxuA/
 RORa76vGkXGg98KTU1ClHmSPXmxMagxwwhFI8adL6HhPayT+IyyZ4hpb/nQ9Dr05dQRj
 F32A==
X-Gm-Message-State: AOAM530VxDeq+u4Nubyk9jhXJDQ3y8srb9SC1d8An12swuNoCcZo26xt
 Cn0LtdIx+V4ETG7YLqAW5Fp27pLqiLNb7A==
X-Google-Smtp-Source: ABdhPJxolxkPegbqGWRDGzbGYeTdNb+RJKv1FC3a988zBdEEsTJoEifNuJFl6e1LNlf8VJMVqx633w==
X-Received: by 2002:adf:f907:: with SMTP id b7mr31419607wrr.5.1638658182710;
 Sat, 04 Dec 2021 14:49:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id i17sm7451538wmq.48.2021.12.04.14.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 14:49:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 23:49:50 +0100
Message-Id: <20211204224950.2023162-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/exfat: add EXFAT_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:exfat_project:exfat is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexfat_project%3Aexfat

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfat/exfat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index e23495152e..282a30aa5e 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -10,6 +10,7 @@ EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = libfuse host-pkgconf
 EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
+EXFAT_CPE_ID_VENDOR = exfat_project
 EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 EXFAT_CONF_OPTS += --exec-prefix=/
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
